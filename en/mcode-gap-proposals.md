# mCODE Gap Proposals - MOPA — Medical Oncology Prior Authorization v0.1.0

## mCODE Gap Proposals

### mCODE Gap Proposals

This page captures the data-model gaps identified in the MOPA analysis. Each item is written as an upstream proposal for mCODE STU5 consideration, with breast cancer PA used as the anchor use case.

**Summary**

| | | | |
| :--- | :--- | :--- | :--- |
| MOPA-MC-001 | No first-class computable regimen definition | Add regimen PlanDefinition profile | `AntiCancerRegimenPlanDefinition` |
| MOPA-MC-002 | No patient-specific regimen instance | Add regimen RequestGroup profile | `AntiCancerRegimenRequestGroup` |
| MOPA-MC-003 | Line of therapy not standardized for sequencing/PA | Add Line of Therapy observation + value set | `LineOfTherapyObservation`,`TreatmentLineCS/VS` |
| MOPA-MC-004 | Regimen intent not explicit | Add regimen intent extension + VS | `RegimenIntentExtension`,`RegimenIntentVS` |
| MOPA-MC-005 | Treatment line as a regimen attribute missing | Add regimen treatment-line extension | `RegimenTreatmentLineExtension` |
| MOPA-MC-006 | Disease context not bound to regimen | Add regimen disease-context extension | `RegimenDiseaseContextExtension` |
| MOPA-MC-007 | No oncology PA data categories pattern | Add oncology data categories pattern for cancer-type PA evaluation | **(no repo artifact — see [Data Requirements](data-requirements.md))** |
| MOPA-MC-008 | Biomarker results not PA-normalized | Add normalized biomarker result guidance / profiling | Breast cancer PA guidance |

### MOPA-MC-001 — Regimen definition

**Problem**

mCODE has no first-class computable regimen definition.

**Proposed solution**

Add a regimen `PlanDefinition` profile. This profile would represent anti-cancer treatment plans as computable clinical guidelines that can be used for prior authorization evaluation and order-select decision support.

**Examples**

Canonical regimen definitions from this IG:

* [TH Regimen Definition](PlanDefinition-THRegimenDefinition.md) — Paclitaxel + Trastuzumab (adjuvant HER2+)
* [ddAC→T Regimen Definition](PlanDefinition-DDACTRegimenDefinition.md) — Dose-dense AC then Paclitaxel
* [PHD Regimen Definition](PlanDefinition-PHDRegimenDefinition.md) — Pertuzumab + Trastuzumab + Docetaxel (metastatic HER2+)

**Target destination**

mCODE STU5 regimen `PlanDefinition` profile in the mCODE Implementation Guide.

**Disposition path**

mCODE work group proposal and ballot-ready profile design for STU5.

### MOPA-MC-002 — Regimen instance

**Problem**

mCODE has no patient-specific regimen instance representation.

**Proposed solution**

Add a regimen `RequestGroup` profile that carries the instantiated regimen definition for a specific patient, including the ordered components and lifecycle state.

**Examples**

Patient-specific regimen orders from this IG (CRD order-select context):

* [TH Regimen Order](RequestGroup-THRegimenOrder.md) — Patient instance: Jane Smith, adjuvant HER2+ breast cancer
* [ddAC→T Regimen Order](RequestGroup-DDACTRegimenOrder.md) — Sequential phase ordering pattern
* [PHD Regimen Order](RequestGroup-PHDRegimenOrder.md) — Metastatic HER2+ with three-agent regimen

Also see: [CDS Hooks order-select Bundle](Bundle-ExampleOrderSelectBundle.md) — Full oncology context payload

**Target destination**

mCODE STU5 regimen `RequestGroup` profile.

**Disposition path**

mCODE work group proposal and instance-model review for STU5 ballot.

### MOPA-MC-003 — Line of therapy

**Problem**

Line of therapy is not standardized for sequencing or prior authorization workflows.

**Proposed solution**

Add a line-of-therapy observation plus value set that captures the treatment sequence index in metastatic or recurrent disease.

**Examples**

Line of therapy observations from this IG:

* [First-Line Adjuvant](Observation-LineOfTherapyFirstLine.md) — Jane Smith, first-line adjuvant treatment
* [Second-Line After Progression](Observation-LineOfTherapySecondLine.md) — Second-line metastatic
* [Maintenance Therapy](Observation-LineOfTherapyMaintenance.md) — Ongoing maintenance line designation

**Target destination**

mCODE STU5 observation resource `LineOfTherapyObservation` and value set `TreatmentLineCS/VS`.

**Disposition path**

mCODE terminology and profile coordination for sequencing semantics.

### MOPA-MC-004 — Regimen intent

**Problem**

Regimen intent is not explicit in mCODE, creating ambiguity about treatment goals.

**Proposed solution**

Add a regimen intent extension and value set to capture curative, adjuvant, neoadjuvant, palliative, or prophylactic intent.

**Examples**

Regimen intent is demonstrated across the regimen PlanDefinition examples in this IG:

* [TH Regimen Definition](PlanDefinition-THRegimenDefinition.md) — adjuvant intent
* [ddAC→T Regimen Definition](PlanDefinition-DDACTRegimenDefinition.md) — adjuvant intent
* [PHD Regimen Definition](PlanDefinition-PHDRegimenDefinition.md) — palliative/metastatic intent

**Target destination**

mCODE STU5 regimen extension `RegimenIntentExtension` and value set `RegimenIntentVS`.

**Disposition path**

mCODE extension proposal and clinical semantics review within the mCODE work group.

### MOPA-MC-005 — Treatment line extension

**Problem**

Treatment line as a regimen attribute is missing from mCODE profile design.

**Proposed solution**

Add a regimen treatment-line extension that captures the therapy sequence in the context of a specific regimen instance.

**Examples**

Treatment line is captured in both regimen PlanDefinition and RequestGroup examples:

* [TH Regimen Definition](PlanDefinition-THRegimenDefinition.md) — first-line treatment
* [TH Regimen Order](RequestGroup-THRegimenOrder.md) — patient-specific first-line instance

**Target destination**

mCODE STU5 regimen extension `RegimenTreatmentLineExtension`.

**Disposition path**

mCODE extension proposal and sequencing semantics discussion with guideline authorities.

### MOPA-MC-006 — Disease context extension

**Problem**

Disease context is not bound to regimen in mCODE, limiting the specificity of regimen definitions.

**Proposed solution**

Add a regimen disease-context extension that captures cancer type, stage, molecular subtype, and relevant clinical context.

**Examples**

Disease context examples across the regimen definitions:

* [TH Regimen Definition](PlanDefinition-THRegimenDefinition.md) — breast cancer (ER+/HER2+)
* [PHD Regimen Definition](PlanDefinition-PHDRegimenDefinition.md) — metastatic HER2+ breast cancer

**Target destination**

mCODE STU5 regimen extension `RegimenDiseaseContextExtension`.

**Disposition path**

mCODE extension proposal and context modeling review for oncology domain.

### MOPA-MC-007 — Oncology PA data categories pattern

**Problem**

mCODE has no standard pattern for declaring which specific observations and conditions are required for a given cancer type's prior authorization evaluation. Implementers building oncology CRD services have no mCODE-grounded way to enumerate the clinical data categories (staging, biomarkers, line of therapy, etc.) relevant to a specific cancer PA decision.

**Proposed solution**

Add an oncology data categories pattern to mCODE — as structured canonical guidance that declares per-cancer-type clinical data elements needed for PA evaluation. This would give CRD service implementers a standards-grounded reference for what to query when evaluating a given cancer type. MOPA documents the categories in this IG's [Data Requirements](data-requirements.md) page; mCODE STU5 would formalize them.

**Examples**

* [Breast Cancer PA](breast-cancer-pa.md) — Data categories for breast cancer PA: diagnosis, staging, ER/PR/HER2, line of therapy, performance status, prior therapy
* [Data Requirements](data-requirements.md) — MOPA's current data categories table

**Target destination**

mCODE STU5 — oncology data categories pattern for PA evaluation.

**Disposition path**

mCODE clinical informatics review; coordinate with Da Vinci CRD/DTR work groups.

### MOPA-MC-008 — Biomarker normalization

**Problem**

ER/PR/HER2 biomarker results are not PA-normalized across laboratories and assays in mCODE.

**Proposed solution**

Add normalized biomarker result guidance and profiling to standardize biomarker terminology and thresholds for prior authorization.

**Examples**

Biomarker normalization context is demonstrated in the breast cancer PA examples. See:

* [TH Regimen Order](RequestGroup-THRegimenOrder.md) — HER2+ patient context with biomarker references
* [Breast Cancer PA](breast-cancer-pa.md) — Biomarker data categories for PA evaluation

**Target destination**

mCODE STU5 plus breast cancer PA guidance and biomarker normalization library.

**Disposition path**

mCODE and MOPA breast cancer work stream; this item is net-new guidance pending mCODE STU5 ballot.

### Note on RegimenDaysOfCycle

`RegimenDaysOfCycle` is not a MOPA-MC item. Its real destination is a context-expansion request against `timing-daysOfCycle` in the HL7 FHIR Extensions pack. Track it with that destination flag rather than as an mCODE migration candidate.

### See Also

* [Breast Cancer PA](breast-cancer-pa.md) — Detailed breast cancer prior authorization implementation
* [Da Vinci Gap Proposals](davinci-gap-proposals.md) — CRD/DTR/PAS workflow and exchange proposals
* [Use Cases and Actors](use-cases.md) — Two-layer workflow framework for oncology PA
* [Regimen Modeling](regimen-model.md) — Anti-cancer regimen as `PlanDefinition` and `RequestGroup`
* [CRD Workflow](cds-workflow.md) — How the CRD service queries the EHR for oncology context
* [Data Requirements](data-requirements.md) — Oncology data categories queried during CRD evaluation

