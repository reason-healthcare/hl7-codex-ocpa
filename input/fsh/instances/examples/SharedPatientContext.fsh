// ============================================================
// SharedPatientContext.fsh
// Reusable patient, condition, and practitioner instances
// referenced across all OCPA IG examples.
// ============================================================

// --- Fictional patient: Jane Smith -----------------------------------
Instance: OCPAPatientExample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Usage: #example
Title: "Example Patient: Jane Smith"
Description: """Fictional 57-year-old female patient used consistently across all OCPA
IG examples. DO NOT use real patient data."""

* identifier[+].system = "http://hospital.example.org/patients"
* identifier[=].value  = "MRN-78432"
* name[+].use    = #official
* name[=].family = "Smith"
* name[=].given[+] = "Jane"
* gender    = #female
* birthDate = "1968-04-15"
* address[+].line[+] = "42 Maple Street"
* address[=].city    = "Springfield"
* address[=].state   = "IL"
* address[=].postalCode = "62701"

// --- Fictional oncologist: Dr. Maria Lopez ---------------------------
Instance: OCPAOncologistExample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Usage: #example
Title: "Example Oncologist: Dr. Maria Lopez"
Description: "Fictional medical oncologist used across OCPA IG examples."

* identifier[+].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value  = "1234567893"
* name[+].use    = #official
* name[=].family = "Lopez"
* name[=].given[+] = "Maria"
* name[=].prefix[+] = "Dr."

// --- Primary breast cancer condition (HER2+, Stage IIB) --------------
Instance: OCPABreastCancerConditionExample
InstanceOf: http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition
Usage: #example
Title: "Example: Primary HER2+ Breast Cancer (Stage IIB)"
Description: """Invasive ductal carcinoma of right breast, HER2-positive,
Stage IIB (T2 N1 M0), diagnosed November 2025. Referenced by all OCPA examples
depicting Jane Smith's adjuvant treatment course."""

* clinicalStatus  = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code         = $SCT#254837009 "Malignant tumor of breast"
* bodySite[+]  = $SCT#80248007 "Left breast structure (body structure)"
* subject      = Reference(OCPAPatientExample)
* onsetDateTime = "2025-11-03"

// --- Primary metastatic breast cancer condition (for Scenario C) -----
Instance: OCPAMetastaticBreastCancerConditionExample
InstanceOf: http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition
Usage: #example
Title: "Example: Metastatic HER2+ Breast Cancer (Stage IV)"
Description: """Metastatic HER2-positive breast cancer with liver and bone involvement,
newly diagnosed Stage IV (de novo). Used in PHD regimen examples."""

* clinicalStatus  = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
* code         = $SCT#254837009 "Malignant tumor of breast"
* subject      = Reference(OCPAPatientExample)
* onsetDateTime = "2026-02-10"
