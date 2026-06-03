# MOPA Gap Analysis

**Project:** MOPA — Medical Oncology Prior Authorization
**Purpose:** Identify gaps in DaVinci (CRD/DTR/PAS) and mCODE that block oncology
prior authorization, and frame each as a proposal for upstream adoption. This IG
becomes informative, anchored by the breast cancer use case.

This analysis is anchored to the actual MOPA artifacts already in the repository.
The codebase already separates two artifact classes — **data-model artifacts**
(tagged "mCODE Migration Candidate" in `input/fsh/mcode-candidates/`) and
**workflow/exchange artifacts** (the CDS Hooks oncology extension keyed
`org.hl7.davinci-crd.oncology`, plus the data-requirements-driven discovery). That
separation is the DaVinci-vs-mCODE split.

## Proposal ID conventions

- **DaVinci:** `MOPA-DV-CRD-###`, `MOPA-DV-DTR-###`, `MOPA-DV-PAS-###`
- **mCODE:** `MOPA-MC-###`
- Each proposal: **Problem** (gap in current spec), **Proposed solution**,
  **Examples**, plus destination/repo-artifact traceability.

---

## DaVinci gap proposals (workflow / exchange)

### CRD

#### MOPA-DV-CRD-001 — Oncology regimen context on CRD hooks
- **Problem:** CRD `order-select`/`order-sign` are service/medication-oriented;
  oncology coverage is decided at the regimen level. CRD has no way to carry "this
  order is a multi-agent regimen instance + its canonical definition."
- **Proposed solution:** Adopt the `org.hl7.davinci-crd.oncology` extension
  (`orderedRegimen` → RequestGroup, optional `regimenDefinition` → PlanDefinition)
  as a CRD-defined oncology profile of the hook request.
- **Examples:** `RequestGroup/breast-cancer-regimen-001` with `regimenDefinition`
  canonical; order-select Bundle (`Bundle-ExampleOrderSelectBundle`).
- **Repo artifact:** `cds-hooks-extension.md`, CdsHooksBundles examples.

#### MOPA-DV-CRD-002 — Data-requirements-driven discovery for CRD
- **Problem:** CRD discovery (`/cds-services`) advertises `prefetch`, but there is no
  standard way to tie prefetch + a structured data-requirements artifact to a clinical
  domain (cancer type), so each payer hand-rolls prefetch.
- **Proposed solution:** Standardize a two-layer discovery pattern: Layer 1 `prefetch`
  projection + Layer 2 `dataRequirementsLibraries`/`supportedRegimenProfiles` extension,
  both derived from one `Library.dataRequirement[]`.
- **Examples:** Discovery JSON with `primaryCancer`/`biomarkers`/`lineOfTherapy`
  prefetch keys.
- **Repo artifact:** `cds-hooks-extension.md` (CDS Service Discovery).

#### MOPA-DV-CRD-003 — Oncology coverage outcome semantics
- **Problem:** CRD coverage-information outcomes don't express oncology branch states
  (guideline-concordant vs. needs-DTR vs. PA-required vs. alternative-required) computably.
- **Proposed solution:** Define an oncology outcome classification (codes or
  coverage-information constraint) for CRD responses.
- **Examples:** "Regimen meets policy — no PA"; "Conditionally covered pending HER2
  evidence"; "Alternative regimen required."

### DTR

#### MOPA-DV-DTR-001 — Shared data-requirements Library drives DTR
- **Problem:** CRD rules and DTR questionnaires routinely diverge because they are
  authored from separate logic.
- **Proposed solution:** Standardize that DTR `$questionnaire-package` selection and
  prepopulation are driven by the *same* `OncologyDataRequirementsLibrary` CRD used
  (single source of truth).
- **Examples:** `data-requirements.md` pattern — one Library → CRD sufficiency check +
  DTR question generation.

#### MOPA-DV-DTR-002 — Reusable oncology question modules
- **Problem:** Same clinical evidence (ER/PR/HER2, stage, prior lines) is re-encoded
  per payer form.
- **Proposed solution:** Define canonical reusable DTR sub-form modules per evidence
  domain that payers compose.
- **Examples:** Shared HER2 IHC/ISH module; prior-lines-of-therapy module.

#### MOPA-DV-DTR-003 — Structured exception / contraindication capture
- **Problem:** Medical-necessity exceptions arrive as free text / attachments.
- **Proposed solution:** Standard DTR structured answer patterns for
  intolerance/contraindication aligned to PA adjudication.
- **Examples:** "Prior intolerance to agent X + supporting Observation"; structured
  contraindication reason.

### PAS

#### MOPA-DV-PAS-001 — Regimen-level structured submission
- **Problem:** PAS Claim `supportingInfo` can carry resources, but regimen
  identity/linkage isn't first-class in adjudication.
- **Proposed solution:** PAS guidance/profile to reference the regimen RequestGroup +
  canonical PlanDefinition and adjudicate at regimen scope with item detail.
- **Examples:** `Claim.supportingInfo` → RequestGroup instance + DTR
  QuestionnaireResponse.

#### MOPA-DV-PAS-002 — Oncology pend / additional-info taxonomy
- **Problem:** PEND and additional-info reasons are operationally variable; not granular
  for oncology work queues.
- **Proposed solution:** Constrained oncology reason taxonomy.
- **Examples:** "Need biomarker result"; "Need prior-therapy failure evidence"; "Need
  stage clarification."

#### MOPA-DV-PAS-003 — Regimen-change update semantics
- **Problem:** Dose/schedule/component substitutions are common; PAS update/continuity
  semantics are inconsistent.
- **Proposed solution:** Explicit PAS update guidance preserving auth trace across
  regimen changes.
- **Examples:** Component substitution retains authorization; cycle-timing change
  doesn't force restart unless policy-critical.

---

## mCODE gap proposals (data model)

Each below already exists in the repo under `input/fsh/mcode-candidates/` tagged
**mCODE Migration Candidate (STU5)**.

| ID | Problem (mCODE gap) | Proposed solution | Repo artifact |
|---|---|---|---|
| **MOPA-MC-001** | No first-class computable regimen *definition* | Add regimen PlanDefinition profile | `AntiCancerRegimenPlanDefinition` |
| **MOPA-MC-002** | No patient-specific regimen *instance* | Add regimen RequestGroup profile | `AntiCancerRegimenRequestGroup` |
| **MOPA-MC-003** | Line of therapy not standardized for sequencing/PA | Add Line of Therapy observation + value set | `LineOfTherapyObservation`, `TreatmentLineCS/VS` |
| **MOPA-MC-004** | Regimen intent (curative/adjuvant/neoadjuvant/palliative) not explicit | Add regimen intent extension + VS | `RegimenIntentExtension`, `RegimenIntentVS` |
| **MOPA-MC-005** | Treatment line as a regimen attribute missing | Add regimen treatment-line extension | `RegimenTreatmentLineExtension` |
| **MOPA-MC-006** | Disease context not bound to regimen | Add regimen disease-context extension | `RegimenDiseaseContextExtension` |
| **MOPA-MC-007** | No oncology PA data-requirements packaging | Add oncology data-requirements Library pattern | `OncologyDataRequirementsLibrary` |
| **MOPA-MC-008** | Biomarker results not PA-normalized (ER/PR/HER2) | Add normalized biomarker result guidance/profiling | (net-new — see `breast-cancer-pa.md`) |

### Edge cases / notes

- **Biomarker normalization (MOPA-MC-008)** has no artifact yet — net-new work.
- **`RegimenDaysOfCycle`** lives in `mcode-candidates` but its real destination is a
  **context-expansion request against `timing-daysOfCycle` in the HL7 FHIR Extensions
  pack**, not mCODE. Track it on the mCODE page with an explicit "destination: FHIR
  Extensions pack" flag rather than a `MOPA-MC` ID, to avoid mislabeling.

---

## Source basis

- DaVinci CRD 2.2.1 (hooks, deviations, cards, conformance)
- DaVinci DTR 2.2.0 (specification, questionnaire-package / next-question operations)
- DaVinci PAS 2.2.1 (use cases, Claim $submit specification, artifacts)
- mCODE STU4 (treatment group, profiles/extensions/value sets)
- Repo MOPA artifacts: `input/fsh/mcode-candidates/`, `input/pagecontent/`
