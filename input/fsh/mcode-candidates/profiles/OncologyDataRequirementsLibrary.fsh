// ============================================================
// OncologyDataRequirementsLibrary
// mCODE Migration Candidate — Proposed for mCODE STU5
// ============================================================

Profile: OncologyDataRequirementsLibrary
Parent: Library
Id: oncology-data-requirements-library
Title: "Oncology Data Requirements Library"
Description: """A versioned, governable package of FHIR DataRequirement entries that
declares the patient context required to evaluate an anti-cancer therapy regimen for
prior authorization.

CRD uses this Library to determine whether the supplied patient context is sufficient
for pre-approval evaluation. DTR uses the same Library to select or generate a
questionnaire and prepopulate known data. This shared-artifact pattern eliminates
the divergence that occurs when CRD rules and DTR questionnaires are based on
separate logic.

The Library is referenced from the CDS Hooks oncology extension via
dataRequirements.canonical, or provided inline as DataRequirement[].

Cancer-specific instances (e.g., BreastCancerPADataRequirements) derive their content
from this base profile and bind Library.subjectCodeableConcept to the target cancer type.

**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5."""

* ^status = #draft
* ^experimental = true
* ^purpose = """mCODE Migration Candidate — proposed for mCODE STU5. This artifact is defined in the
OGCA IG as a temporary home while a formal mCODE ballot proposal is prepared. It is NOT
intended to be a permanent artifact of this IG. Canonical URLs will change at migration.
See the mCODE Candidates page in this IG for the full migration plan."""
* ^extension[$StdStatus].valueCode = #draft
* ^extension[$FMM].valueInteger = 0

// Type is always asset-collection (a governed collection of requirements)
* type 1..1 MS
* type = $LIB-TYPE#asset-collection "Asset Collection"

// Cancer type this Library applies to
* subject[x] 1..1 MS
* subject[x] only CodeableConcept
* subjectCodeableConcept ^short = "Cancer type for which these data requirements apply (e.g., SNOMED CT 254837009 for breast cancer)"
* subjectCodeableConcept ^binding.description = "A SNOMED CT code for the target cancer type"

// Versioning is important for stable canonical references from CDS Hooks extension
* version 1..1 MS
* name MS
* title 1..1 MS
* description MS

// The requirements themselves — this is the core content
* dataRequirement 1..* MS
* dataRequirement ^short = "Individual patient data requirements for CRD evaluation and DTR collection"
* dataRequirement ^definition = """Each DataRequirement entry declares one category of patient data needed to evaluate
the regimen for prior authorization. CRD checks whether this data is present. DTR
collects it if absent. Requirements SHOULD use mCODE profiles where available."""

// Related artifacts (canonical regimen definitions this Library applies to)
* relatedArtifact MS
* relatedArtifact ^short = "Canonical regimen definitions that reference this Library"
