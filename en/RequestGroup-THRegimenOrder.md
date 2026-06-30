# Example Regimen Order: TH (Jane Smith, Adjuvant HER2+) — Typical - MOPA — Medical Oncology Prior Authorization v0.1.0

## Example RequestGroup: Example Regimen Order: TH (Jane Smith, Adjuvant HER2+) — Typical

Profile: [Anti-Cancer Regimen RequestGroup](StructureDefinition-anticancer-regimen-requestgroup.md)

**Regimen Intent**: Adjuvant - intent

**Regimen Treatment Line**: First-line

**instantiatesCanonical**: [TH: Paclitaxel + Trastuzumab (Weekly) — Adjuvant HER2+ Breast Cancer](PlanDefinition-THRegimenDefinition.md)

**status**: Draft

**intent**: Order

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-MOPAPatientExample.md)

> **action**
> **id**paclitaxel-th-action
**title**: Paclitaxel 80 mg/m² IV — days 1, 8, 15 of 21-day cycle**timing**: Once per 21 days**resource**: [MedicationRequest: status = draft; intent = order; medication[x] = paclitaxel](MedicationRequest-PaclitaxelMedRequestTH.md)

> **action**
> **id**trastuzumab-th-action
**title**: Trastuzumab IV — days 1, 8, 15 of 21-day cycle**timing**: Once per 21 days**resource**: [MedicationRequest: status = draft; intent = order; medication[x] = trastuzumab](MedicationRequest-TrastuzumabMedRequestTH.md)



## Resource Content

```json
{
  "resourceType" : "RequestGroup",
  "id" : "THRegimenOrder",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/ocpa-regimen-intent",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "373846009",
        "display" : "Adjuvant - intent"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/ocpa-regimen-treatment-line",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/us/codex-mopa/CodeSystem/treatment-line-cs",
        "code" : "1L",
        "display" : "First-line"
      }]
    }
  }],
  "instantiatesCanonical" : ["http://hl7.org/fhir/us/codex-mopa/PlanDefinition/THRegimenDefinition"],
  "status" : "draft",
  "intent" : "order",
  "subject" : {
    "reference" : "Patient/MOPAPatientExample"
  },
  "action" : [{
    "id" : "paclitaxel-th-action",
    "title" : "Paclitaxel 80 mg/m² IV — days 1, 8, 15 of 21-day cycle",
    "timingTiming" : {
      "extension" : [{
        "extension" : [{
          "url" : "day",
          "valueInteger" : 1
        },
        {
          "url" : "day",
          "valueInteger" : 8
        },
        {
          "url" : "day",
          "valueInteger" : 15
        }],
        "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/regimen-days-of-cycle"
      }],
      "repeat" : {
        "period" : 21,
        "periodUnit" : "d"
      }
    },
    "resource" : {
      "reference" : "MedicationRequest/PaclitaxelMedRequestTH"
    }
  },
  {
    "id" : "trastuzumab-th-action",
    "title" : "Trastuzumab IV — days 1, 8, 15 of 21-day cycle",
    "timingTiming" : {
      "extension" : [{
        "extension" : [{
          "url" : "day",
          "valueInteger" : 1
        },
        {
          "url" : "day",
          "valueInteger" : 8
        },
        {
          "url" : "day",
          "valueInteger" : 15
        }],
        "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/regimen-days-of-cycle"
      }],
      "repeat" : {
        "period" : 21,
        "periodUnit" : "d"
      }
    },
    "resource" : {
      "reference" : "MedicationRequest/TrastuzumabMedRequestTH"
    }
  }]
}

```
