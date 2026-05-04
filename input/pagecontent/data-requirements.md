# Data Requirements Pattern

### Overview

A key design principle of this IG is that **CRD and DTR are driven by the same data requirements
artifact**. CRD uses it to determine whether pre-approval can be evaluated. DTR uses it to collect
or prepopulate missing patient context.

This eliminates the divergence that occurs when CRD rules and DTR questionnaires are based on
separate logic.

### The Separation of Concerns

```
RequestGroup      ← what is being ordered (patient-specific regimen instance)
PlanDefinition    ← the canonical regimen definition the RequestGroup instantiates
Library.dataRequirement[]  ← what patient data is needed to evaluate the order
Bundle / FHIR API ← the actual patient data supplied or retrieved
Questionnaire     ← DTR collection instrument for missing data
```

### DataRequirement Entries

Patient context requirements are expressed using the FHIR `DataRequirement` datatype. Each entry
specifies:
- Resource type
- Expected profile(s)
- Code filters (for Observations requiring specific codes)
- Date filters and recency rules
- Must-support elements

### OncologyDataRequirementsLibrary

A `Library` resource acts as a versioned, governable wrapper for `DataRequirement[]` entries.

```
OncologyDataRequirementsLibrary          ← base profile (abstract-like)
  ├── BreastCancerPADataRequirementsLibrary
  ├── LungCancerPADataRequirementsLibrary    (future)
  ├── ColorectalCancerPADataRequirementsLibrary  (future)
  └── ...
```

The base profile requires `Library.dataRequirement` (1..*) and `Library.subject[x]` (cancer type).

### CRD Usage

```
Clinician selects regimen
  → RequestGroup (instantiatesCanonical → PlanDefinition)
  → DataRequirement[] from Library or inline extension
  → Patient context evaluated (prefetch or FHIR query)
  → CRD returns cards
```

### DTR Usage

The DTR Client uses the same Library to:
1. Select or generate the appropriate `Questionnaire`
2. Prepopulate known answers from the patient record
3. Collect only the genuinely missing data

### Requirement Categories

All cancer-specific Library instances SHALL declare requirements covering these categories where
applicable:

| Category | Purpose |
|---|---|
| Primary cancer condition | Identify the cancer diagnosis being treated |
| Stage / extent of disease | Determine disease setting and treatment appropriateness |
| Biomarkers | Cancer-specific treatment selectors |
| Treatment setting | Adjuvant, neoadjuvant, metastatic, recurrent, maintenance |
| Line of therapy | Current treatment sequence for sequencing rules |
| Prior therapy | Prior systemic, surgical, and radiation treatment history |
| Performance status | Eligibility for selected regimen |
| Exceptions / contraindications | Medical necessity and alternative documentation |
| Ordered regimen | Link patient context to selected anti-cancer regimen instance |

### See Also

[Breast Cancer Prior Authorization](breast-cancer-pa.html) for the first cancer-specific Library
instance.
