# Anti-Cancer Regimen RequestGroup - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Resource Profile: Anti-Cancer Regimen RequestGroup ( Experimental ) 

 
A patient-specific ordered anti-cancer therapy regimen instance. This resource is included in the CDS Hooks draftOrders Bundle and referenced in context.selections at order-select and order-sign. 
RequestGroup.instantiatesCanonical SHALL be populated with the canonical URL of the AntiCancerRegimenPlanDefinition when the canonical regimen definition is known. 
Two scheduling patterns are supported in regimen actions: 
1. **Cycle-day timing** — Each action (or action.action for phased regimens) uses the local extension `http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/regimen-days-of-cycle` on action.timingTiming to declare which days of the cycle the drug is administered. The action.timingTiming.repeat carries the machine-computable cycle period.
1. **Sequential phase ordering** — For multi-phase regimens (e.g., AC→T), top-level action groups represent phases and action.relatedAction with relationship = after-end declares that the second phase begins after the first.
 
**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5. It is the MVP artifact for oncology prior authorization: the selected clinical unit passed to the CRD service. 

**⚠ mCODE Migration Candidate**

This Anti-Cancer Regimen RequestGroup profile is defined in this IG as a **temporary home** while a formal proposal to incorporate it into [mCODE STU5](http://hl7.org/fhir/us/mcode) is developed. It is **not** intended to be a permanent artifact of the OGCA IG. Once adopted by mCODE, this IG will remove its local definition and reference the mCODE canonical URL instead.

This artifact carries `status = draft` and `experimental = true`. Canonical URLs will change at migration. See the [mCODE Candidates](mcode-candidates.md) page for the full migration plan.

**Usages:**

* Examples for this Profile: [RequestGroup/DDACTRegimenOrder](RequestGroup-DDACTRegimenOrder.md), [RequestGroup/PHDRegimenOrder](RequestGroup-PHDRegimenOrder.md) and [RequestGroup/THRegimenOrder](RequestGroup-THRegimenOrder.md)
* CapabilityStatements using this Profile: [Oncology CRD Client Capability Statement](CapabilityStatement-ocpa-crd-client.md) and [Oncology CRD Service Capability Statement](CapabilityStatement-ocpa-crd-service.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-ocpa|current/StructureDefinition/anticancer-regimen-requestgroup)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-anticancer-regimen-requestgroup.csv), [Excel](../StructureDefinition-anticancer-regimen-requestgroup.xlsx), [Schematron](../StructureDefinition-anticancer-regimen-requestgroup.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "anticancer-regimen-requestgroup",
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
  "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-requestgroup",
  "version" : "0.1.0",
  "name" : "AntiCancerRegimenRequestGroup",
  "title" : "Anti-Cancer Regimen RequestGroup",
  "status" : "draft",
  "experimental" : true,
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
  "description" : "A patient-specific ordered anti-cancer therapy regimen instance.\nThis resource is included in the CDS Hooks draftOrders Bundle and referenced in\ncontext.selections at order-select and order-sign.\n\nRequestGroup.instantiatesCanonical SHALL be populated with the canonical URL of the\nAntiCancerRegimenPlanDefinition when the canonical regimen definition is known.\n\nTwo scheduling patterns are supported in regimen actions:\n\n1. **Cycle-day timing** — Each action (or action.action for phased regimens) uses the\n   local extension `http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/regimen-days-of-cycle`\n   on action.timingTiming to declare which days of the cycle the drug is administered.\n   The action.timingTiming.repeat carries the machine-computable cycle period.\n\n2. **Sequential phase ordering** — For multi-phase regimens (e.g., AC→T),\n   top-level action groups represent phases and action.relatedAction with\n   relationship = after-end declares that the second phase begins after the first.\n\n**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5.\nIt is the MVP artifact for oncology prior authorization: the selected clinical unit\npassed to the CRD service.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "purpose" : "mCODE Migration Candidate — proposed for mCODE STU5. This artifact is defined in the\nOGCA IG as a temporary home while a formal mCODE ballot proposal is prepared. It is NOT\nintended to be a permanent artifact of this IG. Canonical URLs will change at migration.\nSee the mCODE Candidates page in this IG for the full migration plan.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "RequestGroup",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/RequestGroup",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "RequestGroup",
      "path" : "RequestGroup"
    },
    {
      "id" : "RequestGroup.extension",
      "path" : "RequestGroup.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "RequestGroup.extension:regimenIntent",
      "path" : "RequestGroup.extension",
      "sliceName" : "regimenIntent",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-intent"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.extension:regimenTreatmentLine",
      "path" : "RequestGroup.extension",
      "sliceName" : "regimenTreatmentLine",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-treatment-line"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.instantiatesCanonical",
      "path" : "RequestGroup.instantiatesCanonical",
      "short" : "Canonical URL of the AntiCancerRegimenPlanDefinition this instance instantiates",
      "definition" : "When the canonical regimen definition is known, this SHALL reference an\nAntiCancerRegimenPlanDefinition. The CRD Service SHOULD use this reference to identify\nthe regimen and locate the associated data requirements Library.",
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.status",
      "path" : "RequestGroup.status",
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.intent",
      "path" : "RequestGroup.intent",
      "patternCode" : "order",
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.subject",
      "path" : "RequestGroup.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|7.0.0",
        "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action",
      "path" : "RequestGroup.action",
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.id",
      "path" : "RequestGroup.action.id",
      "short" : "Action identifier — required for relatedAction cross-referencing in sequential regimens",
      "min" : 1
    },
    {
      "id" : "RequestGroup.action.title",
      "path" : "RequestGroup.action.title",
      "short" : "Drug name or phase label",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.relatedAction",
      "path" : "RequestGroup.action.relatedAction",
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.relatedAction.relationship",
      "path" : "RequestGroup.action.relatedAction.relationship",
      "short" : "Use 'after-end' for sequential phase ordering"
    },
    {
      "id" : "RequestGroup.action.timing[x]",
      "path" : "RequestGroup.action.timing[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "RequestGroup.action.timing[x]:timingTiming",
      "path" : "RequestGroup.action.timing[x]",
      "sliceName" : "timingTiming",
      "short" : "Cycle period. Use regimen-days-of-cycle extension on this element for cycle-day scheduling.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Timing"
      }],
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.resource",
      "path" : "RequestGroup.action.resource",
      "short" : "Reference to draft MedicationRequest for this component (available at order-sign)",
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.action",
      "path" : "RequestGroup.action.action",
      "type" : [{
        "code" : "BackboneElement"
      }],
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.action.id",
      "path" : "RequestGroup.action.action.id",
      "min" : 1
    },
    {
      "id" : "RequestGroup.action.action.title",
      "path" : "RequestGroup.action.action.title",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.action.timing[x]",
      "path" : "RequestGroup.action.action.timing[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "RequestGroup.action.action.timing[x]:timingTiming",
      "path" : "RequestGroup.action.action.timing[x]",
      "sliceName" : "timingTiming",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Timing"
      }],
      "mustSupport" : true
    },
    {
      "id" : "RequestGroup.action.action.resource",
      "path" : "RequestGroup.action.action.resource",
      "mustSupport" : true
    }]
  }
}

```
