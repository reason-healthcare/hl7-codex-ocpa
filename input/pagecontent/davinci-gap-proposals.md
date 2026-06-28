This page captures the workflow and exchange gaps identified for Da Vinci CRD, DTR, and PAS.
Each item is written as an upstream proposal for HL7 work group consideration.

**Must-have** items are blocking — the MOPA workflow cannot function without them being addressed
upstream. **Nice-to-have** items improve interoperability and operational quality but are not
blocking for a pilot implementation.

**Summary**


| ID | Target | Proposal | Priority |
|---|---|---|---|
| MOPA-DV-CRD-001 | CRD | Oncology coverage outcome semantics | Nice-to-have |
| MOPA-DV-CRD-002 | CRD | `RequestGroup` as the PA unit in CRD hooks | **Must-have** |
| MOPA-DV-DTR-001 | DTR | `RequestGroup` as the order subject in DTR | **Must-have** |
| MOPA-DV-DTR-002 | DTR | Structured exception / contraindication capture | Nice-to-have |
| MOPA-DV-PAS-001 | PAS | Regimen-level structured submission | **Must-have** |
| MOPA-DV-PAS-002 | PAS | Oncology pend / additional-info taxonomy | Nice-to-have |
| MOPA-DV-PAS-003 | PAS | Regimen-change update semantics | Nice-to-have |

### CRD


#### MOPA-DV-CRD-001 — Oncology coverage outcome semantics

**Priority: Nice-to-have**

**Problem**

CRD coverage-information outcomes do not express oncology branch states computably, such as
guideline-concordant, needs DTR, PA required, or alternative required.

**Proposed solution**

Define an oncology outcome classification for CRD responses. The key states to express computably:

- **Authorization Satisfied** — PA conditions have been evaluated by the CRD service and PA can be bypassed (the regimen meets coverage criteria). This is distinct from "no PA required" (PA is categorically never required for this service).
- **DTR required** — context is incomplete; launch DTR to collect missing documentation
- **PA required** — context is complete but criteria are not met; submit via PAS
- **Cannot evaluate** — the CRD service lacks sufficient information to make a determination

**Examples**

Coverage outcome semantics are demonstrated in the regimen order examples:

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient context with biomarker status (HER2+) informing coverage decision
- [Breast Cancer PA](breast-cancer-pa.html) — Data categories driving sufficiency checks

**Target destination**

[CRD Workflow](cds-workflow.html).

**Disposition path**

CRD work group issue and response-card model discussion.

#### MOPA-DV-CRD-002 — `RequestGroup` as the PA unit in CRD hooks

**Priority: Must-have**

**Problem**

CRD `order-select` and `order-sign` hooks are defined around individual order resources
(`MedicationRequest`, `ServiceRequest`, `DeviceRequest`). Oncology prior authorization is
evaluated at the **regimen level** — the entire multi-drug protocol (`RequestGroup`) is the
unit being authorized, not individual medications within it. There is no standard way for a
CRD hook to carry a `RequestGroup` as the primary PA subject, and no guidance on how a CRD
service should evaluate authorization at regimen scope rather than per-medication.

**Proposed solution**

Define guidance for including a `RequestGroup` in `context.draftOrders` and `context.selections`
as the primary authorization unit, with the CRD service evaluating the regimen as a whole.
Clarify that component `MedicationRequest` resources within the `RequestGroup` actions are
subordinate to the regimen-level authorization decision, not independent PA subjects.

**Examples**

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient-specific regimen instance as the PA unit
- [CRD Workflow](cds-workflow.html) — How the `RequestGroup` is placed in `context.draftOrders`

**Target destination**

Da Vinci CRD IG — hook context guidance and `RequestGroup` support.

**Disposition path**

CRD work group review; may require a hook definition amendment or a new oncology-specific
hook context profile.

### DTR


#### MOPA-DV-DTR-001 — `RequestGroup` as the order subject in DTR

**Priority: Must-have**

**Problem**

DTR's `$questionnaire-package` operation selects a questionnaire based on an `order` parameter
tied to a specific order resource type (`MedicationRequest`, `ServiceRequest`, etc.). The
`QuestionnaireResponse` produced by DTR is likewise linked back to the individual order. For
oncology, the authorization subject is the regimen (`RequestGroup`), not the individual
`MedicationRequest` components within it. There is currently no standard way to:

- Pass a `RequestGroup` as the `order` parameter to `$questionnaire-package`
- Associate the completed `QuestionnaireResponse` with the `RequestGroup` as the
  authorization unit
- Ensure the DTR launch context carries the correct regimen reference when CRD returns
  a DTR launch card for a regimen-level decision

**Proposed solution**

Extend DTR guidance to support `RequestGroup` as a valid order subject for
`$questionnaire-package` and `QuestionnaireResponse` linkage. Define how the DTR launch
context (via `appContext` on the CRD card) carries the `RequestGroup` reference, and how
the resulting `QuestionnaireResponse` is associated with the regimen rather than individual
component medications.

**Examples**

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Regimen instance that is the DTR subject when HER2 status is missing
- [CRD Workflow](cds-workflow.html) — DTR launch card returned when context is incomplete

**Target destination**

Da Vinci DTR IG — `$questionnaire-package` operation definition and launch context guidance.

**Disposition path**

DTR work group review; likely requires an amendment to the `$questionnaire-package` operation
parameters and the DTR launch context specification.

#### MOPA-DV-DTR-002 — Structured exception / contraindication capture

**Priority: Nice-to-have**

**Problem**

Medical-necessity exceptions arrive as free text or attachments.

**Proposed solution**

Standard DTR structured answer patterns for intolerance and contraindication aligned to PA
adjudication.

**Examples**

Structured exception capture is demonstrated in patient context examples:

- [MOPA Patient Example](Patient-MOPAPatientExample.html) — Patient with oncology context
- [Metastatic Breast Cancer Condition](Condition-MOPAMetastaticBreastCancerConditionExample.html) — Disease state supporting contraindication documentation

**Target destination**

[Breast Cancer PA](breast-cancer-pa.html) and [Data Requirements](data-requirements.html).

**Disposition path**

DTR work group and payer implementation feedback loop.

### PAS


#### MOPA-DV-PAS-001 — Regimen-level structured submission

**Priority: Must-have**

**Problem**

PAS `Claim.supportingInfo` can carry resources, but regimen identity and linkage are not
first-class in adjudication.

**Proposed solution**

Define PAS guidance/profile to reference the regimen `RequestGroup` plus canonical
`PlanDefinition`, and adjudicate at regimen scope with item detail.

**Examples**

Regimen-level submission is demonstrated in the regimen order examples:

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient-specific regimen with full drug component linkage
- [Line of Therapy Observation](Observation-LineOfTherapyFirstLine.html) — Supporting evidence for PA adjudication

**Target destination**

[Regimen Modeling](regimen-model.html).

**Disposition path**

PAS work group and claim submission profile discussion.

#### MOPA-DV-PAS-002 — Oncology pend / additional-info taxonomy

**Priority: Nice-to-have**

**Problem**

PEND and additional-info reasons are operationally variable and not granular enough for oncology
work queues.

**Proposed solution**

Constrain the operational reason set with an oncology-specific taxonomy.

**Examples**

Oncology pend taxonomy and additional-info requirements are defined by the data requirements pattern:

- [Breast Cancer PA](breast-cancer-pa.html) — Granular data categories that map to pend reasons (biomarker result, prior-therapy failure, stage clarification)

**Target destination**

[Breast Cancer PA](breast-cancer-pa.html).

**Disposition path**

PAS work group and payer operations review.

#### MOPA-DV-PAS-003 — Regimen-change update semantics

**Priority: Nice-to-have**

**Problem**

Dose, schedule, and component substitutions are common, but PAS update and continuity semantics are
inconsistent.

**Proposed solution**

Add explicit PAS update guidance that preserves authorization trace across regimen changes.

**Examples**

Regimen-change update semantics are demonstrated across the regimen order examples:

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Component substitution pattern
- [ddAC→T Regimen Order](RequestGroup-DDACTRegimenOrder.html) — Sequential phase changes preserving authorization continuity

**Target destination**

[Regimen Modeling](regimen-model.html) and [Breast Cancer PA](breast-cancer-pa.html).

**Disposition path**

PAS work group and operational policy discussion.

**See Also**

- [Breast Cancer PA](breast-cancer-pa.html)
- [mCODE Gap Proposals](mcode-gap-proposals.html)
