# Example: Line of Therapy — First-Line Adjuvant (Jane Smith) - MOPA — Medical Oncology Prior Authorization v0.1.0

## Example Observation: Example: Line of Therapy — First-Line Adjuvant (Jane Smith)

Profile: [Line of Therapy Observation](StructureDefinition-line-of-therapy-observation.md)

**status**: Final

**code**: Line of Therapy

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-MOPAPatientExample.md)

**focus**: [Condition Malignant neoplasm of breast](Condition-MOPABreastCancerConditionExample.md)

**effective**: 2026-01-15 --> (ongoing)

**performer**: [Practitioner Maria Lopez (official)](Practitioner-MOPAOncologistExample.md)

**value**: First-line



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "LineOfTherapyFirstLine",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/codex-mopa/StructureDefinition/line-of-therapy-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/us/codex-mopa/CodeSystem/ocpa-codes",
      "code" : "line-of-therapy",
      "display" : "Line of Therapy"
    }]
  },
  "subject" : {
    "reference" : "Patient/MOPAPatientExample"
  },
  "focus" : [{
    "reference" : "Condition/MOPABreastCancerConditionExample"
  }],
  "effectivePeriod" : {
    "start" : "2026-01-15"
  },
  "performer" : [{
    "reference" : "Practitioner/MOPAOncologistExample"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/us/codex-mopa/CodeSystem/treatment-line-cs",
      "code" : "1L",
      "display" : "First-line"
    }]
  }
}

```
