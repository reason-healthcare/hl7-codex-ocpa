// ============================================================
// OncologyDataRequirementsLibrary
// mCODE Migration Candidate — Proposed for mCODE STU5
// ============================================================

Profile: OncologyDataRequirementsLibrary
Parent: Library
Id: oncology-data-requirements-library
Title: "Oncology Data Requirements Library"
Description: """A versioned, governable package of FHIR DataRequirement entries that
declares the patient context categories relevant for evaluating an anti-cancer therapy
regimen for prior authorization.

This artifact serves as a canonical reference for the clinical data elements a CRD
service should query when evaluating a given cancer type, and that DTR should collect
when those elements are missing from the EHR. Each DataRequirement entry declares one
category of patient data (e.g., cancer staging, biomarker status, line of therapy).

Cancer-specific instances (e.g., BreastCancerPADataRequirements) derive from this base
profile and bind Library.subjectCodeableConcept to the target cancer type.

**mCODE Migration Candidate** — This profile is proposed for inclusion in mCODE STU5."""

* ^status = #draft
* ^experimental = true
* ^purpose = """mCODE Migration Candidate — proposed for mCODE STU5. This artifact is defined in the
MOPA IG as a temporary home while a formal mCODE ballot proposal is prepared. It is NOT
intended to be a permanent artifact of this IG. Canonical URLs will change at migration.
See the mCODE Gap Proposals page in this IG for the full proposal backlog."""
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

// Versioning supports stable canonical references
* version 1..1 MS
* name MS
* title 1..1 MS
* description MS

// The requirements themselves — this is the core content
* dataRequirement 1..* MS
* dataRequirement ^short = "Individual patient data categories for CRD evaluation and DTR collection"
* dataRequirement ^definition = """Each DataRequirement entry declares one category of patient data relevant
to evaluating the regimen for prior authorization. The CRD service queries for this data
from the EHR FHIR server. DTR collects it if absent. Requirements SHOULD use mCODE
profiles where available."""

// Related artifacts (canonical regimen definitions this Library applies to)
* relatedArtifact MS
* relatedArtifact ^short = "Canonical regimen definitions that reference this Library"
