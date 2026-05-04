// ============================================================
// TreatmentLineVS — Line of Therapy Value Set
// mCODE Migration Candidate — Proposed for mCODE STU5
// ============================================================

ValueSet: TreatmentLineVS
Id: treatment-line-vs
Title: "Treatment Line Value Set"
Description: """Codes representing the ordinal line of systemic anti-cancer therapy.
Used in LineOfTherapyObservation.valueCodeableConcept and the RegimenTreatmentLine extension.

**mCODE Migration Candidate** — Proposed for mCODE STU5."""

* ^status = #draft
* ^experimental = true

* include codes from system $TreatmentLineCS
