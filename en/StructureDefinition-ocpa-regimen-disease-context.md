# Regimen Disease Context - MOPA — Medical Oncology Prior Authorization v0.1.0

## Extension: Regimen Disease Context (Experimental) 

Identifies the cancer type or specific cancer condition for which this anti-cancer regimen is defined. May be a coded value (e.g., SNOMED CT cancer concept) for use on canonical PlanDefinition definitions, or a reference to the patient's primary cancer Condition for use on RequestGroup instances.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension on anti-cancer regimen profiles.

**Context of Use**

**⚠ mCODE Migration Candidate**

This Regimen Disease Context extension is defined in this IG as a **temporary home** while a formal proposal to incorporate it into [mCODE STU5](http://hl7.org/fhir/us/mcode) is developed. It is **not** intended to be a permanent artifact of the MOPA IG. Once adopted by mCODE, this IG will remove its local definition and reference the mCODE canonical URL instead.

This artifact carries `status = draft` and `experimental = true`. Canonical URLs will change at migration. See the [mCODE Gap Proposals](mcode-gap-proposals.md) page for the full proposal backlog.

**Usage info**

**Usages:**

* Use this Extension: [Anti-Cancer Regimen PlanDefinition](StructureDefinition-anticancer-regimen-plandefinition.md)
* Examples for this Extension: [DDACTRegimenDefinition](PlanDefinition-DDACTRegimenDefinition.md), [PHDRegimenDefinition](PlanDefinition-PHDRegimenDefinition.md) and [THRegimenDefinition](PlanDefinition-THRegimenDefinition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-mopa|current/StructureDefinition/ocpa-regimen-disease-context)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ocpa-regimen-disease-context.csv), [Excel](../StructureDefinition-ocpa-regimen-disease-context.xlsx), [Schematron](../StructureDefinition-ocpa-regimen-disease-context.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ocpa-regimen-disease-context",
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
  "url" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/ocpa-regimen-disease-context",
  "version" : "0.1.0",
  "name" : "RegimenDiseaseContextExtension",
  "title" : "Regimen Disease Context",
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
  "description" : "Identifies the cancer type or specific cancer condition for which this\nanti-cancer regimen is defined. May be a coded value (e.g., SNOMED CT cancer concept)\nfor use on canonical PlanDefinition definitions, or a reference to the patient's primary\ncancer Condition for use on RequestGroup instances.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles.",
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
      "short" : "Regimen Disease Context",
      "definition" : "Identifies the cancer type or specific cancer condition for which this\nanti-cancer regimen is defined. May be a coded value (e.g., SNOMED CT cancer concept)\nfor use on canonical PlanDefinition definitions, or a reference to the patient's primary\ncancer Condition for use on RequestGroup instances.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/ocpa-regimen-disease-context"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Condition"]
      }]
    }]
  }
}

```
