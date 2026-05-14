// ============================================================
// RegimenIntentVS — Regimen Intent Value Set
// mCODE Migration Candidate — Proposed for mCODE STU5
//
// All codes are drawn from the SNOMED CT "Intents (nature of procedure
// values)" hierarchy (363675004), verified via reasonhub MCP:
//   373808002 — Curative - procedure intent (qualifier value)
//               parent: 262202000 Therapeutic intent
//   363676003 — Palliative intent (qualifier value)
//               parent: 363675004 Intents
//   373846009 — Adjuvant - intent (qualifier value)
//               parent: 262202000 Therapeutic intent
//   373847000 — Neoadjuvant intent (qualifier value)
//               parent: 262202000 Therapeutic intent
//   399707004 — Supportive - procedure intent (qualifier value)
//               parent: 363675004 Intents
// ============================================================

ValueSet: RegimenIntentVS
Id: regimen-intent-vs
Title: "Regimen Intent Value Set"
Description: """The clinical intent of an anti-cancer regimen. All codes are drawn from
the SNOMED CT \"Intents (nature of procedure values)\" hierarchy (363675004).

**mCODE Migration Candidate** — Proposed for mCODE STU5."""

* ^status = #draft
* ^experimental = true
* ^purpose = """mCODE Migration Candidate — proposed for mCODE STU5. All codes are sourced from
SNOMED CT (no local codes required). This value set will reference the mCODE canonical URL
once adopted. It is NOT intended to be a permanent artifact of this IG. See the mCODE
Candidates page for the migration plan."""

* $SCT#373808002  "Curative - procedure intent"
* $SCT#363676003  "Palliative intent"
* $SCT#373846009  "Adjuvant - intent"
* $SCT#373847000  "Neoadjuvant intent"
* $SCT#399707004  "Supportive - procedure intent"
