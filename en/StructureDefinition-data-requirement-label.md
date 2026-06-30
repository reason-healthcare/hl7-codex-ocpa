#  - MOPA — Medical Oncology Prior Authorization v0.1.0

## Extension: 

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Oncology Data Requirements Library](StructureDefinition-oncology-data-requirements-library.md)
* Examples for this Extension: [BreastCancerPADataRequirements](Library-BreastCancerPADataRequirements.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.us.codex-ocpa|current/StructureDefinition/data-requirement-label)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

*  [Differential Table](#tabs-diff) 
*  [Snapshot Table](#tabs-snap) 
*  [Statistics/References](#tabs-summ) 
*  [All](#tabs-all) 

#### Constraints

** Summary **

Simple Extension with the type string: A human-readable label that identifies a DataRequirement entry within an OncologyDataRequirementsLibrary. Used by tools such as DTR questionnaire generators and CRD content viewers to display requirement names without parsing profile URLs.

The first DataRequirement entry in every condition-specific Library (the primary cancer condition) SHALL carry a label of the canonical form '[Cancer Type] Diagnosis' (e.g., 'Breast Cancer Diagnosis') to make the diagnostic prerequisite explicit and machine-discoverable.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5.

**[Maturity](http://hl7.org/fhir/versions.html#maturity)**: 0

 **Differential ViewDifferential View** 

 **Snapshot View** 

#### Constraints

** Summary **

Simple Extension with the type string: A human-readable label that identifies a DataRequirement entry within an OncologyDataRequirementsLibrary. Used by tools such as DTR questionnaire generators and CRD content viewers to display requirement names without parsing profile URLs.

The first DataRequirement entry in every condition-specific Library (the primary cancer condition) SHALL carry a label of the canonical form '[Cancer Type] Diagnosis' (e.g., 'Breast Cancer Diagnosis') to make the diagnostic prerequisite explicit and machine-discoverable.

**mCODE Migration Candidate** — Proposed for inclusion in mCODE STU5.

**[Maturity](http://hl7.org/fhir/versions.html#maturity)**: 0

 

Other representations of profile: [CSV](../StructureDefinition-data-requirement-label.csv), [Excel](../StructureDefinition-data-requirement-label.xlsx), [Schematron](../StructureDefinition-data-requirement-label.sch) 

