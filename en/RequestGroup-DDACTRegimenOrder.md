# Example Regimen Order: ddAC→T (Jane Smith, Adjuvant) — Sequential Phases - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Example RequestGroup: Example Regimen Order: ddAC→T (Jane Smith, Adjuvant) — Sequential Phases

Profile: [Anti-Cancer Regimen RequestGroup](StructureDefinition-anticancer-regimen-requestgroup.md)

**Regimen Intent**: Adjuvant - intent

**Regimen Treatment Line**: First-line

**instantiatesCanonical**: [ddAC→T: Dose-Dense Doxorubicin/Cyclophosphamide then Paclitaxel — Adjuvant Breast Cancer](PlanDefinition-DDACTRegimenDefinition.md)

**status**: Draft

**intent**: Order

**subject**: [Jane Smith (official) Female, DoB: 1968-04-15 ( http://hospital.example.org/patients#MRN-78432)](Patient-OGCAPatientExample.md)

> **action**
> **id**ac-phase-order
**title**: AC Phase (Cycles 1–4, q14d)**timing**: Count 4 times, Once per 14 days
> **action**
> **id**doxorubicin-action
**title**: Doxorubicin 60 mg/m² IV day 1**timing**: Once per 14 days**resource**: [MedicationRequest: status = draft; intent = order; medication[x] = doxorubicin](MedicationRequest-DoxorubicinMedRequestDDACT.md)

> **action**
> **id**cyclophosphamide-action
**title**: Cyclophosphamide 600 mg/m² IV day 1**timing**: Once per 14 days**resource**: [MedicationRequest: status = draft; intent = order; medication[x] = cyclophosphamide](MedicationRequest-CyclophosphamideMedRequestDDACT.md)

> **action**
> **id**t-phase-order
**title**: T Phase — Paclitaxel (Cycles 5–8, q14d)

### RelatedActions

| | | |
| :--- | :--- | :--- |
| - | **ActionId** | **Relationship** |
| * | ac-phase-order | After End |

**timing**: Count 4 times, Once per 14 days
> **action**
> **id**paclitaxel-t-action
**title**: Paclitaxel 175 mg/m² IV day 1**timing**: Once per 14 days**resource**: [MedicationRequest: status = draft; intent = order; medication[x] = paclitaxel](MedicationRequest-PaclitaxelMedRequestTPHase.md)



## Resource Content

```json
{
  "resourceType" : "RequestGroup",
  "id" : "DDACTRegimenOrder",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-requestgroup"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-intent",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "373846009",
        "display" : "Adjuvant - intent"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-treatment-line",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/us/codex-ocpa/CodeSystem/treatment-line-cs",
        "code" : "1L",
        "display" : "First-line"
      }]
    }
  }],
  "instantiatesCanonical" : ["http://hl7.org/fhir/us/codex-ocpa/PlanDefinition/DDACTRegimenDefinition"],
  "status" : "draft",
  "intent" : "order",
  "subject" : {
    "reference" : "Patient/OGCAPatientExample"
  },
  "action" : [{
    "id" : "ac-phase-order",
    "title" : "AC Phase (Cycles 1–4, q14d)",
    "timingTiming" : {
      "repeat" : {
        "count" : 4,
        "period" : 14,
        "periodUnit" : "d"
      }
    },
    "action" : [{
      "id" : "doxorubicin-action",
      "title" : "Doxorubicin 60 mg/m² IV day 1",
      "timingTiming" : {
        "extension" : [{
          "extension" : [{
            "url" : "day",
            "valueInteger" : 1
          }],
          "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/regimen-days-of-cycle"
        }],
        "repeat" : {
          "period" : 14,
          "periodUnit" : "d"
        }
      },
      "resource" : {
        "reference" : "MedicationRequest/DoxorubicinMedRequestDDACT"
      }
    },
    {
      "id" : "cyclophosphamide-action",
      "title" : "Cyclophosphamide 600 mg/m² IV day 1",
      "timingTiming" : {
        "extension" : [{
          "extension" : [{
            "url" : "day",
            "valueInteger" : 1
          }],
          "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/regimen-days-of-cycle"
        }],
        "repeat" : {
          "period" : 14,
          "periodUnit" : "d"
        }
      },
      "resource" : {
        "reference" : "MedicationRequest/CyclophosphamideMedRequestDDACT"
      }
    }]
  },
  {
    "id" : "t-phase-order",
    "title" : "T Phase — Paclitaxel (Cycles 5–8, q14d)",
    "relatedAction" : [{
      "actionId" : "ac-phase-order",
      "relationship" : "after-end"
    }],
    "timingTiming" : {
      "repeat" : {
        "count" : 4,
        "period" : 14,
        "periodUnit" : "d"
      }
    },
    "action" : [{
      "id" : "paclitaxel-t-action",
      "title" : "Paclitaxel 175 mg/m² IV day 1",
      "timingTiming" : {
        "extension" : [{
          "extension" : [{
            "url" : "day",
            "valueInteger" : 1
          }],
          "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/regimen-days-of-cycle"
        }],
        "repeat" : {
          "period" : 14,
          "periodUnit" : "d"
        }
      },
      "resource" : {
        "reference" : "MedicationRequest/PaclitaxelMedRequestTPHase"
      }
    }]
  }]
}

```
