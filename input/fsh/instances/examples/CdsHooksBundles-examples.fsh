// ============================================================
// CdsHooksBundles-examples.fsh
// Two Bundle examples representing CDS Hooks draftOrders payloads:
//   A — order-select: TH regimen (only the RequestGroup is available;
//       individual MedicationRequests are not yet finalised)
//   B — order-sign: TH regimen with all companion MedicationRequests
//       (represents the richer payload sent at sign time)
//
// Both Bundles are type = collection and correspond to the
// context.draftOrders Bundle described in Da Vinci CRD.
// ============================================================

// ─── A: order-select Bundle ─────────────────────────────────────────────────
// At order-select only the RequestGroup is required; component
// MedicationRequests are still being authored and are not yet present.

Instance: ExampleOrderSelectBundle
InstanceOf: Bundle
Usage: #example
Title: "Example: CDS Hooks order-select draftOrders Bundle (TH regimen)"
Description: """Collection Bundle placed in context.draftOrders of an
order-select CDS Hooks request.  At order-select the RequestGroup is present
but individual MedicationRequests are still draft and are not required."""

* type = #collection

* entry[+].fullUrl  = "http://hl7.org/fhir/us/codex-mopa/RequestGroup/THRegimenOrder"
* entry[=].resource = THRegimenOrder


// ─── B: order-sign Bundle ───────────────────────────────────────────────────
// At order-sign the RequestGroup and all component MedicationRequests are
// finalised and included together in context.draftOrders.

Instance: ExampleOrderSignBundle
InstanceOf: Bundle
Usage: #example
Title: "Example: CDS Hooks order-sign draftOrders Bundle (TH regimen)"
Description: """Collection Bundle placed in context.draftOrders of an
order-sign CDS Hooks request.  At order-sign the RequestGroup plus all
companion MedicationRequests are present."""

* type = #collection

* entry[+].fullUrl  = "http://hl7.org/fhir/us/codex-mopa/RequestGroup/THRegimenOrder"
* entry[=].resource = THRegimenOrder

* entry[+].fullUrl  = "http://hl7.org/fhir/us/codex-mopa/MedicationRequest/PaclitaxelMedRequestTH"
* entry[=].resource = PaclitaxelMedRequestTH

* entry[+].fullUrl  = "http://hl7.org/fhir/us/codex-mopa/MedicationRequest/TrastuzumabMedRequestTH"
* entry[=].resource = TrastuzumabMedRequestTH
