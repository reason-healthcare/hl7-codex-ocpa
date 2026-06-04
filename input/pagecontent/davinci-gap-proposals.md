This page captures the workflow and exchange gaps identified for Da Vinci CRD, DTR, and PAS.
Each item is written as an upstream proposal for HL7 work group consideration.

**Summary**


| ID | Target | Proposal |
|---|---|---|
| MOPA-DV-CRD-001 | CRD | Oncology regimen context on CRD hooks |
| MOPA-DV-CRD-002 | CRD | Data-requirements-driven discovery for CRD |
| MOPA-DV-CRD-003 | CRD | Oncology coverage outcome semantics |
| MOPA-DV-DTR-001 | DTR | Shared data-requirements Library drives DTR |
| MOPA-DV-DTR-002 | DTR | Reusable oncology question modules |
| MOPA-DV-DTR-003 | DTR | Structured exception / contraindication capture |
| MOPA-DV-PAS-001 | PAS | Regimen-level structured submission |
| MOPA-DV-PAS-002 | PAS | Oncology pend / additional-info taxonomy |
| MOPA-DV-PAS-003 | PAS | Regimen-change update semantics |

### CRD


#### MOPA-DV-CRD-001 — Oncology regimen context on CRD hooks

**Problem**

CRD `order-select`/`order-sign` are service/medication-oriented; oncology coverage is decided at
the regimen level and needs a way to carry regimen identity plus canonical definition together.

**Proposed solution**

Adopt the `org.hl7.davinci-crd.oncology` extension (`orderedRegimen` → `RequestGroup`, optional
`regimenDefinition` → `PlanDefinition`) as a CRD-defined oncology profile of the hook request.

**Examples**

CDS Hooks bundles from this IG demonstrating oncology context:

- [order-select Bundle](Bundle-ExampleOrderSelectBundle.html) — Full oncology context with `RequestGroup` regimen instance and canonical `PlanDefinition`
- [order-sign Bundle](Bundle-ExampleOrderSignBundle.html) — Order-sign with regimen context

Also see:
- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient-specific regimen instance with treatment context
- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Data requirements driving the oncology hook

**Target destination**

[CDS Hooks Oncology Extension](cds-hooks-extension.html) and [Regimen Modeling](regimen-model.html).

**Disposition path**

CRD work group review, CDS Hooks discussion, and Jira-backed ballot proposal tracking.

#### MOPA-DV-CRD-002 — Data-requirements-driven discovery for CRD

**Problem**

CRD discovery (`/cds-services`) advertises `prefetch`, but there is no standard way to tie
prefetch plus structured data requirements to a clinical domain such as cancer type.

**Proposed solution**

Standardize a two-layer discovery pattern: Layer 1 `prefetch` projection plus Layer 2
`dataRequirementsLibraries` / `supportedRegimenProfiles` extension, both derived from one
`Library.dataRequirement[]`.

**Examples**

Data requirements Library pattern driving CRD discovery from this IG:

- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Defines `dataRequirement[]` for cancer type, biomarkers, and line of therapy
- [order-select Bundle](Bundle-ExampleOrderSelectBundle.html) — Prefetch keys populated from data requirements

**Target destination**

[CDS Hooks Oncology Extension](cds-hooks-extension.html) and [Data Requirements Pattern](data-requirements.html).

**Disposition path**

CRD work group and CDS Hooks discovery maintenance path.

#### MOPA-DV-CRD-003 — Oncology coverage outcome semantics

**Problem**

CRD coverage-information outcomes do not express oncology branch states computably, such as
guideline-concordant, needs DTR, PA required, or alternative required.

**Proposed solution**

Define an oncology outcome classification for CRD responses, either as response codes or a
constrained coverage-information profile.

**Examples**

Coverage outcome semantics are demonstrated in the regimen order examples:

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient context with biomarker status (HER2+) informing coverage decision
- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Data requirements driving sufficiency checks

**Target destination**

[CDS Hooks Oncology Extension](cds-hooks-extension.html).

**Disposition path**

CRD work group issue and response-card model discussion.

### DTR


#### MOPA-DV-DTR-001 — Shared data-requirements Library drives DTR

**Problem**

CRD rules and DTR questionnaires diverge when they are authored from separate logic.

**Proposed solution**

Standardize that DTR `$questionnaire-package` selection and prepopulation are driven by the same
`OncologyDataRequirementsLibrary` used by CRD.

**Examples**

Shared `Library` driving both CRD and DTR from this IG:

- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Single Library driving CRD sufficiency and DTR question generation

**Target destination**

[Data Requirements Pattern](data-requirements.html).

**Disposition path**

DTR work group and implementation guide proposal tracking.

#### MOPA-DV-DTR-002 — Reusable oncology question modules

**Problem**

The same clinical evidence is re-encoded per payer form.

**Proposed solution**

Define canonical reusable DTR sub-form modules per evidence domain that payers compose.

**Examples**

Reusable oncology modules are encoded in the data requirements Library from this IG:

- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Modular data requirements for HER2 biomarker, prior therapy, and line of therapy

**Target destination**

[Data Requirements Pattern](data-requirements.html).

**Disposition path**

DTR work group review and questionnaire architecture discussion.

#### MOPA-DV-DTR-003 — Structured exception / contraindication capture

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

[Breast Cancer PA](breast-cancer-pa.html) and [Data Requirements Pattern](data-requirements.html).

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

[Regimen Modeling](regimen-model.html) and [CDS Hooks Oncology Extension](cds-hooks-extension.html).

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

- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Granular data requirements that map to pend reasons (biomarker result, prior-therapy failure, stage clarification)

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
