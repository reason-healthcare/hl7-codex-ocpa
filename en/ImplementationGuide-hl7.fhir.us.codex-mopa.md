#  - MOPA — Medical Oncology Prior Authorization v0.1.0

## : 



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "hl7.fhir.us.codex-mopa",
  "language" : "en",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
    "valueCode" : "draft"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg",
    "valueCode" : "cic"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm",
    "valueInteger" : 0
  }],
  "url" : "http://hl7.org/fhir/us/codex-mopa/ImplementationGuide/hl7.fhir.us.codex-mopa",
  "version" : "0.1.0",
  "name" : "MOPAIG",
  "title" : "MOPA — Medical Oncology Prior Authorization",
  "status" : "draft",
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
  "description" : "Informative Medical Oncology Prior Authorization (MOPA) framework covering all cancer types and documenting upstream proposal gaps for Da Vinci CRD/DTR/PAS and mCODE. The guide uses breast cancer prior authorization as the first concrete use case and data requirements implementation.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "packageId" : "hl7.fhir.us.codex-mopa",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.2.0"
  },
  {
    "id" : "hl7_fhir_uv_extensions_r4",
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.2.0"
  },
  {
    "id" : "hl7fhiruscore",
    "uri" : "http://hl7.org/fhir/us/core/ImplementationGuide/hl7.fhir.us.core",
    "packageId" : "hl7.fhir.us.core",
    "version" : "7.0.0"
  },
  {
    "id" : "fhirmcode",
    "uri" : "http://hl7.org/fhir/us/mcode/ImplementationGuide/hl7.fhir.us.mcode",
    "packageId" : "hl7.fhir.us.mcode",
    "version" : "4.0.0"
  },
  {
    "id" : "davinciCRD",
    "uri" : "http://hl7.org/fhir/us/davinci-crd/ImplementationGuide/hl7.fhir.us.davinci-crd",
    "packageId" : "hl7.fhir.us.davinci-crd",
    "version" : "2.2.1"
  },
  {
    "id" : "davinciDTR",
    "uri" : "http://hl7.org/fhir/us/davinci-dtr/ImplementationGuide/hl7.fhir.us.davinci-dtr",
    "packageId" : "hl7.fhir.us.davinci-dtr",
    "version" : "2.2.0"
  },
  {
    "id" : "davinciPAS",
    "uri" : "http://hl7.org/fhir/us/davinci-pas/ImplementationGuide/hl7.fhir.us.davinci-pas",
    "packageId" : "hl7.fhir.us.davinci-pas",
    "version" : "2.2.1"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/us/codex-mopa/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/us/codex-mopa/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/anticancer-regimen-plandefinition"
      },
      "name" : "Anti-Cancer Regimen PlanDefinition",
      "description" : "A canonical, reusable anti-cancer therapy regimen definition represented\nas a FHIR PlanDefinition order set. This resource is NOT patient-specific; it is\nreferenced by AntiCancerRegimenRequestGroup instances via RequestGroup.instantiatesCanonical.\n\nA regimen definition describes the protocol — component drugs, timing, cycle structure,\nsequential phase ordering — and carries the clinical context attributes (intent, treatment\nline, disease context) that the CRD service uses when evaluating the ordered regimen.\n\n**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5.\nIt addresses the gap documented in the mCODE gap analysis: mCODE does not currently\nrepresent anti-cancer regimens as first-class, computable entities.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/anticancer-regimen-requestgroup"
      },
      "name" : "Anti-Cancer Regimen RequestGroup",
      "description" : "A patient-specific ordered anti-cancer therapy regimen instance.\nThis resource is included in the CDS Hooks draftOrders Bundle and referenced in\ncontext.selections at order-select and order-sign.\n\nRequestGroup.instantiatesCanonical SHALL be populated with the canonical URL of the\nAntiCancerRegimenPlanDefinition when the canonical regimen definition is known.\n\nTwo scheduling patterns are supported in regimen actions:\n\n1. **Cycle-day timing** — Each action (or action.action for phased regimens) uses the\n   local extension `http://hl7.org/fhir/us/codex-mopa/StructureDefinition/regimen-days-of-cycle`\n   on action.timingTiming to declare which days of the cycle the drug is administered.\n   The action.timingTiming.repeat carries the machine-computable cycle period.\n\n2. **Sequential phase ordering** — For multi-phase regimens (e.g., AC→T),\n   top-level action groups represent phases and action.relatedAction with\n   relationship = after-end declares that the second phase begins after the first.\n\n**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5.\nIt is the MVP artifact for oncology prior authorization: the selected clinical unit\npassed to the CRD service.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/MOPAOncologistExample"
      },
      "name" : "Example Oncologist: Dr. Maria Lopez",
      "description" : "Fictional medical oncologist used across MOPA IG examples.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/MOPAPatientExample"
      },
      "name" : "Example Patient: Jane Smith",
      "description" : "Fictional 57-year-old female patient used consistently across all MOPA\nIG examples. DO NOT use real patient data.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "PlanDefinition"
      }],
      "reference" : {
        "reference" : "PlanDefinition/DDACTRegimenDefinition"
      },
      "name" : "Example Regimen Definition: ddAC→T (Dose-Dense AC then Paclitaxel)",
      "description" : "Canonical definition of dose-dense doxorubicin (60 mg/m²) plus\ncyclophosphamide (600 mg/m²) q14d × 4 cycles (AC phase), followed by paclitaxel\n(175 mg/m²) q14d × 4 cycles (T phase) for adjuvant breast cancer. Demonstrates\nsequential phase ordering using action.relatedAction with relationship = after-end.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-plandefinition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "PlanDefinition"
      }],
      "reference" : {
        "reference" : "PlanDefinition/PHDRegimenDefinition"
      },
      "name" : "Example Regimen Definition: PHD (Pertuzumab + Trastuzumab + Docetaxel)",
      "description" : "Canonical definition of pertuzumab (840 mg loading, then 420 mg IV) plus\ntrastuzumab (8 mg/kg loading, then 6 mg/kg IV) plus docetaxel (75 mg/m² IV), every 21 days,\nfor first-line metastatic HER2-positive breast cancer. Demonstrates palliative intent.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-plandefinition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "PlanDefinition"
      }],
      "reference" : {
        "reference" : "PlanDefinition/THRegimenDefinition"
      },
      "name" : "Example Regimen Definition: TH (Paclitaxel + Trastuzumab, Weekly)",
      "description" : "Canonical definition of weekly Paclitaxel (80 mg/m² IV) plus Trastuzumab\n(4 mg/kg loading, then 2 mg/kg IV) for 12 weeks in adjuvant HER2-positive early breast\ncancer. Demonstrates RegimenIntentExtension (adjuvant), RegimenTreatmentLineExtension\n(first-line), and RegimenDiseaseContextExtension.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-plandefinition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "RequestGroup"
      }],
      "reference" : {
        "reference" : "RequestGroup/DDACTRegimenOrder"
      },
      "name" : "Example Regimen Order: ddAC→T (Jane Smith, Adjuvant) — Sequential Phases",
      "description" : "Patient-specific draft ddAC→T order for Jane Smith. AC phase (doxorubicin +\ncyclophosphamide q14d x4) followed by T phase (paclitaxel q14d x4). Demonstrates sequential\nphase ordering with action.relatedAction relationship = after-end.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "RequestGroup"
      }],
      "reference" : {
        "reference" : "RequestGroup/PHDRegimenOrder"
      },
      "name" : "Example Regimen Order: PHD (Jane Smith, First-Line Metastatic HER2+)",
      "description" : "Patient-specific draft PHD regimen order for Jane Smith, first-line\nmetastatic HER2+ breast cancer. Pertuzumab + Trastuzumab + Docetaxel q21d.\nDemonstrates palliative intent and first-line metastatic treatment setting.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "RequestGroup"
      }],
      "reference" : {
        "reference" : "RequestGroup/THRegimenOrder"
      },
      "name" : "Example Regimen Order: TH (Jane Smith, Adjuvant HER2+) — Typical",
      "description" : "Patient-specific draft ordered TH regimen for Jane Smith at order-select.\ninstantiatesCanonical references THRegimenDefinition. All Must Support elements populated.\nDemonstrates timing-daysOfCycle (days 1, 8, 15 of a 21-day cycle) and is the primary\nreference example for AntiCancerRegimenRequestGroup.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleOrderSelectBundle"
      },
      "name" : "Example: CDS Hooks order-select draftOrders Bundle (TH regimen)",
      "description" : "Collection Bundle placed in context.draftOrders of an\norder-select CDS Hooks request.  At order-select the RequestGroup is present\nbut individual MedicationRequests are still draft and are not required.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/ExampleOrderSignBundle"
      },
      "name" : "Example: CDS Hooks order-sign draftOrders Bundle (TH regimen)",
      "description" : "Collection Bundle placed in context.draftOrders of an\norder-sign CDS Hooks request.  At order-sign the RequestGroup plus all\ncompanion MedicationRequests are present.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/CyclophosphamideMedRequestDDACT"
      },
      "name" : "Example: Cyclophosphamide MedicationRequest (ddAC→T regimen, draft)",
      "description" : "Draft MedicationRequest for cyclophosphamide 600 mg/m² IV in ddAC phase.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/DocetaxelMedRequestPHD"
      },
      "name" : "Example: Docetaxel MedicationRequest (PHD regimen, draft)",
      "description" : "Draft MedicationRequest for docetaxel 75 mg/m² IV q21d in PHD regimen.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/DoxorubicinMedRequestDDACT"
      },
      "name" : "Example: Doxorubicin MedicationRequest (ddAC→T regimen, draft)",
      "description" : "Draft MedicationRequest for doxorubicin 60 mg/m² IV in ddAC phase.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/LineOfTherapyFirstLine"
      },
      "name" : "Example: Line of Therapy — First-Line Adjuvant (Jane Smith)",
      "description" : "First-line adjuvant systemic anti-cancer therapy for Jane Smith's\nStage IIB HER2+ breast cancer, beginning January 2026 with the TH regimen.\nAll Must Support elements populated. This is the primary reference example.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/line-of-therapy-observation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/LineOfTherapyMaintenance"
      },
      "name" : "Example: Line of Therapy — Maintenance (Jane Smith, Post-PHD Response)",
      "description" : "Maintenance trastuzumab therapy for Jane Smith following response to\nPHD induction in metastatic HER2+ setting. Demonstrates TreatmentLineCS#maintenance.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/line-of-therapy-observation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/LineOfTherapySecondLine"
      },
      "name" : "Example: Line of Therapy — Second-Line Metastatic (Jane Smith)",
      "description" : "Second-line systemic anti-cancer therapy for Jane Smith after disease\nrecurrence with metastatic spread (liver) in March 2027, 14 months after completing\nadjuvant TH. Demonstrates second-line metastatic setting.",
      "exampleCanonical" : "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/line-of-therapy-observation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/MOPAMetastaticBreastCancerConditionExample"
      },
      "name" : "Example: Metastatic HER2+ Breast Cancer (Stage IV)",
      "description" : "Metastatic HER2-positive breast cancer with liver and bone involvement,\nnewly diagnosed Stage IV (de novo). Used in PHD regimen examples.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/PaclitaxelMedRequestTPHase"
      },
      "name" : "Example: Paclitaxel MedicationRequest (T phase, ddAC→T regimen, draft)",
      "description" : "Draft MedicationRequest for paclitaxel 175 mg/m² IV q14d in T phase.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/PaclitaxelMedRequestTH"
      },
      "name" : "Example: Paclitaxel MedicationRequest (TH regimen, draft)",
      "description" : "Draft MedicationRequest for paclitaxel 80 mg/m² IV weekly in TH regimen.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/PertuzumabMedRequestPHD"
      },
      "name" : "Example: Pertuzumab MedicationRequest (PHD regimen, draft)",
      "description" : "Draft MedicationRequest for pertuzumab IV q21d in PHD regimen.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/MOPABreastCancerConditionExample"
      },
      "name" : "Example: Primary HER2+ Breast Cancer (Stage IIB)",
      "description" : "Invasive ductal carcinoma of right breast, HER2-positive,\nStage IIB (T2 N1 M0), diagnosed November 2025. Referenced by all MOPA examples\ndepicting Jane Smith's adjuvant treatment course.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/TrastuzumabMedRequestPHD"
      },
      "name" : "Example: Trastuzumab MedicationRequest (PHD regimen, draft)",
      "description" : "Draft MedicationRequest for trastuzumab IV q21d in PHD regimen.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/TrastuzumabMedRequestTH"
      },
      "name" : "Example: Trastuzumab MedicationRequest (TH regimen, draft)",
      "description" : "Draft MedicationRequest for trastuzumab IV weekly in TH regimen.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/line-of-therapy-observation"
      },
      "name" : "Line of Therapy Observation",
      "description" : "An Observation that documents the ordinal line of systemic anti-cancer\ntherapy a patient is currently receiving or has received for a given cancer diagnosis.\n\nThis observation is a required patient data element for oncology prior authorization:\nmost metastatic and recurrent cancer regimen policies are line-of-therapy dependent.\n\nObservation.code uses the local MOPA code system code `line-of-therapy` as a placeholder.\nA migration request for a LOINC code will be submitted before mCODE STU5.\n\nObservation.value[x] SHALL be a CodeableConcept drawn from TreatmentLineVS.\nThe focus SHALL reference the primary cancer Condition for which this line applies.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/ocpa-codes"
      },
      "name" : "MOPA Local Code System",
      "description" : "Local codes defined by the MOPA IG for concepts that do not yet have\nan established representation in LOINC, SNOMED CT, or mCODE. These codes are migration\ncandidates and should be retired in favor of standard codes as they become available.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/ocpa-crd-client"
      },
      "name" : "Oncology CRD Client Capability Statement",
      "description" : "Capability Statement for systems acting as an **Oncology CRD Client**\n(e.g., an EHR or oncology ordering system).  A conformant client claims support for\nthe Da Vinci CRD oncology profile defined in this IG by meeting the requirements below.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/ocpa-crd-service"
      },
      "name" : "Oncology CRD Service Capability Statement",
      "description" : "Capability Statement for systems acting as an **Oncology CRD Service**\n(e.g., a payer or prior-authorization platform).  A conformant service claims support for\nthe Da Vinci CRD oncology profile defined in this IG by meeting the requirements below.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/regimen-days-of-cycle"
      },
      "name" : "Regimen Days of Cycle",
      "description" : "Specifies the days within a repeating treatment cycle on which a\nregimen action is to be performed. Semantically identical to the HL7 core extension\n[timing-daysOfCycle](http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle),\nbut with context broadened to `Timing` so it can be applied to nested\n`RequestGroup.action.action` elements used in phased multi-agent regimens.\n\nThe cycle length is expressed via `Timing.repeat.period` / `Timing.repeat.periodUnit`\non the same element. Day numbering starts at 1 (day 1 = first day of cycle 1).\n\nThis extension is a migration candidate for inclusion in the HL7 FHIR Extensions\npack with an expanded context. See [regimen-model.html](regimen-model.html).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ocpa-regimen-disease-context"
      },
      "name" : "Regimen Disease Context",
      "description" : "Identifies the cancer type or specific cancer condition for which this\nanti-cancer regimen is defined. May be a coded value (e.g., SNOMED CT cancer concept)\nfor use on canonical PlanDefinition definitions, or a reference to the patient's primary\ncancer Condition for use on RequestGroup instances.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ocpa-regimen-intent"
      },
      "name" : "Regimen Intent",
      "description" : "The clinical intent of the anti-cancer regimen (e.g., curative,\npalliative, adjuvant, neoadjuvant, supportive). Applies to both the canonical regimen\ndefinition (PlanDefinition) and the patient-specific ordered instance (RequestGroup).\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/regimen-intent-vs"
      },
      "name" : "Regimen Intent Value Set",
      "description" : "The clinical intent of an anti-cancer regimen. All codes are drawn from\nthe SNOMED CT \\\"Intents (nature of procedure values)\\\" hierarchy (363675004).\n\n**mCODE Migration Candidate** — Proposed for mCODE STU5.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ocpa-regimen-treatment-line"
      },
      "name" : "Regimen Treatment Line",
      "description" : "The ordinal line of systemic anti-cancer therapy for which this\nregimen is defined (e.g., first-line, second-line, maintenance). Applies to both the\ncanonical regimen definition (PlanDefinition) and the patient-specific ordered instance\n(RequestGroup).\n\nNote: This extension captures the regimen's *designed* treatment line. To document the\npatient's *current* line of therapy as a clinical observation, use LineOfTherapyObservation.\n\n**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension\non anti-cancer regimen profiles.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/treatment-line-cs"
      },
      "name" : "Treatment Line Code System",
      "description" : "Ordinal codes representing the line of systemic anti-cancer therapy.\nThese codes are used in the TreatmentLineVS value set and on the LineOfTherapyObservation\nand regimen profiles.\n\n**mCODE Migration Candidate** — These codes are proposed for adoption in mCODE STU5\nor as a SNOMED CT extension request. Once standard codes are available, this code\nsystem should be deprecated.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/treatment-line-vs"
      },
      "name" : "Treatment Line Value Set",
      "description" : "Codes representing the ordinal line of systemic anti-cancer therapy.\nUsed in LineOfTherapyObservation.valueCodeableConcept and the RegimenTreatmentLine extension.\n\n**mCODE Migration Candidate** — Proposed for mCODE STU5.",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
        "valueCode" : "informative"
      },
      {
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "background.html"
        }],
        "nameUrl" : "background.html",
        "title" : "Background",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "use-cases.html"
        }],
        "nameUrl" : "use-cases.html",
        "title" : "Use Cases and Actors",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "regimen-model.html"
        }],
        "nameUrl" : "regimen-model.html",
        "title" : "Regimen Modeling",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "cds-workflow.html"
        }],
        "nameUrl" : "cds-workflow.html",
        "title" : "CRD Workflow",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "walkthrough.html"
        }],
        "nameUrl" : "walkthrough.html",
        "title" : "Workflow Walkthrough (Layers 1 & 2)",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "data-requirements.html"
        }],
        "nameUrl" : "data-requirements.html",
        "title" : "Data Requirements",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "breast-cancer-pa.html"
        }],
        "nameUrl" : "breast-cancer-pa.html",
        "title" : "Use Case 1: Breast Cancer PA",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "davinci-gap-proposals.html"
        }],
        "nameUrl" : "davinci-gap-proposals.html",
        "title" : "Da Vinci Gap Proposals",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mcode-gap-proposals.html"
        }],
        "nameUrl" : "mcode-gap-proposals.html",
        "title" : "mCODE Gap Proposals",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "conformance.html"
        }],
        "nameUrl" : "conformance.html",
        "title" : "Conformance",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "artifacts.html"
        }],
        "nameUrl" : "artifacts.html",
        "title" : "Artifacts Summary",
        "generation" : "html"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "downloads.html"
        }],
        "nameUrl" : "downloads.html",
        "title" : "Downloads",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status",
          "valueCode" : "informative"
        },
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "history.html"
        }],
        "nameUrl" : "history.html",
        "title" : "Change Log",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/assets"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
