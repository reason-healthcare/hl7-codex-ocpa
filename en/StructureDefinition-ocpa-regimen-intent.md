# Regimen Intent - MOPA — Medical Oncology Prior Authorization v0.1.0

## Extension: Regimen Intent (Experimental) 

The clinical intent of the anti-cancer regimen (e.g., curative, palliative, adjuvant, neoadjuvant, supportive). Applies to both the canonical regimen definition (PlanDefinition) and the patient-specific ordered instance (RequestGroup).

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension on anti-cancer regimen profiles.

**Context of Use**

**⚠ mCODE Migration Candidate**

This Regimen Intent extension is defined in this IG as a **temporary home** while a formal proposal to incorporate it into [mCODE STU5](http://hl7.org/fhir/us/mcode) is developed. It is **not** intended to be a permanent artifact of the MOPA IG. Once adopted by mCODE, this IG will remove its local definition and reference the mCODE canonical URL instead.

This artifact carries `status = draft` and `experimental = true`. Canonical URLs will change at migration. See the [mCODE Gap Proposals](mcode-gap-proposals.md) page for the full proposal backlog.

**Usage info**

**Usages:**

* Use this Extension: [Anti-Cancer Regimen PlanDefinition](StructureDefinition-anticancer-regimen-plandefinition.md) and [Anti-Cancer Regimen RequestGroup](StructureDefinition-anticancer-regimen-requestgroup.md)
* Examples for this Extension: [Bundle/ExampleOrderSelectBundle](Bundle-ExampleOrderSelectBundle.md), [Bundle/ExampleOrderSignBundle](Bundle-ExampleOrderSignBundle.md), [DDACTRegimenDefinition](PlanDefinition-DDACTRegimenDefinition.md), [PHDRegimenDefinition](PlanDefinition-PHDRegimenDefinition.md)... Show 4 more, [THRegimenDefinition](PlanDefinition-THRegimenDefinition.md), [RequestGroup/DDACTRegimenOrder](RequestGroup-DDACTRegimenOrder.md), [RequestGroup/PHDRegimenOrder](RequestGroup-PHDRegimenOrder.md) and [RequestGroup/THRegimenOrder](RequestGroup-THRegimenOrder.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-mopa|current/StructureDefinition/ocpa-regimen-intent)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ocpa-regimen-intent.csv), [Excel](../StructureDefinition-ocpa-regimen-intent.xlsx), [Schematron](../StructureDefinition-ocpa-regimen-intent.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ocpa-regimen-intent",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg",
    "valueCode" : "cic"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
    "valueCode" : "informative",
    "_valueCode" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-conformance-derivedFrom",
        "valueCanonical" : "http://hl7.org/fhir/us/codex-mopa/ImplementationGuide/hl7.fhir.us.codex-mopa"
      }]
    }
  }],
  "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/ocpa-regimen-intent",
  "version" : "0.1.0",
  "name" : "RegimenIntentExtension",
  "title" : "Regimen Intent",
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
  "description" : "The clinical intent of the anti-cancer regimen (e.g., curative,\npalliative, adjuvant, neoadjuvant, supportive). Applies to both the canonical regimen\ndefinition (PlanDefinition) and the patient-specific ordered instance (RequestGroup).\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles.",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "PlanDefinition"
  },
  {
    "type" : "element",
    "expression" : "RequestGroup"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Regimen Intent",
      "definition" : "The clinical intent of the anti-cancer regimen (e.g., curative,\npalliative, adjuvant, neoadjuvant, supportive). Applies to both the canonical regimen\ndefinition (PlanDefinition) and the patient-specific ordered instance (RequestGroup).\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/ocpa-regimen-intent"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://hl7.org/fhir/us/codex-mopa/ValueSet/regimen-intent-vs"
      }
    }]
  }
}

```
