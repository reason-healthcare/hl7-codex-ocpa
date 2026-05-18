# Regimen Treatment Line - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Extension: Regimen Treatment Line (Experimental) 

The ordinal line of systemic anti-cancer therapy for which this regimen is defined (e.g., first-line, second-line, maintenance). Applies to both the canonical regimen definition (PlanDefinition) and the patient-specific ordered instance (RequestGroup).

Note: This extension captures the regimen's **designed** treatment line. To document the patient's **current** line of therapy as a clinical observation, use LineOfTherapyObservation.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension on anti-cancer regimen profiles.

**Context of Use**

**⚠ mCODE Migration Candidate**

This Regimen Treatment Line extension is defined in this IG as a **temporary home** while a formal proposal to incorporate it into [mCODE STU5](http://hl7.org/fhir/us/mcode) is developed. It is **not** intended to be a permanent artifact of the OGCA IG. Once adopted by mCODE, this IG will remove its local definition and reference the mCODE canonical URL instead.

This artifact carries `status = draft` and `experimental = true`. Canonical URLs will change at migration. See the [mCODE Candidates](mcode-candidates.md) page for the full migration plan.

**Usage info**

**Usages:**

* Use this Extension: [Anti-Cancer Regimen PlanDefinition](StructureDefinition-anticancer-regimen-plandefinition.md) and [Anti-Cancer Regimen RequestGroup](StructureDefinition-anticancer-regimen-requestgroup.md)
* Examples for this Extension: [Bundle/ExampleOrderSelectBundle](Bundle-ExampleOrderSelectBundle.md), [Bundle/ExampleOrderSignBundle](Bundle-ExampleOrderSignBundle.md), [DDACTRegimenDefinition](PlanDefinition-DDACTRegimenDefinition.md), [PHDRegimenDefinition](PlanDefinition-PHDRegimenDefinition.md)... Show 4 more, [THRegimenDefinition](PlanDefinition-THRegimenDefinition.md), [RequestGroup/DDACTRegimenOrder](RequestGroup-DDACTRegimenOrder.md), [RequestGroup/PHDRegimenOrder](RequestGroup-PHDRegimenOrder.md) and [RequestGroup/THRegimenOrder](RequestGroup-THRegimenOrder.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-ocpa|current/StructureDefinition/ocpa-regimen-treatment-line)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-ocpa-regimen-treatment-line.csv), [Excel](../StructureDefinition-ocpa-regimen-treatment-line.xlsx), [Schematron](../StructureDefinition-ocpa-regimen-treatment-line.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ocpa-regimen-treatment-line",
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
        "valueCanonical" : "http://hl7.org/fhir/us/codex-ocpa/ImplementationGuide/hl7.fhir.us.codex-ocpa"
      }]
    }
  }],
  "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-treatment-line",
  "version" : "0.1.0",
  "name" : "RegimenTreatmentLineExtension",
  "title" : "Regimen Treatment Line",
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
  "description" : "The ordinal line of systemic anti-cancer therapy for which this\nregimen is defined (e.g., first-line, second-line, maintenance). Applies to both the\ncanonical regimen definition (PlanDefinition) and the patient-specific ordered instance\n(RequestGroup).\n\nNote: This extension captures the regimen's *designed* treatment line. To document the\npatient's *current* line of therapy as a clinical observation, use LineOfTherapyObservation.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles.",
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
      "short" : "Regimen Treatment Line",
      "definition" : "The ordinal line of systemic anti-cancer therapy for which this\nregimen is defined (e.g., first-line, second-line, maintenance). Applies to both the\ncanonical regimen definition (PlanDefinition) and the patient-specific ordered instance\n(RequestGroup).\n\nNote: This extension captures the regimen's *designed* treatment line. To document the\npatient's *current* line of therapy as a clinical observation, use LineOfTherapyObservation.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-treatment-line"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://hl7.org/fhir/us/codex-ocpa/ValueSet/treatment-line-vs"
      }
    }]
  }
}

```
