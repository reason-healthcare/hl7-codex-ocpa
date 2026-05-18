# Oncology CRD Client Capability Statement - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## CapabilityStatement: Oncology CRD Client Capability Statement (Experimental) 

 
Capability Statement for systems acting as an **Oncology CRD Client** (e.g., an EHR or oncology ordering system). A conformant client claims support for the Da Vinci CRD oncology profile defined in this IG by meeting the requirements below. 

 [Raw OpenAPI-Swagger Definition file](../ocpa-crd-client.openapi.json) | [Download](../ocpa-crd-client.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ocpa-crd-client",
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
  "url" : "http://hl7.org/fhir/us/codex-ocpa/CapabilityStatement/ocpa-crd-client",
  "version" : "0.1.0",
  "name" : "OcpaCrdClientCapabilityStatement",
  "title" : "Oncology CRD Client Capability Statement",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-05-04",
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
  "description" : "Capability Statement for systems acting as an **Oncology CRD Client**\n(e.g., an EHR or oncology ordering system).  A conformant client claims support for\nthe Da Vinci CRD oncology profile defined in this IG by meeting the requirements below.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "implementationGuide" : ["http://hl7.org/fhir/us/codex-ocpa/ImplementationGuide/hl7.fhir.us.codex-ocpa",
  "http://hl7.org/fhir/us/davinci-crd/ImplementationGuide/hl7.fhir.us.davinci-crd"],
  "rest" : [{
    "mode" : "client",
    "documentation" : "A conformant Oncology CRD Client SHALL:\n\n1. Include the `org.hl7.davinci-crd.oncology` CDS Hooks extension when an anti-cancer therapy\n   regimen is selected or signed.\n2. Include the selected anti-cancer regimen as a `RequestGroup` conforming to\n   `OncologyAntiCancerRegimenRequestGroup` in `context.draftOrders` and `context.selections`.\n3. Populate `RequestGroup.instantiatesCanonical` with the canonical URL of the\n   `OncologyAntiCancerRegimenPlanDefinition` when the definition is known.\n4. Make available the patient context required by the referenced `DataRequirement` entries\n   through prefetch, FHIR API access, or an included patient context Bundle.",
    "resource" : [{
      "type" : "RequestGroup",
      "supportedProfile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-requestgroup"],
      "documentation" : "SHALL include a conformant RequestGroup in context.draftOrders at order-select and order-sign.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      }]
    },
    {
      "type" : "PlanDefinition",
      "supportedProfile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-plandefinition"],
      "documentation" : "SHOULD support read of the PlanDefinition referenced by RequestGroup.instantiatesCanonical.",
      "interaction" : [{
        "code" : "read"
      }]
    },
    {
      "type" : "Library",
      "supportedProfile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/oncology-data-requirements-library"],
      "documentation" : "SHALL make available the Library referenced in the oncology CDS Hooks extension dataRequirements.",
      "interaction" : [{
        "code" : "read"
      }]
    }]
  }]
}

```
