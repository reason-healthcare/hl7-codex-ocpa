# Example: Line of Therapy — Second-Line Metastatic (Jane Smith) - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Example Observation: Example: Line of Therapy — Second-Line Metastatic (Jane Smith)

Profile: [Line of Therapy Observation](StructureDefinition-line-of-therapy-observation.md)

**status**: Final

**code**: Line of Therapy

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-OGCAPatientExample.md)

**focus**: [Condition Malignant neoplasm of breast](Condition-OGCAMetastaticBreastCancerConditionExample.md)

**effective**: 2027-03-22 --> (ongoing)

**performer**: [Practitioner Maria Lopez (official)](Practitioner-OGCAOncologistExample.md)

**value**: Second-line



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "LineOfTherapySecondLine",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/line-of-therapy-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/us/codex-ocpa/CodeSystem/ocpa-codes",
      "code" : "line-of-therapy",
      "display" : "Line of Therapy"
    }]
  },
  "subject" : {
    "reference" : "Patient/OGCAPatientExample"
  },
  "focus" : [{
    "reference" : "Condition/OGCAMetastaticBreastCancerConditionExample"
  }],
  "effectivePeriod" : {
    "start" : "2027-03-22"
  },
  "performer" : [{
    "reference" : "Practitioner/OGCAOncologistExample"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/us/codex-ocpa/CodeSystem/treatment-line-cs",
      "code" : "2L",
      "display" : "Second-line"
    }]
  }
}

```
