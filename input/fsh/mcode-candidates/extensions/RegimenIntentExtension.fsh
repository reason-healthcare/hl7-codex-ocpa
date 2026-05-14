// ============================================================
// RegimenIntentExtension
// mCODE Migration Candidate — Proposed for mCODE STU5
// ============================================================

Extension: RegimenIntentExtension
Id: ocpa-regimen-intent
Title: "Regimen Intent"
Description: """The clinical intent of the anti-cancer regimen (e.g., curative,
palliative, adjuvant, neoadjuvant, supportive). Applies to both the canonical regimen
definition (PlanDefinition) and the patient-specific ordered instance (RequestGroup).

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension
on anti-cancer regimen profiles."""

* ^status = #draft
* ^experimental = true
* ^purpose = """mCODE Migration Candidate — proposed for mCODE STU5. This artifact is defined in the
OGCA IG as a temporary home while a formal mCODE ballot proposal is prepared. It is NOT
intended to be a permanent artifact of this IG. Canonical URLs will change at migration.
See the mCODE Candidates page in this IG for the full migration plan."""

* ^context[0].type = #element
* ^context[0].expression = "PlanDefinition"
* ^context[1].type = #element
* ^context[1].expression = "RequestGroup"

* value[x] only CodeableConcept
* valueCodeableConcept from RegimenIntentVS (extensible)
