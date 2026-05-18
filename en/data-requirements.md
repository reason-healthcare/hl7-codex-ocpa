# Data Requirements Pattern - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Data Requirements Pattern

### Overview

A key design principle of this IG is that **CRD and DTR are driven by the same data requirements artifact**. CRD uses it to determine whether pre-approval can be evaluated. DTR uses it to collect or prepopulate missing patient context.

This eliminates the divergence that occurs when CRD rules and DTR questionnaires are based on separate logic.

### The Separation of Concerns

```
RequestGroup      ← what is being ordered (patient-specific regimen instance)
PlanDefinition    ← the canonical regimen definition the RequestGroup instantiates
Library.dataRequirement[]  ← what patient data is needed to evaluate the order
Bundle / FHIR API ← the actual patient data supplied or retrieved
Questionnaire     ← DTR collection instrument for missing data

```

### DataRequirement Entries

Patient context requirements are expressed using the FHIR `DataRequirement` datatype. Each entry specifies:

* Resource type
* Expected profile(s)
* Code filters (for Observations requiring specific codes)
* Date filters and recency rules
* Must-support elements

### OncologyDataRequirementsLibrary

A `Library` resource acts as a versioned, governable wrapper for `DataRequirement[]` entries. The base profile is designed to be **instantiated once per cancer type**. Each instance declares the data requirements specific to that cancer's PA evaluation logic.

```
OncologyDataRequirementsLibrary          ← base profile (cancer-agnostic)
  ├── BreastCancerPADataRequirementsLibrary  ← Use Case 1 (defined in this IG)
  ├── LungCancerPADataRequirementsLibrary    ← Use Case 2 (future)
  ├── ColorectalCancerPADataRequirementsLibrary  ← Use Case 3 (future)
  ├── LeukemiaPADataRequirementsLibrary      ← Use Case 4 (future)
  └── ...

```

The base profile requires `Library.dataRequirement` (1..*) and `Library.subject[x]` (cancer type). Authoring a new cancer-type use case means creating a new `Library` instance conforming to this base profile with a `subjectCodeableConcept` bound to the target cancer type (SNOMED CT) and `dataRequirement[]` entries reflecting that cancer's PA-relevant clinical data elements.

### CRD Usage

The Library is the single source of truth for what patient data a CRD service requires. At discovery time, a conformant CDS Service derives two artifacts from it — a `prefetch` map for standard EHR clients and a canonical Library reference in the discovery extension for OGCA-aware clients. See [CDS Service Discovery](cds-hooks-extension.md#cds-service-discovery) for the full discovery pattern and conformance requirements.

```
Clinician selects regimen
  → RequestGroup (instantiatesCanonical → PlanDefinition)
  → DataRequirement[] from Library or inline extension
  → Patient context evaluated (prefetch or FHIR query)
  → CRD returns cards

```

### DTR Usage

The DTR Client uses the same Library to:

1. Select or generate the appropriate`Questionnaire`
1. Prepopulate known answers from the patient record
1. Collect only the genuinely missing data

### Requirement Categories

All cancer-specific Library instances SHALL declare requirements covering these categories where applicable:

| | |
| :--- | :--- |
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

[Use Case 1: Breast Cancer Prior Authorization](breast-cancer-pa.md) — the first cancer-specific `OncologyDataRequirementsLibrary` instance, including data requirements matrix, staging constraints, and priority gaps.

[CDS Service Discovery](cds-hooks-extension.md#cds-service-discovery) — how the Library drives both the `prefetch` map and the OGCA discovery extension, and the conformance requirements for CDS Services and Clients.

