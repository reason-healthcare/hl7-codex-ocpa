# Example: Docetaxel MedicationRequest (PHD regimen, draft) - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Example MedicationRequest: Example: Docetaxel MedicationRequest (PHD regimen, draft)

Profile: [Cancer-Related Medication Request Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-cancer-related-medication-request.html)

**status**: Draft

**intent**: Order

**medication**: docetaxel

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-OGCAPatientExample.md)

**requester**: [Practitioner Maria Lopez (official)](Practitioner-OGCAOncologistExample.md)

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-OGCAMetastaticBreastCancerConditionExample.md)

### DosageInstructions

| | |
| :--- | :--- |
| - | **Text** |
| * | 75 mg/m² IV day 1 of each 21-day cycle |



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "DocetaxelMedRequestPHD",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-related-medication-request"]
  },
  "status" : "draft",
  "intent" : "order",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://www.nlm.nih.gov/research/umls/rxnorm",
      "code" : "72962",
      "display" : "docetaxel"
    }]
  },
  "subject" : {
    "reference" : "Patient/OGCAPatientExample"
  },
  "requester" : {
    "reference" : "Practitioner/OGCAOncologistExample"
  },
  "reasonReference" : [{
    "reference" : "Condition/OGCAMetastaticBreastCancerConditionExample"
  }],
  "dosageInstruction" : [{
    "text" : "75 mg/m² IV day 1 of each 21-day cycle"
  }]
}

```
