// ============================================================
// CapabilityStatements.fsh
// Two CapabilityStatement instances for the MOPA IG:
//   1. ocpa-crd-client  — Oncology CRD Client (EHR / ordering system)
//   2. ocpa-crd-service — Oncology CRD Service (payer / PA platform)
//
// These are conformance-layer declarations and do not enumerate every
// optional FHIR interaction; they focus on the SHALL requirements stated
// in the Conformance page.
// ============================================================

// ─── 1. Oncology CRD Client ──────────────────────────────────────────────────

Instance: ocpa-crd-client
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Oncology CRD Client Capability Statement"
Description: """Capability Statement for systems acting as an **Oncology CRD Client**
(e.g., an EHR or oncology ordering system).  A conformant client claims support for
the Da Vinci CRD oncology profile defined in this IG by meeting the requirements below."""

* name    = "OcpaCrdClientCapabilityStatement"
* status  = #draft
* experimental = true
* date    = "2026-05-04"
* kind    = #requirements
* fhirVersion = #4.0.1
* format[+]  = #json
* format[+]  = #xml

* implementationGuide[+] = "http://hl7.org/fhir/us/codex-mopa/ImplementationGuide/hl7.fhir.us.codex-mopa"
* implementationGuide[+] = "http://hl7.org/fhir/us/davinci-crd/ImplementationGuide/hl7.fhir.us.davinci-crd"

* rest[+].mode = #client
* rest[=].documentation = """
A conformant Oncology CRD Client SHALL:

1. Include the `org.hl7.davinci-crd.oncology` CDS Hooks extension when an anti-cancer therapy
   regimen is selected or signed.
2. Include the selected anti-cancer regimen as a `RequestGroup` conforming to
   `OncologyAntiCancerRegimenRequestGroup` in `context.draftOrders` and `context.selections`.
3. Populate `RequestGroup.instantiatesCanonical` with the canonical URL of the
   `OncologyAntiCancerRegimenPlanDefinition` when the definition is known.
4. Make available the patient context required by the referenced `DataRequirement` entries
   through prefetch, FHIR API access, or an included patient context Bundle.
"""

* rest[=].resource[+].type = #RequestGroup
* rest[=].resource[=].supportedProfile[+] =
    "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"
* rest[=].resource[=].documentation =
    "SHALL include a conformant RequestGroup in context.draftOrders at order-select and order-sign."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #create

* rest[=].resource[+].type = #PlanDefinition
* rest[=].resource[=].supportedProfile[+] =
    "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-plandefinition"
* rest[=].resource[=].documentation =
    "SHOULD support read of the PlanDefinition referenced by RequestGroup.instantiatesCanonical."
* rest[=].resource[=].interaction[+].code = #read

* rest[=].resource[+].type = #Library
* rest[=].resource[=].supportedProfile[+] =
    "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/oncology-data-requirements-library"
* rest[=].resource[=].documentation =
    "SHALL make available the Library referenced in the oncology CDS Hooks extension dataRequirements."
* rest[=].resource[=].interaction[+].code = #read


// ─── 2. Oncology CRD Service ─────────────────────────────────────────────────

Instance: ocpa-crd-service
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Oncology CRD Service Capability Statement"
Description: """Capability Statement for systems acting as an **Oncology CRD Service**
(e.g., a payer or prior-authorization platform).  A conformant service claims support for
the Da Vinci CRD oncology profile defined in this IG by meeting the requirements below."""

* name    = "OcpaCrdServiceCapabilityStatement"
* status  = #draft
* experimental = true
* date    = "2026-05-04"
* kind    = #requirements
* fhirVersion = #4.0.1
* format[+]  = #json
* format[+]  = #xml

* implementationGuide[+] = "http://hl7.org/fhir/us/codex-mopa/ImplementationGuide/hl7.fhir.us.codex-mopa"
* implementationGuide[+] = "http://hl7.org/fhir/us/davinci-crd/ImplementationGuide/hl7.fhir.us.davinci-crd"

* rest[+].mode = #server
* rest[=].documentation = """
A conformant Oncology CRD Service SHALL:

1. Be capable of evaluating the selected anti-cancer regimen `RequestGroup` and resolving its
   instantiated `PlanDefinition`.
2. Use the referenced or included `DataRequirement` entries to determine whether the supplied
   patient context is sufficient for pre-approval evaluation.
3. Return a DTR launch card when required patient context is missing.
4. Support at least one cancer-specific `Library` conforming to `OncologyDataRequirementsLibrary`.
"""

* rest[=].resource[+].type = #RequestGroup
* rest[=].resource[=].supportedProfile[+] =
    "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-requestgroup"
* rest[=].resource[=].documentation =
    "SHALL resolve and evaluate RequestGroup resources received in CDS Hooks context.draftOrders."
* rest[=].resource[=].interaction[+].code = #read

* rest[=].resource[+].type = #PlanDefinition
* rest[=].resource[=].supportedProfile[+] =
    "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/anticancer-regimen-plandefinition"
* rest[=].resource[=].documentation =
    "SHALL resolve PlanDefinition referenced by RequestGroup.instantiatesCanonical."
* rest[=].resource[=].interaction[+].code = #read

* rest[=].resource[+].type = #Library
* rest[=].resource[=].supportedProfile[+] =
    "http://hl7.org/fhir/us/codex-mopa/StructureDefinition/oncology-data-requirements-library"
* rest[=].resource[=].documentation =
    "SHALL support at least one cancer-specific Library conforming to OncologyDataRequirementsLibrary."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
