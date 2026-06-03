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

[`order-select example bundle`](Bundle-ExampleOrderSelectBundle.html) with a
`RequestGroup/breast-cancer-regimen-001` instance and canonical `regimenDefinition`.

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

Discovery JSON with `primaryCancer`, `biomarkers`, and `lineOfTherapy` prefetch keys.

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

"Regimen meets policy — no PA"; "Conditionally covered pending HER2 evidence";
"Alternative regimen required."

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

One `Library` drives CRD sufficiency checks and DTR question generation.

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

Shared HER2 IHC/ISH module; prior-lines-of-therapy module.

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

"Prior intolerance to agent X + supporting Observation"; structured contraindication reason.

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

`Claim.supportingInfo` → `RequestGroup` instance plus DTR `QuestionnaireResponse`.

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

"Need biomarker result"; "Need prior-therapy failure evidence"; "Need stage clarification."

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

Component substitution retains authorization; cycle-timing change does not force restart unless
policy-critical.

**Target destination**

[Regimen Modeling](regimen-model.html) and [Breast Cancer PA](breast-cancer-pa.html).

**Disposition path**

PAS work group and operational policy discussion.

**See Also**

- [Breast Cancer PA](breast-cancer-pa.html)
- [mCODE Gap Proposals](mcode-gap-proposals.html)
