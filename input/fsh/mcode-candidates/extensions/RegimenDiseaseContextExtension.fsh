// ============================================================
// RegimenDiseaseContextExtension
// mCODE Migration Candidate — Proposed for mCODE STU5
// ============================================================

Extension: RegimenDiseaseContextExtension
Id: ocpa-regimen-disease-context
Title: "Regimen Disease Context"
Description: """Identifies the cancer type or specific cancer condition for which this
anti-cancer regimen is defined. May be a coded value (e.g., SNOMED CT cancer concept)
for use on canonical PlanDefinition definitions, or a reference to the patient's primary
cancer Condition for use on RequestGroup instances.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5 as an extension
on anti-cancer regimen profiles."""

* ^status = #draft
* ^experimental = true
* ^purpose = """mCODE Migration Candidate — proposed for mCODE STU5. This artifact is defined in the
MOPA IG as a temporary home while a formal mCODE ballot proposal is prepared. It is NOT
intended to be a permanent artifact of this IG. Canonical URLs will change at migration.
See the mCODE Gap Proposals page in this IG for the full proposal backlog."""

* ^context[0].type = #element
* ^context[0].expression = "PlanDefinition"
* ^context[1].type = #element
* ^context[1].expression = "RequestGroup"

* value[x] only CodeableConcept or Reference(Condition)
