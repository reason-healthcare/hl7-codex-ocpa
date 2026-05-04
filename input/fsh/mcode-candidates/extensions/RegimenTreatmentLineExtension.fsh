// ============================================================
// RegimenTreatmentLineExtension
// mCODE Migration Candidate — Proposed for mCODE STU5
// ============================================================

Extension: RegimenTreatmentLineExtension
Id: ocpa-regimen-treatment-line
Title: "Regimen Treatment Line"
Description: """The ordinal line of systemic anti-cancer therapy for which this
regimen is defined (e.g., first-line, second-line, maintenance). Applies to both the
canonical regimen definition (PlanDefinition) and the patient-specific ordered instance
(RequestGroup).

Note: This extension captures the regimen's *designed* treatment line. To document the
patient's *current* line of therapy as a clinical observation, use LineOfTherapyObservation.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension
on anti-cancer regimen profiles."""

* ^status = #draft
* ^experimental = true

* ^context[0].type = #element
* ^context[0].expression = "PlanDefinition"
* ^context[1].type = #element
* ^context[1].expression = "RequestGroup"

* value[x] only CodeableConcept
* valueCodeableConcept from TreatmentLineVS (extensible)
