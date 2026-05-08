
### Context

This page defines **Use Case 1** — the first concrete instantiation of the OGCA data requirements
pattern for a specific cancer type. It serves as the template for subsequent use cases (lung,
colorectal, hematologic malignancies, and others). Each future use case follows the same structure:
a cancer-specific `OncologyDataRequirementsLibrary` derivative with its own `dataRequirement[]`
entries, mCODE coverage assessment, gap analysis, and recommended profiles.

### Scope

This use case covers systemic anti-cancer therapy authorization for breast cancer, including:
- Early-stage (adjuvant and neoadjuvant) chemotherapy and targeted therapy
- Metastatic breast cancer systemic therapy (all lines)
- HER2-directed therapy, endocrine therapy, CDK4/6 inhibitors, PARP inhibitors,
  immunotherapy (PD-L1+), and antibody-drug conjugates

### Important Note on Staging

mCODE supports AJCC/TNM-based staging through cancer stage and TNM-specific profiles. The gap
for breast cancer PA is **not** basic staging representation. The gap is PA-specific profiling:

- Whether **clinical stage** or **pathologic stage** is required
- Whether the **AJCC stage group** is sufficient or T/N/M components are needed
- Which **AJCC edition / staging method** is acceptable
- How staging is linked to the primary breast cancer condition and evidence source
- How to distinguish **current disease state** from historical diagnosis stage

### BreastCancerPADataRequirementsLibrary

The `Library.subjectCodeableConcept` is bound to SNOMED CT code
`254837009 "Malignant tumor of breast"`.

#### Required DataRequirement categories

| Category | Requirement group | mCODE basis | Coverage | Gap / Action |
|---|---|---|---|---|
| **Diagnosis** | Primary breast cancer condition | `mcode-primary-cancer-condition` | Strong | Add breast cancer value set binding and laterality expectation |
| **Staging** | AJCC TNM stage group | `mcode-tnm-stage-group` | Strong foundation | Constrain to clinical or pathologic stage; specify accepted AJCC edition |
| **Staging** | T / N / M categories | `mcode-tnm-primary-tumor-category`, `mcode-tnm-regional-nodes-category`, `mcode-tnm-distant-metastases-category` | Strong foundation | Require when stage group alone is insufficient for authorization logic |
| **Biomarkers** | ER status | `mcode-tumor-marker-test` | Strong foundation | Bind to breast-specific ER value set; normalize positive/negative/percent |
| **Biomarkers** | PR status | `mcode-tumor-marker-test` | Strong foundation | Same as ER |
| **Biomarkers** | HER2 status | `mcode-tumor-marker-test` | Strong foundation | Distinguish IHC vs ISH/FISH; consider HER2-low profile |
| **Disease status** | Current disease status / progression | `mcode-cancer-disease-status` | Strong foundation | Require evidence date and prior treatment association |
| **Regimen** | Ordered anti-cancer regimen | `OncologyAntiCancerRegimenRequestGroup` | **New — defined in this IG** | MVP artifact; `instantiatesCanonical` → PlanDefinition |
| **Performance** | ECOG performance status | `mcode-ecog-performance-status` | Strong | Conditional — add lookback period guidance |
| **Therapy history** | Prior systemic therapy | mCODE cancer-related medication profiles | Strong for events | Add class-based value sets for HER2-directed, endocrine, CDK4/6, taxane, anthracycline |
| **Therapy context** | Line of therapy | New profile / extension | **Missing in mCODE** | Define `OncologyLineOfTherapy`; require for metastatic/recurrent settings |
| **Therapy context** | Treatment setting | Regimen extension | **Weak in mCODE** | Add `regimenIntent` / `treatmentSetting` extension on PlanDefinition |
| **Genomics** | BRCA1/2 status | `mcode-genomic-variant`, `mcode-genomics-report` | Partial | Require germline vs somatic distinction; conditional for PARP inhibitor authorization |
| **Exceptions** | Contraindication / intolerance | `AllergyIntolerance`, `Condition` | Partial | Define exception profile with reference to avoided drug/regimen |
| **Exceptions** | Exception documentation | DTR `QuestionnaireResponse` | Generic | Drive from DTR when structured evidence is unavailable |

### Priority Gaps

| Gap | Why High Priority | Proposed Artifact |
|---|---|---|
| Regimen as first-class object | Oncology PA is regimen-centered, not drug-order-centered | `OncologyAntiCancerRegimenRequestGroup` (MVP) + `OncologyAntiCancerRegimenPlanDefinition` |
| Line of therapy | Required for metastatic sequencing and payer policy | `OncologyLineOfTherapy` Observation or regimen extension |
| Treatment setting | Most breast cancer logic branches by setting | `regimenIntent` / `treatmentSetting` extension on PlanDefinition |
| Staging constraints | PA needs clinical vs pathologic stage, T/N/M, AJCC edition | Breast cancer PA staging slice in `Library.dataRequirement[]` |
| Biomarker normalization | ER/PR/HER2 observations need PA-ready normalized values | Breast-specific value sets and result normalization rules |
| Exception documentation | Needed when guideline-concordant care requires exception | DTR `QuestionnaireResponse` + structured exception/contraindication profile |

### See Also

- [Regimen Modeling](regimen-model.html) — `RequestGroup` and `PlanDefinition` profiles
- [Data Requirements Pattern](data-requirements.html) — Library pattern and CRD/DTR reuse
- [mCODE STU4](http://hl7.org/fhir/us/mcode) — mCODE profiles referenced throughout
