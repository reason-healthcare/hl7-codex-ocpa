// ============================================================
// Aliases for the OCPA Implementation Guide
// ============================================================

// Standard terminology systems
Alias: $SCT        = http://snomed.info/sct
Alias: $LOINC      = http://loinc.org
Alias: $UCUMcs     = http://unitsofmeasure.org
Alias: $ICD10CM    = http://hl7.org/fhir/sid/icd-10-cm
Alias: $RxNorm     = http://www.nlm.nih.gov/research/umls/rxnorm

// HL7 FHIR terminology
Alias: $PD-TYPE         = http://terminology.hl7.org/CodeSystem/plan-definition-type
Alias: $LIB-TYPE        = http://terminology.hl7.org/CodeSystem/library-type
Alias: $RQ-INTENT       = http://hl7.org/fhir/request-intent
Alias: $OBS-CAT         = http://terminology.hl7.org/CodeSystem/observation-category

// Standard HL7 extensions
Alias: $DaysOfCycle     = http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle
Alias: $StdStatus       = http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status
Alias: $FMM             = http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm

// US Core profiles
Alias: $USCorePatient       = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: $USCorePractitioner  = http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Alias: $USCoreCondition     = http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-encounter-diagnosis

// mCODE profiles
Alias: $mCODECancerPatient     = http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-patient
Alias: $mCODEPrimaryCancer     = http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition
Alias: $mCODECancerMedRequest  = http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-related-medication-request
Alias: $mCODETumorMarker       = http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test
Alias: $mCODEDiseaseStatus     = http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-disease-status
Alias: $mCODEECOG              = http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-ecog-performance-status

// OCPA local code systems
Alias: $OcpaCS             = http://hl7.org/fhir/us/codex-ocpa/CodeSystem/ocpa-codes
Alias: $TreatmentLineCS    = http://hl7.org/fhir/us/codex-ocpa/CodeSystem/treatment-line-cs
