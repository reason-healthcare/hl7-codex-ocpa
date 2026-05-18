# Conformance - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Conformance

### Conformance Verbs

The key words **SHALL**, **SHOULD**, **MAY**, and **SHALL NOT** in this specification are to be interpreted as described in [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119).

### Must Support

Elements marked **Must Support** (MS) in this IG SHALL be interpreted as follows:

* A system that receives a resource with a Must Support element populated SHALL be capable of processing that element without error.
* A system that produces a resource SHALL populate Must Support elements when the relevant data is known and available.

### Claiming Conformance

A system claims conformance to this IG by declaring conformance to the applicable actor role and meeting all corresponding SHALL requirements below.

### Oncology CRD Client

A conformant **Oncology CRD Client** (EHR or ordering system):

1. **SHALL**include the`org.hl7.davinci-crd.oncology`CDS Hooks extension when an anti-cancer therapy regimen is selected or signed.
1. **SHALL**include the selected anti-cancer regimen as a`RequestGroup`conforming to`OncologyAntiCancerRegimenRequestGroup`in`context.draftOrders`and`context.selections`.
1. **SHOULD**populate`RequestGroup.instantiatesCanonical`with the canonical URL of the`OncologyAntiCancerRegimenPlanDefinition`when the definition is known. Many EHR order-sets do not have a published canonical definition; omitting this field is permitted.
1. **SHOULD**include instantiated component`MedicationRequest`resources as`RequestGroup`action references at`order-sign`.
1. **SHALL**make available the patient context required by the referenced`DataRequirement`entries through prefetch, FHIR API access, or an included patient context Bundle.

### Oncology CRD Service

A conformant **Oncology CRD Service**:

1. **SHALL**be capable of evaluating the selected anti-cancer regimen`RequestGroup`. When`RequestGroup.instantiatesCanonical`is populated, the service**SHOULD**also resolve the referenced`PlanDefinition`to enrich evaluation.
1. **SHALL**use the referenced or included`DataRequirement`entries to determine whether the supplied patient context is sufficient for pre-approval evaluation.
1. **SHOULD**return a DTR launch card when required patient context is missing.
1. **SHALL**support at least one cancer-specific`Library`conforming to`OncologyDataRequirementsLibrary`.

### Data Requirements Library

A conformant **cancer-specific data requirements Library**:

1. **SHALL**conform to`OncologyDataRequirementsLibrary`.
1. **SHALL**declare required clinical data using`Library.dataRequirement`.
1. **SHOULD**use mCODE profiles where available and define additional profiles or extensions only where mCODE is insufficient.
1. **SHALL**identify the target cancer type in`Library.subjectCodeableConcept`.

### Capability Statements

* [Oncology CRD Client Capability Statement](CapabilityStatement-ocpa-crd-client.md)
* [Oncology CRD Service Capability Statement](CapabilityStatement-ocpa-crd-service.md)

