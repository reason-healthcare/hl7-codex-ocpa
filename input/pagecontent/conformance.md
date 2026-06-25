
### Conformance Verbs

The key words **SHALL**, **SHOULD**, **MAY**, and **SHALL NOT** in this specification are to be
interpreted as described in [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119).

### Must Support

Elements marked **Must Support** (MS) in this IG SHALL be interpreted as follows:

- A system that receives a resource with a Must Support element populated SHALL be capable of
  processing that element without error.
- A system that produces a resource SHALL populate Must Support elements when the relevant data
  is known and available.

### Implementation Expectations

This guide is informative, so it does not establish a formal conformance claim for the IG itself.
The statements below describe the expected behavior of systems that adopt the MOPA artifacts and
patterns.

A system implementing these patterns does so by declaring the applicable actor role and meeting
the corresponding expectations below.

### Oncology CRD Client

A conformant **Oncology CRD Client** (EHR or ordering system):

1. **SHALL** include the selected anti-cancer regimen as a `RequestGroup` conforming to
   `OncologyAntiCancerRegimenRequestGroup` in `context.draftOrders` and `context.selections`.
2. **SHOULD** populate `RequestGroup.instantiatesCanonical` with the canonical URL of the
   `OncologyAntiCancerRegimenPlanDefinition` when the definition is known. Many EHR order-sets
   do not have a published canonical definition; omitting this field is permitted.
3. **SHOULD** include instantiated component `MedicationRequest` resources as `RequestGroup`
   action references at `order-sign`.
4. **SHOULD** provide `fhirAuthorization` in the CDS Hooks request to allow the CRD service to
   query patient context directly from the EHR FHIR server.

### Oncology CRD Service

A conformant **Oncology CRD Service**:

1. **SHALL** be capable of evaluating the selected anti-cancer regimen `RequestGroup`.
   When `RequestGroup.instantiatesCanonical` is populated, the service **SHOULD** also resolve
   the referenced `PlanDefinition` to enrich evaluation.
2. **SHOULD** use `fhirAuthorization` — when provided — to query the EHR FHIR server for the
   oncology patient context required to evaluate the order.
3. **SHALL** return a DTR launch card when required patient context is not available from the
   EHR FHIR server.

### Capability Statements

- [Oncology CRD Client Capability Statement](CapabilityStatement-ocpa-crd-client.html)
- [Oncology CRD Service Capability Statement](CapabilityStatement-ocpa-crd-service.html)
