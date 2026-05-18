# Example Data Requirements Library: Breast Cancer Prior Authorization - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Library: Example Data Requirements Library: Breast Cancer Prior Authorization (Experimental) 

 
DataRequirement package for breast cancer PA. Use this Library canonical in the CDS Hooks oncology extension dataRequirements.canonical field. 

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
  * ?: DataRequirement package for breast cancer PA. Use this Library canonical in the CDS Hooks oncology extension dataRequirements.canonical field.
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



## Resource Content

```json
{
  "resourceType" : "Library",
  "id" : "BreastCancerPADataRequirements",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/oncology-data-requirements-library"]
  },
  "url" : "http://hl7.org/fhir/us/codex-ocpa/Library/BreastCancerPADataRequirements",
  "version" : "0.1.0",
  "name" : "BreastCancerPADataRequirements",
  "title" : "Breast Cancer Prior Authorization Data Requirements",
  "status" : "active",
  "experimental" : true,
  "type" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/library-type",
      "code" : "asset-collection",
      "display" : "Asset Collection"
    }]
  },
  "subjectCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Malignant neoplasm of breast"
    }]
  },
  "date" : "2026-05-18T11:02:07-04:00",
  "publisher" : "HL7 International / Clinical Interoperability Council",
  "contact" : [{
    "name" : "HL7 International / Clinical Interoperability Council",
    "telecom" : [{
      "system" : "url",
      "value" : "http://www.hl7.org/Special/committees/cic"
    },
    {
      "system" : "email",
      "value" : "ciclist@lists.HL7.org"
    }]
  }],
  "description" : "DataRequirement package for breast cancer PA. Use this Library canonical in the CDS Hooks oncology extension dataRequirements.canonical field.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "dataRequirement" : [{
    "type" : "Condition",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-stage-group"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-primary-tumor-category"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-regional-nodes-category"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-distant-metastases-category"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"],
    "codeFilter" : [{
      "path" : "code",
      "valueSet" : "http://hl7.org/fhir/us/mcode/ValueSet/mcode-tumor-marker-test-vs"
    }]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-disease-status"]
  },
  {
    "type" : "RequestGroup",
    "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-requestgroup"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/line-of-therapy-observation"]
  },
  {
    "type" : "Observation",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-ecog-performance-status"]
  },
  {
    "type" : "MedicationRequest",
    "profile" : ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-related-medication-request"]
  }]
}

```
