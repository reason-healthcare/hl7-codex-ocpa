# OGCA Reference Application — Phased Implementation Plan

## Overview

A monorepo reference implementation demonstrating the complete OGCA workflow across six
actors. Each actor is a separate Next.js application sharing common packages. The goal is a
runnable, demo-quality reference that exercises every interface defined in the IG.

---

## Architecture

### Monorepo (Turborepo + pnpm)

```
reference-app/
├── apps/
│   ├── ehr/              # Oncology EHR — patient chart, ordering UI, SMART launch host
│   ├── smart-app/        # Layer 1 CDS SMART App — gap analysis, regimen options
│   ├── crd-service/      # CRD Service — CDS Hooks server, Library host
│   ├── dtr-client/       # DTR Client — questionnaire, prepopulation, QR persistence
│   ├── pas-service/      # PAS Service — $submit, routing, ClaimResponse
│   └── payer-backend/    # Payer Backend — policy evaluation, determination
└── packages/
    ├── fhir-client/      # Typed FHIR R4 client + FHIR proxy utility
    ├── cds-hooks/        # CDS Hooks types, discovery, request/response helpers
    ├── cql-engine/       # cql-execution wrapper + FHIR data provider
    ├── smart-auth/       # SMART on FHIR OAuth flow (EHR launch + standalone)
    └── ui/               # Shared Tailwind/shadcn components (EHR chrome, PA form shell)
```

### FHIR Proxy Pattern

Every app exposes `/api/fhir/[...path]` routes that proxy to a configured upstream FHIR
server. The upstream base URL is an environment variable — any FHIR R4 server works. Custom
operations and prototype-specific overrides are intercepted before proxying.

### CQL Execution

CQL is compiled offline to ELM JSON using the CQL-to-ELM translator (Java toolchain).
The compiled ELM is committed to the repo. The `cql-engine` package wraps
`cql-execution` + `cql-fhir-data-provider` for runtime evaluation in Node.js. The same
engine is used by the CRD Service (coverage evaluation) and the CDS SMART App (eligibility
rules).

---

## Technology Stack

| Concern | Choice |
|---|---|
| Monorepo | Turborepo + pnpm |
| Framework | Next.js 14 (App Router) |
| Styling | Tailwind + shadcn/ui |
| FHIR types + validation | `@reasonhealth/fhir-zod/r4` — Zod schemas with inferred TypeScript types; replaces `@types/fhir` and standalone Zod FHIR schemas |
| CQL runtime | `cql-execution` + `cql-fhir-data-provider` |
| OAuth | Custom SMART on FHIR (NextAuth.js as base) |
| FHIR server | HAPI FHIR (Docker) — swappable via env var |
| Orchestration | Docker Compose |

### `@reasonhealth/fhir-zod` notes

Provides Zod schemas for FHIR R4/R4B/R5 with inferred TypeScript types. The `fhir-client`
shared package re-exports from `@reasonhealth/fhir-zod/r4` as the single import point
across the monorepo. All FHIR server responses are parsed through Zod schemas at the proxy
boundary.

```ts
import { PatientSchema, ObservationSchema } from '@reasonhealth/fhir-zod/r4'
import type { Patient, Observation } from '@reasonhealth/fhir-zod/r4'

// Runtime validation at proxy boundary
const patient = PatientSchema.parse(rawJson)
```

---

## Guideline and Payer Policy

Two separate `Library` resources containing CQL compiled to ELM JSON, hosted on the CRD
Service.

### Guideline Library — `BreastCancerGuideline.cql`
- **Input:** cancer type, stage, biomarkers, ECOG PS, line of therapy, prior therapy
- **Output:** set of approvable regimens with rationale
- **Used by:** CDS SMART App (Layer 1 regimen options) and CRD Service (pre-approval)

### Payer Policy Library — `BreastCancerPayerPolicy.cql`
- **Input:** same clinical context + submitted regimen
- **Output:** `approved` / `pending` / `denied` + reason code
- **Used by:** CRD Service (pre-approval evaluation) and Payer Backend (PA adjudication)

The `OncologyDataRequirementsLibrary` from the IG defines the required data elements.
These CQL Libraries define the rules evaluated over those elements.

---

## Local Ports

| App | Port |
|---|---|
| EHR | 4000 |
| CDS SMART App | 4001 |
| CRD Service | 4002 |
| DTR Client | 4003 |
| PAS Service | 4004 |
| Payer Backend | 4005 |
| HAPI FHIR | 8080 |

---

## Phased Plan

### Phase 1 — Foundation
**Goal:** Everything runs locally, FHIR data is accessible, proxy works.

- Turborepo + pnpm scaffold: all 6 apps + all packages stubbed
- Docker Compose: HAPI FHIR + all 6 apps
- `fhir-client` package: typed fetch wrapper using `@reasonhealth/fhir-zod/r4`, proxy
  route template (`/api/fhir/[...path]`)
- Patient fixtures loaded into HAPI: Jane Smith with breast cancer condition, staging,
  ECOG PS, line of therapy, prior therapy; HER2 intentionally absent
- EHR app: read-only patient chart (Demographics, Problem List, Observations) confirming
  FHIR proxy works
- All other apps: placeholder landing page

**Done when:** `docker compose up` → browse EHR → see Jane Smith's chart pulling from HAPI.

---

### Phase 2 — CRD Service + EHR Order Entry
**Goal:** End-to-end Layer 2 loop fires and returns a card. No CQL, no auth.

- `cds-hooks` package: discovery types, request/response types, prefetch executor
- CRD Service:
  - `GET /cds-services` — discovery with prefetch templates + OGCA extension
  - `POST /cds-services/oncology-crd` — order-select and order-sign handler
  - `GET /Library/BreastCancerPADataRequirements` — Library resource endpoint
  - Hardcoded completeness check (checks prefetch keys populated, no CQL yet)
  - Returns pre-approved card or DTR launch card
- EHR app:
  - Order Entry page: regimen selector (TH / ddAC→T / PHD)
  - Fires `order-select` with prefetch on selection, displays returned card inline
  - Sign button fires `order-sign`

**Done when:** Select TH regimen → order-select → DTR card (HER2 missing). Add HER2 to
HAPI manually → order-select → pre-approved card.

---

### Phase 3 — CQL Guideline + Payer Policy
**Goal:** Rules are computable, not hardcoded.

- Author `BreastCancerGuideline.cql` and `BreastCancerPayerPolicy.cql`
- Compile both to ELM JSON and commit
- `cql-engine` package: wrapper around `cql-execution` + FHIR data provider wired to proxy
- CRD Service: replace hardcoded checks with CQL evaluation
- Library resources updated to include ELM JSON

**Done when:** Change HER2 to negative in HAPI → CRD correctly denies. Change back to
positive → CRD approves. Logic is fully driven by CQL.

---

### Phase 4 — SMART OAuth
**Goal:** Real SMART on FHIR auth for all SMART app launches.

- `smart-auth` package: authorization code flow, PKCE, token storage, scopes
- EHR app acts as SMART authorization server:
  - `/.well-known/smart-configuration`
  - `/authorize` and `/token` endpoints
  - Issues launch tokens, enforces patient-scoped access
- CDS SMART App: EHR launch + standalone launch support
- DTR Client: EHR launch with `appContext`
- All FHIR proxy routes: validate bearer token before proxying
- `SMART_AUTH_BYPASS=true` env flag retained for Phases 1–3 compatibility

**Done when:** "Launch CDS App" in EHR → real OAuth redirect → token issued → SMART app
queries FHIR with scoped token.

---

### Phase 5 — CDS SMART App (Layer 1)
**Goal:** Full Layer 1 workflow functional.

- EHR launch → read primary cancer condition → fetch Library → parallel DataRequirement
  queries
- Gap analysis UI: present/missing table per DataRequirement
- Missing item input: inline form, HER2 selector for demo case
- Conditional `POST /Observation` write-back:
  - Write-back supported: persists Observation; subsequent order-select prefetch finds it
  - Write-back not supported: holds in session; serves as DTR questionnaire pre-fill
- Regimen options: CQL guideline evaluation → approvable regimen table
- Provider selects regimen → deep-link to EHR order-set

**Done when:** Launch CDS App from Jane Smith chart → gap shows HER2 missing → enter IHC
3+ → write-back → regimen options appear → select TH → lands in EHR order entry.

---

### Phase 6 — DTR Client
**Goal:** DTR round-trip closes the incomplete-context path.

- Receives SMART EHR launch with `appContext` (Library canonical + missing requirements)
- Questionnaire generation: constructs `Questionnaire` from Library `DataRequirement[]`
  for missing items only
- CQL-driven prepopulation for items already present in FHIR server
- Renders only genuinely missing questions (HER2 in demo case)
- On submit: saves `QuestionnaireResponse` to EHR FHIR server, posts feedback to CRD
- EHR: on DTR completion re-triggers order-select (or enables sign)

**Done when:** CRD returns DTR card → launch DTR → HER2 question → submit → QR saved →
EHR re-evaluates → pre-approved.

---

### Phase 7 — PAS Service + Payer Backend
**Goal:** PA-required path produces a structured determination.

- PAS Service:
  - `POST /fhir/$submit` — validates PA Bundle, routes to Payer Backend
  - Returns `ClaimResponse` to EHR
- Payer Backend:
  - CQL policy evaluation (reuses `cql-engine` package)
  - Returns approved / pended / denied with reason
- CRD Service: PA-required card includes link to trigger PAS submission
- EHR: PA submission UI showing ClaimResponse determination

**Done when:** CRD returns PA-required card → submit → Payer Backend evaluates CQL →
ClaimResponse returned with approval.

---

### Phase 8 — Integration, Polish, Docs
**Goal:** Demo-ready reference implementation.

- Full scenario scripted end-to-end: Jane Smith, TH regimen, all three paths:
  1. Happy path (all context present → pre-approved at order-select)
  2. DTR path (HER2 missing → DTR → complete → pre-approved at order-sign)
  3. PAS path (PA required → submit → payer determination)
- EHR UI polish: patient banner, nav, PA form shell
- Docker Compose profiles: `dev` (hot reload) and `demo` (production build)
- `.env.example` per app
- README: architecture diagram, setup steps, scenario walkthrough
- Automated smoke test: hits each service's key endpoint in sequence

---

## Open Questions

1. **FHIR server** — use HAPI Docker for all phases, or is there an existing server to
   point at for early phases?
2. **CQL authoring** — draft CQL for review, or will CQL be authored separately?
3. **Auth bypass** — confirm `SMART_AUTH_BYPASS=true` env flag acceptable for Phases 1–3?
4. **EHR chrome** — establish patient banner + nav in Phase 1, or minimal read-only chart
   is sufficient?
5. **DTR/PAS** — build minimal shims or wrap existing Da Vinci reference implementations?

---

## Risks and Mitigations

| Risk | Mitigation |
|---|---|
| CQL-to-ELM requires Java toolchain | Pre-compile ELM JSON and commit; runtime is pure Node.js |
| SMART auth is complex | Phase 4 is self-contained; `SMART_AUTH_BYPASS` flag for earlier phases |
| DTR Questionnaire generation is underspecified | Start with static Questionnaire derived from Library; dynamic generation in Phase 8 |
| Da Vinci PAS Bundle structure is complex | Stub with simplified Bundle in Phase 7; align to full spec in Phase 8 |
| HAPI is heavyweight for local dev | Provide lightweight in-memory fixture server as alternative for Phases 1–3 |
