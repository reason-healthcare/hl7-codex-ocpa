# Example: Line of Therapy — Maintenance (Jane Smith, Post-PHD Response) - MOPA — Medical Oncology Prior Authorization v0.1.0

## Example Observation: Example: Line of Therapy — Maintenance (Jane Smith, Post-PHD Response)

Profile: [Line of Therapy Observation](StructureDefinition-line-of-therapy-observation.md)

**status**: Final

**code**: Line of Therapy

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-MOPAPatientExample.md)

**focus**: [Condition Malignant neoplasm of breast](Condition-MOPAMetastaticBreastCancerConditionExample.md)

**effective**: 2027-10-01 --> (ongoing)

**performer**: [Practitioner Maria Lopez (official)](Practitioner-MOPAOncologistExample.md)

**value**: Maintenance



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "LineOfTherapyMaintenance",
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
    "reference" : "Condition/MOPAMetastaticBreastCancerConditionExample"
  }],
  "effectivePeriod" : {
    "start" : "2027-10-01"
  },
  "performer" : [{
    "reference" : "Practitioner/MOPAOncologistExample"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/us/codex-mopa/CodeSystem/treatment-line-cs",
      "code" : "maintenance",
      "display" : "Maintenance"
    }]
  }
}

```
