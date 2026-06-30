# Line of Therapy Observation - MOPA — Medical Oncology Prior Authorization v0.1.0

## Resource Profile: Line of Therapy Observation ( Experimental ) 

 
An Observation that documents the ordinal line of systemic anti-cancer therapy a patient is currently receiving or has received for a given cancer diagnosis. 
This observation is a required patient data element for oncology prior authorization: most metastatic and recurrent cancer regimen policies are line-of-therapy dependent. 
Observation.code uses the local MOPA code system code `line-of-therapy` as a placeholder. A migration request for a LOINC code will be submitted before mCODE STU5. 
Observation.value[x] SHALL be a CodeableConcept drawn from TreatmentLineVS. The focus SHALL reference the primary cancer Condition for which this line applies. 
**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5. 

**⚠ mCODE Migration Candidate**

This Line of Therapy Observation profile is defined in this IG as a **temporary home** while a formal proposal to incorporate it into [mCODE STU5](http://hl7.org/fhir/us/mcode) is developed. It is **not** intended to be a permanent artifact of the MOPA IG. Once adopted by mCODE, this IG will remove its local definition and reference the mCODE canonical URL instead.

This artifact carries `status = draft` and `experimental = true`. Canonical URLs will change at migration. See the [mCODE Gap Proposals](mcode-gap-proposals.md) page for the full proposal backlog.

**Usages:**

* Examples for this Profile: [Observation/LineOfTherapyFirstLine](Observation-LineOfTherapyFirstLine.md), [Observation/LineOfTherapyMaintenance](Observation-LineOfTherapyMaintenance.md) and [Observation/LineOfTherapySecondLine](Observation-LineOfTherapySecondLine.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-mopa|current/StructureDefinition/line-of-therapy-observation)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-line-of-therapy-observation.csv), [Excel](../StructureDefinition-line-of-therapy-observation.xlsx), [Schematron](../StructureDefinition-line-of-therapy-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "line-of-therapy-observation",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
    "valueCode" : "draft"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
    "valueInteger" : 0
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg",
    "valueCode" : "cic"
  }],
  "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/line-of-therapy-observation",
  "version" : "0.1.0",
  "name" : "LineOfTherapyObservation",
  "title" : "Line of Therapy Observation",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-06-30T11:36:35-04:00",
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
  "description" : "An Observation that documents the ordinal line of systemic anti-cancer\ntherapy a patient is currently receiving or has received for a given cancer diagnosis.\n\nThis observation is a required patient data element for oncology prior authorization:\nmost metastatic and recurrent cancer regimen policies are line-of-therapy dependent.\n\nObservation.code uses the local MOPA code system code `line-of-therapy` as a placeholder.\nA migration request for a LOINC code will be submitted before mCODE STU5.\n\nObservation.value[x] SHALL be a CodeableConcept drawn from TreatmentLineVS.\nThe focus SHALL reference the primary cancer Condition for which this line applies.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "purpose" : "mCODE Migration Candidate — proposed for mCODE STU5. This artifact is defined in the\nMOPA IG as a temporary home while a formal mCODE ballot proposal is prepared. It is NOT\nintended to be a permanent artifact of this IG. Canonical URLs will change at migration.\nSee the mCODE Gap Proposals page in this IG for the full proposal backlog.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "final | amended | corrected",
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "therapy",
          "display" : "Therapy"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Identifies this as a line-of-therapy observation",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/us/codex-mopa/CodeSystem/ocpa-codes",
          "code" : "line-of-therapy",
          "display" : "Line of Therapy"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|7.0.0",
        "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.focus",
      "path" : "Observation.focus",
      "short" : "The primary cancer Condition for which this line of therapy applies. SHOULD reference an mcode-primary-cancer-condition.",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Condition"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "Date or period when this line of therapy began",
      "type" : [{
        "code" : "dateTime"
      },
      {
        "code" : "Period"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "First-line | Second-line | Third-line or later | Maintenance",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/us/codex-mopa/ValueSet/treatment-line-vs"
      }
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "max" : "0"
    }]
  }
}

```
