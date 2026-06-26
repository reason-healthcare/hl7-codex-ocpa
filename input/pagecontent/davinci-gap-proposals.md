This page captures the workflow and exchange gaps identified for Da Vinci CRD, DTR, and PAS.
Each item is written as an upstream proposal for HL7 work group consideration.

**Summary**


| ID | Target | Proposal |
|---|---|---|
| MOPA-DV-CRD-001 | CRD | Oncology coverage outcome semantics |
| MOPA-DV-DTR-001 | DTR | Structured exception / contraindication capture |
| MOPA-DV-PAS-001 | PAS | Regimen-level structured submission |
| MOPA-DV-PAS-002 | PAS | Oncology pend / additional-info taxonomy |
| MOPA-DV-PAS-003 | PAS | Regimen-change update semantics |

### CRD


#### MOPA-DV-CRD-001 — Oncology coverage outcome semantics

**Problem**

CRD coverage-information outcomes do not express oncology branch states computably, such as
guideline-concordant, needs DTR, PA required, or alternative required.

**Proposed solution**

Define an oncology outcome classification for CRD responses, either as response codes or a
constrained coverage-information profile.

**Examples**

Coverage outcome semantics are demonstrated in the regimen order examples:

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient context with biomarker status (HER2+) informing coverage decision
- [Breast Cancer PA](breast-cancer-pa.html) — Data categories driving sufficiency checks

**Target destination**

[CRD Workflow](cds-hooks-extension.html).

**Disposition path**

CRD work group issue and response-card model discussion.

### DTR


#### MOPA-DV-DTR-001 — Structured exception / contraindication capture

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
