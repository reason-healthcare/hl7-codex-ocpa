// ============================================================
// LineOfTherapyObservation
// mCODE Migration Candidate — Proposed for mCODE STU5
//
// LOINC and SNOMED CT do not have an established code for "line of
// therapy number" as a clinical observation value. The observation
// code uses the local OcpaCodesCS#line-of-therapy as a migration
// placeholder until a standard LOINC code is assigned.
// ============================================================

Profile: LineOfTherapyObservation
Parent: Observation
Id: line-of-therapy-observation
Title: "Line of Therapy Observation"
Description: """An Observation that documents the ordinal line of systemic anti-cancer
therapy a patient is currently receiving or has received for a given cancer diagnosis.

This observation is a required patient data element for oncology prior authorization:
most metastatic and recurrent cancer regimen policies are line-of-therapy dependent.

Observation.code uses the local OCPA code system code `line-of-therapy` as a placeholder.
A migration request for a LOINC code will be submitted before mCODE STU5.

Observation.value[x] SHALL be a CodeableConcept drawn from TreatmentLineVS.
The focus SHALL reference the primary cancer Condition for which this line applies.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5."""

* ^status = #draft
* ^experimental = true
* ^extension[$StdStatus].valueCode = #draft
* ^extension[$FMM].valueInteger = 0

* status 1..1 MS
* status ^short = "final | amended | corrected"

* category MS
* category = $OBS-CAT#therapy "Therapy"

// Observation code — local OCPA placeholder pending LOINC assignment
* code 1..1 MS
* code = $OcpaCS#line-of-therapy "Line of Therapy"
* code ^short = "Identifies this as a line-of-therapy observation"

// The patient
* subject 1..1 MS
* subject only Reference($USCorePatient or $mCODECancerPatient)

// The cancer condition this line of therapy applies to
* focus 1..* MS
* focus only Reference(Condition)
* focus ^short = "The primary cancer Condition for which this line of therapy applies. SHOULD reference an mcode-primary-cancer-condition."

// The observed line value
* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from TreatmentLineVS (required)
* valueCodeableConcept ^short = "First-line | Second-line | Third-line or later | Maintenance"

// When this line began
* effective[x] MS
* effective[x] only dateTime or Period
* effective[x] ^short = "Date or period when this line of therapy began"

// Derived elements are not required
* component 0..0
