# HL7 Codex: Oncology Prior Authorization

Standards-based oncology prior authorization framework extending Da Vinci CRD/DTR/PAS with mCODE patient context and computable anti-cancer regimen representation.

**Lead use case:** Breast cancer prior authorization  
**Standards basis:** HL7 FHIR R4, Da Vinci Burden Reduction, mCODE, CDS Hooks, CPG-on-FHIR

---

## Documents

### Current work (Iteration 2)

| Document | Audience | Description |
|---|---|---|
| [iteration-2-exec-summary.md](iteration-2-exec-summary.md) | Non-technical / leadership | What we are proposing, why it matters, and what success looks like |
| [iteration-2-oncology-pa-support-codex.md](iteration-2-oncology-pa-support-codex.md) | Builders / standards authors | Proposed CDS Hooks oncology extension, anti-cancer regimen `PlanDefinition` (canonical definition) and `RequestGroup` (ordered instance) profiles, cycle-day timing, sequential phase ordering, and `DataRequirement` pattern for oncology CRD |
| [iteration-2-mcode-gaps.md](iteration-2-mcode-gaps.md) | Builders / standards authors | Breast cancer PA data requirements matrix: mCODE coverage assessment, gap analysis, and recommended modeling actions per data element |

### Historical

| Document | Description |
|---|---|
| [initial-analysis.md](initial-analysis.md) | Initial two-layer model: pre-order guideline CDS + Da Vinci authorization workflow, with shared US Core + mCODE data foundation |

---

## Summary of the Proposal

The framework addresses a structural gap: oncology prior authorization today is disconnected from the clinical evidence and treatment standards that guide care decisions. The result is redundant documentation, delayed authorizations, and inconsistent payer decisions.

The proposed solution has two layers:

1. **Optional Pre-order clinical decision support** — guideline-aligned regimen recommendations surfaced in the EHR before an order is placed, increasing the likelihood that the treatment ordered meets coverage criteria.

2. **Structured authorization exchange** — a CDS Hooks extension for oncology CRD that carries the ordered regimen as a patient-specific `RequestGroup` (with `instantiatesCanonical` referencing the canonical `PlanDefinition` regimen definition) and a computable package of required patient context (diagnosis, staging, biomarkers, disease status, line of therapy) to the coverage decision service.

Both layers share a common data foundation in US Core and mCODE.

The current iteration defines:
- The CDS Hooks extension shape for `order-select` / `order-sign` in oncology CRD
- `OncologyAntiCancerRegimenPlanDefinition` — canonical, reusable regimen protocol
- `OncologyAntiCancerRegimenRequestGroup` — patient-specific ordered instance; carries cycle-day timing and sequential phase ordering (e.g., AC→T); passed as the CDS Hooks hook payload
- A reusable `DataRequirement` / `Library` pattern for oncology PA data requirements
- A breast cancer PA data requirements matrix with gap analysis and recommended actions
- Aligned to CMS-0062-P (April 2026), which extends prior authorization requirements to prescription drugs including oncology chemotherapeutics

---

## Standards Dependencies

| Standard | Role |
|---|---|
| Da Vinci CRD / DTR / PAS | Authorization workflow backbone |
| CDS Hooks (`order-select`, `order-sign`) | Hook points for regimen-level CDS |
| mCODE | Oncology patient data profiles (staging, biomarkers, disease status, medication requests) |
| US Core | Foundational patient / demographics / clinical data profiles |
| FHIR Clinical Reasoning (`PlanDefinition`, `Library`, `DataRequirement`) | Canonical regimen definition, data requirements packaging |
| FHIR `RequestGroup` | Patient-specific ordered regimen instance; CDS Hooks hook payload |
| CPG-on-FHIR | Computable guideline representation for pre-order CDS |
