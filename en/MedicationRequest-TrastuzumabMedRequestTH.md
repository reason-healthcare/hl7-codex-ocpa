# Example: Trastuzumab MedicationRequest (TH regimen, draft) - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Example MedicationRequest: Example: Trastuzumab MedicationRequest (TH regimen, draft)

Profile: [Cancer-Related Medication Request Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-cancer-related-medication-request.html)

**status**: Draft

**intent**: Order

**medication**: trastuzumab

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-OGCAPatientExample.md)

**requester**: [Practitioner Maria Lopez (official)](Practitioner-OGCAOncologistExample.md)

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-OGCABreastCancerConditionExample.md)

### DosageInstructions

| | |
| :--- | :--- |
| - | **Text** |
| * | 4 mg/kg IV loading dose week 1, then 2 mg/kg IV weekly |



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "TrastuzumabMedRequestTH",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-related-medication-request"]
  },
  "status" : "draft",
  "intent" : "order",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://www.nlm.nih.gov/research/umls/rxnorm",
      "code" : "224905",
      "display" : "trastuzumab"
    }]
  },
  "subject" : {
    "reference" : "Patient/OGCAPatientExample"
  },
  "requester" : {
    "reference" : "Practitioner/OGCAOncologistExample"
  },
  "reasonReference" : [{
    "reference" : "Condition/OGCABreastCancerConditionExample"
  }],
  "dosageInstruction" : [{
    "text" : "4 mg/kg IV loading dose week 1, then 2 mg/kg IV weekly"
  }]
}

```
