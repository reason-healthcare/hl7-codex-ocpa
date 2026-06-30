#  - MOPA — Medical Oncology Prior Authorization v0.1.0

## Library: 

* Metadata: Title
  * ?: Breast Cancer Prior Authorization Data Requirements
* Metadata: Version
  * ?: 0.1.0
* Metadata: Experimental
  * ?: true
* Metadata: Subject Type
  * ?: Malignant neoplasm of breast
* Metadata: Jurisdiction
  * ?: United States of America
* Metadata: Steward (Publisher)
  * ?: HL7 International / Clinical Interoperability Council
* Metadata: Steward Contact
  * ?: HL7 International / Clinical Interoperability Council
* Metadata: Description
  * ?: DataRequirement categories for breast cancer PA evaluation. The CRD service queries these categories from the EHR FHIR server when evaluating a breast cancer regimen order.
* Metadata: Type
  * ?: Asset Collection
* Metadata: Data Requirement
  * ?: **Type**: Condition**Profile(s)**:[Primary Cancer Condition Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-primary-cancer-condition.html)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[TNM Stage Group Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-tnm-stage-group.html)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[TNM Primary Tumor Category Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-tnm-primary-tumor-category.html)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[TNM Regional Nodes Category Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-tnm-regional-nodes-category.html)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[TNM Distant Metastases Category Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-tnm-distant-metastases-category.html)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[Tumor Marker Test Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-tumor-marker-test.html)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[Cancer Disease Status Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-cancer-disease-status.html)
* Metadata: Data Requirement
  * ?: **Type**: RequestGroup**Profile(s)**:[Anti-Cancer Regimen RequestGroup](StructureDefinition-anticancer-regimen-requestgroup.md)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[Line of Therapy Observation](StructureDefinition-line-of-therapy-observation.md)
* Metadata: Data Requirement
  * ?: **Type**: Observation**Profile(s)**:[ECOG Performance Status Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-ecog-performance-status.html)
* Metadata: Data Requirement
  * ?: **Type**: MedicationRequest**Profile(s)**:[Cancer-Related Medication Request Profile](http://hl7.org/fhir/us/mcode/STU4/StructureDefinition-mcode-cancer-related-medication-request.html)
* Metadata:  Parameters
* Metadata: Parameter
  * ?: None
* Metadata: Generated using version 0.5.4 of the sample-content-ig Liquid templates

