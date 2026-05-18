# Oncology Data Requirements Library - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Resource Profile: Oncology Data Requirements Library ( Experimental ) 

 
A versioned, governable package of FHIR DataRequirement entries that declares the patient context required to evaluate an anti-cancer therapy regimen for prior authorization. 
CRD uses this Library to determine whether the supplied patient context is sufficient for pre-approval evaluation. DTR uses the same Library to select or generate a questionnaire and prepopulate known data. This shared-artifact pattern eliminates the divergence that occurs when CRD rules and DTR questionnaires are based on separate logic. 
The Library is referenced from the CDS Hooks oncology extension via dataRequirements.canonical, or provided inline as DataRequirement[]. 
Cancer-specific instances (e.g., BreastCancerPADataRequirements) derive their content from this base profile and bind Library.subjectCodeableConcept to the target cancer type. 
**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5. 

**⚠ mCODE Migration Candidate**

This Oncology Data Requirements Library profile is defined in this IG as a **temporary home** while a formal proposal to incorporate it into [mCODE STU5](http://hl7.org/fhir/us/mcode) is developed. It is **not** intended to be a permanent artifact of the OGCA IG. Once adopted by mCODE, this IG will remove its local definition and reference the mCODE canonical URL instead.

This artifact carries `status = draft` and `experimental = true`. Canonical URLs will change at migration. See the [mCODE Candidates](mcode-candidates.md) page for the full migration plan.

**Usages:**

* Examples for this Profile: [BreastCancerPADataRequirements](Library-BreastCancerPADataRequirements.md)
* CapabilityStatements using this Profile: [Oncology CRD Client Capability Statement](CapabilityStatement-ocpa-crd-client.md) and [Oncology CRD Service Capability Statement](CapabilityStatement-ocpa-crd-service.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-ocpa|current/StructureDefinition/oncology-data-requirements-library)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-oncology-data-requirements-library.csv), [Excel](../StructureDefinition-oncology-data-requirements-library.xlsx), [Schematron](../StructureDefinition-oncology-data-requirements-library.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "oncology-data-requirements-library",
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
  "url" : "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/oncology-data-requirements-library",
  "version" : "0.1.0",
  "name" : "OncologyDataRequirementsLibrary",
  "title" : "Oncology Data Requirements Library",
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
  "description" : "A versioned, governable package of FHIR DataRequirement entries that\ndeclares the patient context required to evaluate an anti-cancer therapy regimen for\nprior authorization.\n\nCRD uses this Library to determine whether the supplied patient context is sufficient\nfor pre-approval evaluation. DTR uses the same Library to select or generate a\nquestionnaire and prepopulate known data. This shared-artifact pattern eliminates\nthe divergence that occurs when CRD rules and DTR questionnaires are based on\nseparate logic.\n\nThe Library is referenced from the CDS Hooks oncology extension via\ndataRequirements.canonical, or provided inline as DataRequirement[].\n\nCancer-specific instances (e.g., BreastCancerPADataRequirements) derive their content\nfrom this base profile and bind Library.subjectCodeableConcept to the target cancer type.\n\n**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5.",
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
  },
  {
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
    "identity" : "objimpl",
    "uri" : "http://hl7.org/fhir/object-implementation",
    "name" : "Object Implementation Information"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Library",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Library",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Library",
      "path" : "Library"
    },
    {
      "id" : "Library.version",
      "path" : "Library.version",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Library.name",
      "path" : "Library.name",
      "mustSupport" : true
    },
    {
      "id" : "Library.title",
      "path" : "Library.title",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Library.type",
      "path" : "Library.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/library-type",
          "code" : "asset-collection",
          "display" : "Asset Collection"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Library.subject[x]",
      "path" : "Library.subject[x]",
      "short" : "Cancer type for which these data requirements apply (e.g., SNOMED CT 254837009 for breast cancer)",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
          "valueString" : "SubjectType"
        }],
        "strength" : "extensible",
        "description" : "A SNOMED CT code for the target cancer type",
        "valueSet" : "http://hl7.org/fhir/ValueSet/subject-type"
      }
    },
    {
      "id" : "Library.description",
      "path" : "Library.description",
      "mustSupport" : true
    },
    {
      "id" : "Library.relatedArtifact",
      "path" : "Library.relatedArtifact",
      "short" : "Canonical regimen definitions that reference this Library",
      "mustSupport" : true
    },
    {
      "id" : "Library.dataRequirement",
      "path" : "Library.dataRequirement",
      "short" : "Individual patient data requirements for CRD evaluation and DTR collection",
      "definition" : "Each DataRequirement entry declares one category of patient data needed to evaluate\nthe regimen for prior authorization. CRD checks whether this data is present. DTR\ncollects it if absent. Requirements SHOULD use mCODE profiles where available.",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
