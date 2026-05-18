# Example: Metastatic HER2+ Breast Cancer (Stage IV) - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Example Condition: Example: Metastatic HER2+ Breast Cancer (Stage IV)

Profile: [Primary Cancer Condition Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-primary-cancer-condition.html)

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Problem List Item

**code**: Malignant neoplasm of breast

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-OGCAPatientExample.md)

**onset**: 2026-02-10



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "OGCAMetastaticBreastCancerConditionExample",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-category",
      "code" : "problem-list-item"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Malignant neoplasm of breast"
    }]
  },
  "subject" : {
    "reference" : "Patient/OGCAPatientExample"
  },
  "onsetDateTime" : "2026-02-10"
}

```
