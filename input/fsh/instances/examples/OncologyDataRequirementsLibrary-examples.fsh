// ============================================================
// OncologyDataRequirementsLibrary-examples.fsh
// 1 instance: BreastCancerPADataRequirements
//   The first cancer-specific Library derived from OncologyDataRequirementsLibrary.
//   Declares all patient data requirements for breast cancer PA evaluation.
//   Used by CRD to assess pre-approval eligibility and by DTR to drive
//   questionnaire generation and prepopulation.
// ============================================================

Instance: BreastCancerPADataRequirements
InstanceOf: OncologyDataRequirementsLibrary
Usage: #example
Title: "Example Data Requirements Library: Breast Cancer Prior Authorization"
Description: """Cancer-specific data requirements Library for breast cancer prior
authorization evaluation. Declares the patient data elements that CRD uses to determine
pre-approval eligibility and DTR uses to collect or prepopulate missing documentation.

Covers: primary cancer condition, TNM staging, ER/PR/HER2 biomarkers, disease status,
ordered regimen, line of therapy, performance status, and prior therapy history."""

* url     = "http://hl7.org/fhir/us/codex-ocpa/Library/BreastCancerPADataRequirements"
* version = "1.0.0"
* name    = "BreastCancerPADataRequirements"
* title   = "Breast Cancer Prior Authorization Data Requirements"
* status  = #active
* experimental = true
* type    = $LIB-TYPE#asset-collection "Asset Collection"
* subjectCodeableConcept = $SCT#254837009 "Malignant neoplasm of breast"
* description = "DataRequirement package for breast cancer PA. Use this Library canonical in the CDS Hooks oncology extension dataRequirements.canonical field."

// ── Diagnosis ─────────────────────────────────────────────────────────────
* dataRequirement[+].type    = #Condition
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition"

// ── Staging: TNM stage group ───────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-stage-group"

// ── Staging: T category ───────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-primary-tumor-category"

// ── Staging: N category ───────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-regional-nodes-category"

// ── Staging: M category ───────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-distant-metastases-category"

// ── Biomarkers: ER status ──────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"
* dataRequirement[=].codeFilter[+].path     = "code"
* dataRequirement[=].codeFilter[=].valueSet = "http://hl7.org/fhir/us/mcode/ValueSet/mcode-tumor-marker-test-vs"

// ── Biomarkers: PR status ──────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"

// ── Biomarkers: HER2 status ────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"

// ── Disease status / progression ──────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-disease-status"

// ── Ordered anti-cancer regimen ───────────────────────────────────────────
* dataRequirement[+].type    = #RequestGroup
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-requestgroup"

// ── Line of therapy ───────────────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/line-of-therapy-observation"

// ── Performance status (ECOG) ─────────────────────────────────────────────
* dataRequirement[+].type    = #Observation
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-ecog-performance-status"

// ── Prior cancer-related medication history ───────────────────────────────
* dataRequirement[+].type    = #MedicationRequest
* dataRequirement[=].profile[+] = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-related-medication-request"
