# Example Regimen Definition: TH (Paclitaxel + Trastuzumab, Weekly) - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## PlanDefinition: Example Regimen Definition: TH (Paclitaxel + Trastuzumab, Weekly) (Experimental) 

 
Weekly Paclitaxel + Trastuzumab for 12 weeks; standard adjuvant regimen for early HER2+ breast cancer. 

* Metadata: Title
  * ?: TH: Paclitaxel + Trastuzumab (Weekly) — Adjuvant HER2+ Breast Cancer
* Metadata: Version
  * ?: 0.1.0
* Metadata: Experimental
  * ?: true
* Metadata: Subject Type
  * ?: Malignant neoplasm of breast
* Metadata: Jurisdiction
  * ?: United States of America
* Metadata: Steward (Publisher)
  * ?: HL7 International / Clinical Interoperability Council
* Metadata: Steward Contact
  * ?: HL7 International / Clinical Interoperability Council
* Metadata: Description
  * ?: Weekly Paclitaxel + Trastuzumab for 12 weeks; standard adjuvant regimen for early HER2+ breast cancer.
* Metadata: Type
  * ?: Order Set
* Metadata: PlanDefinition Action
* Metadata: Id
  * ?: paclitaxel-th
* Metadata: Title
  * ?: Paclitaxel 80 mg/m² IV — Day 1 of each 7-day cycle
* Metadata: Description
  * ?: Paclitaxel 80 mg/m² IV over 1 hour, weekly (day 1 of 7-day cycle) x12 doses
* Metadata: Timing
  * ?: Count 12 times, Once per 7 days
* Metadata: PlanDefinition Action
* Metadata: Id
  * ?: trastuzumab-th
* Metadata: Title
  * ?: Trastuzumab 4 mg/kg (loading) then 2 mg/kg IV weekly
* Metadata: Description
  * ?: Trastuzumab 4 mg/kg IV loading dose week 1, then 2 mg/kg IV weekly (day 1 of 7-day cycle) x11 doses
* Metadata: Timing
  * ?: Count 12 times, Once per 7 days
* Metadata: Generated using version 0.5.4 of the sample-content-ig Liquid templates



## Resource Content

```json
{
  "resourceType" : "PlanDefinition",
  "id" : "THRegimenDefinition",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-plandefinition"]
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
  },
  {
    "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-disease-context",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "254837009",
        "display" : "Malignant neoplasm of breast"
      }]
    }
  }],
  "url" : "http://hl7.org/fhir/us/codex-ocpa/PlanDefinition/THRegimenDefinition",
  "version" : "0.1.0",
  "name" : "THRegimenDefinition",
  "title" : "TH: Paclitaxel + Trastuzumab (Weekly) — Adjuvant HER2+ Breast Cancer",
  "type" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/plan-definition-type",
      "code" : "order-set",
      "display" : "Order Set"
    }]
  },
  "status" : "active",
  "experimental" : true,
  "subjectCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Malignant neoplasm of breast"
    }]
  },
  "date" : "2026-05-18T11:02:07-04:00",
  "publisher" : "HL7 International / Clinical Interoperability Council",
  "contact" : [{
    "name" : "HL7 International / Clinical Interoperability Council",
    "telecom" : [{
      "system" : "url",
      "value" : "http://www.hl7.org/Special/committees/cic"
    },
    {
      "system" : "email",
      "value" : "ciclist@lists.HL7.org"
    }]
  }],
  "description" : "Weekly Paclitaxel + Trastuzumab for 12 weeks; standard adjuvant regimen for early HER2+ breast cancer.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "action" : [{
    "id" : "paclitaxel-th",
    "title" : "Paclitaxel 80 mg/m² IV — Day 1 of each 7-day cycle",
    "description" : "Paclitaxel 80 mg/m² IV over 1 hour, weekly (day 1 of 7-day cycle) x12 doses",
    "timingTiming" : {
      "repeat" : {
        "count" : 12,
        "period" : 7,
        "periodUnit" : "d"
      }
    }
  },
  {
    "id" : "trastuzumab-th",
    "title" : "Trastuzumab 4 mg/kg (loading) then 2 mg/kg IV weekly",
    "description" : "Trastuzumab 4 mg/kg IV loading dose week 1, then 2 mg/kg IV weekly (day 1 of 7-day cycle) x11 doses",
    "timingTiming" : {
      "repeat" : {
        "count" : 12,
        "period" : 7,
        "periodUnit" : "d"
      }
    }
  }]
}

```
