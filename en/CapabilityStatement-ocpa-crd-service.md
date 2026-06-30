# Oncology CRD Service Capability Statement - MOPA — Medical Oncology Prior Authorization v0.1.0

## CapabilityStatement: Oncology CRD Service Capability Statement (Experimental) 

 
Capability Statement for systems acting as an **Oncology CRD Service** (e.g., a payer or prior-authorization platform). A conformant service claims support for the Da Vinci CRD oncology profile defined in this IG by meeting the requirements below. 

 [Raw OpenAPI-Swagger Definition file](../ocpa-crd-service.openapi.json) | [Download](../ocpa-crd-service.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ocpa-crd-service",
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
  "url" : "http://hl7.org/fhir/us/codex-mopa/CapabilityStatement/ocpa-crd-service",
  "version" : "0.1.0",
  "name" : "OcpaCrdServiceCapabilityStatement",
  "title" : "Oncology CRD Service Capability Statement",
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
  "description" : "Capability Statement for systems acting as an **Oncology CRD Service**\n(e.g., a payer or prior-authorization platform).  A conformant service claims support for\nthe Da Vinci CRD oncology profile defined in this IG by meeting the requirements below.",
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
  "implementationGuide" : ["http://hl7.org/fhir/us/codex-mopa/ImplementationGuide/hl7.fhir.us.codex-mopa",
  "http://hl7.org/fhir/us/davinci-crd/ImplementationGuide/hl7.fhir.us.davinci-crd"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "A conformant Oncology CRD Service SHALL:\n\n1. Be capable of evaluating the selected anti-cancer regimen `RequestGroup` and optionally\n   resolving its instantiated `PlanDefinition`.\n2. Use `fhirAuthorization` — when provided in the CDS Hooks request — to query the EHR FHIR\n   server for required oncology patient context (cancer condition, staging, biomarkers, line\n   of therapy, performance status, prior therapy).\n3. Return a DTR launch card when required context is not available from the EHR FHIR server.",
    "resource" : [{
      "type" : "RequestGroup",
      "supportedProfile" : ["http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"],
      "documentation" : "SHALL resolve and evaluate RequestGroup resources received in CDS Hooks context.draftOrders.",
      "interaction" : [{
        "code" : "read"
      }]
    },
    {
      "type" : "PlanDefinition",
      "supportedProfile" : ["http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-plandefinition"],
      "documentation" : "SHOULD resolve PlanDefinition referenced by RequestGroup.instantiatesCanonical.",
      "interaction" : [{
        "code" : "read"
      }]
    },
    {
      "type" : "Condition",
      "documentation" : "SHALL query Condition (primary cancer condition) from EHR FHIR server when fhirAuthorization is provided.",
      "interaction" : [{
        "code" : "search-type"
      }]
    },
    {
      "type" : "Observation",
      "documentation" : "SHALL query Observation (staging, biomarkers, line of therapy, performance status) from EHR FHIR server.",
      "interaction" : [{
        "code" : "search-type"
      }]
    },
    {
      "type" : "MedicationRequest",
      "documentation" : "SHOULD query MedicationRequest (prior therapy) from EHR FHIR server when relevant.",
      "interaction" : [{
        "code" : "search-type"
      }]
    }]
  }]
}

```
