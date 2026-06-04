### mCODE Gap Proposals

This page captures the data-model gaps identified in the MOPA analysis. Each item is written as an
upstream proposal for mCODE STU5 consideration, with breast cancer PA used as the anchor use case.

**Summary**


| ID | Problem | Proposed solution | Repo artifact |
|---|---|---|---|
| MOPA-MC-001 | No first-class computable regimen definition | Add regimen PlanDefinition profile | `AntiCancerRegimenPlanDefinition` |
| MOPA-MC-002 | No patient-specific regimen instance | Add regimen RequestGroup profile | `AntiCancerRegimenRequestGroup` |
| MOPA-MC-003 | Line of therapy not standardized for sequencing/PA | Add Line of Therapy observation + value set | `LineOfTherapyObservation`, `TreatmentLineCS/VS` |
| MOPA-MC-004 | Regimen intent not explicit | Add regimen intent extension + VS | `RegimenIntentExtension`, `RegimenIntentVS` |
| MOPA-MC-005 | Treatment line as a regimen attribute missing | Add regimen treatment-line extension | `RegimenTreatmentLineExtension` |
| MOPA-MC-006 | Disease context not bound to regimen | Add regimen disease-context extension | `RegimenDiseaseContextExtension` |
| MOPA-MC-007 | No oncology PA data-requirements packaging | Add oncology data-requirements Library pattern | `OncologyDataRequirementsLibrary` |
| MOPA-MC-008 | Biomarker results not PA-normalized | Add normalized biomarker result guidance / profiling | Breast cancer PA guidance |

### MOPA-MC-001 — Regimen definition

**Problem**

mCODE has no first-class computable regimen definition.

**Proposed solution**

Add a regimen `PlanDefinition` profile. This profile would represent anti-cancer treatment plans as computable clinical guidelines that can be used for prior authorization evaluation and order-select decision support.

**Examples**

Canonical regimen definitions from this IG:

- [TH Regimen Definition](PlanDefinition-THRegimenDefinition.html) — Paclitaxel + Trastuzumab (adjuvant HER2+)
- [ddAC→T Regimen Definition](PlanDefinition-DDACTRegimenDefinition.html) — Dose-dense AC then Paclitaxel
- [PHD Regimen Definition](PlanDefinition-PHDRegimenDefinition.html) — Pertuzumab + Trastuzumab + Docetaxel (metastatic HER2+)

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

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — Patient instance: Jane Smith, adjuvant HER2+ breast cancer
- [ddAC→T Regimen Order](RequestGroup-DDACTRegimenOrder.html) — Sequential phase ordering pattern
- [PHD Regimen Order](RequestGroup-PHDRegimenOrder.html) — Metastatic HER2+ with three-agent regimen

Also see: [CDS Hooks order-select Bundle](Bundle-ExampleOrderSelectBundle.html) — Full oncology context payload

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

- [First-Line Adjuvant](Observation-LineOfTherapyFirstLine.html) — Jane Smith, first-line adjuvant treatment
- [Second-Line After Progression](Observation-LineOfTherapySecondLine.html) — Second-line metastatic
- [Maintenance Therapy](Observation-LineOfTherapyMaintenance.html) — Ongoing maintenance line designation

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

- [TH Regimen Definition](PlanDefinition-THRegimenDefinition.html) — adjuvant intent
- [ddAC→T Regimen Definition](PlanDefinition-DDACTRegimenDefinition.html) — adjuvant intent
- [PHD Regimen Definition](PlanDefinition-PHDRegimenDefinition.html) — palliative/metastatic intent

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

- [TH Regimen Definition](PlanDefinition-THRegimenDefinition.html) — first-line treatment
- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — patient-specific first-line instance

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

- [TH Regimen Definition](PlanDefinition-THRegimenDefinition.html) — breast cancer (ER+/HER2+)
- [PHD Regimen Definition](PlanDefinition-PHDRegimenDefinition.html) — metastatic HER2+ breast cancer

**Target destination**

mCODE STU5 regimen extension `RegimenDiseaseContextExtension`.

**Disposition path**

mCODE extension proposal and context modeling review for oncology domain.

### MOPA-MC-007 — Data requirements Library pattern

**Problem**

mCODE has no oncology prior authorization data-requirements packaging pattern.

**Proposed solution**

Add an oncology `Library` pattern that carries `dataRequirement[]` references to the specific observations and conditions needed for PA evaluation.

**Examples**

Oncology data requirements Library pattern from this IG:

- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Full oncology PA data requirements for breast cancer, including observations for staging, biomarkers, and line of therapy

**Target destination**

mCODE STU5 library/profile pattern for oncology data-requirements.

**Disposition path**

mCODE library authoring proposal and implementation guidance for data-requirements-driven workflows.

### MOPA-MC-008 — Biomarker normalization

**Problem**

ER/PR/HER2 biomarker results are not PA-normalized across laboratories and assays in mCODE.

**Proposed solution**

Add normalized biomarker result guidance and profiling to standardize biomarker terminology and thresholds for prior authorization.

**Examples**

Biomarker normalization context is demonstrated in the breast cancer PA examples. See:

- [TH Regimen Order](RequestGroup-THRegimenOrder.html) — HER2+ patient context with biomarker references
- [Breast Cancer PA Data Requirements](Library-BreastCancerPADataRequirements.html) — Biomarker observation data requirements

**Target destination**

mCODE STU5 plus breast cancer PA guidance and biomarker normalization library.

**Disposition path**

mCODE and MOPA breast cancer work stream; this item is net-new guidance pending mCODE STU5 ballot.

### Note on RegimenDaysOfCycle

`RegimenDaysOfCycle` is not a MOPA-MC item. Its real destination is a context-expansion request
against `timing-daysOfCycle` in the HL7 FHIR Extensions pack. Track it with that destination flag
rather than as an mCODE migration candidate.

### See Also

- [Breast Cancer PA](breast-cancer-pa.html) — Detailed breast cancer prior authorization implementation
- [Da Vinci Gap Proposals](davinci-gap-proposals.html) — CRD/DTR/PAS workflow and exchange proposals
- [Use Cases and Actors](use-cases.html) — Two-layer workflow framework for oncology PA
- [Regimen Modeling](regimen-model.html) — Anti-cancer regimen as `PlanDefinition` and `RequestGroup`
- [CDS Hooks Oncology Extension](cds-hooks-extension.html) — CDS Hooks extension for oncology CRD
- [Data Requirements Pattern](data-requirements.html) — Library-based data requirements for CRD/DTR
