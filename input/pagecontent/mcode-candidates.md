
### Purpose

Several FHIR artifacts defined in this IG are **not** intended to be permanent residents of the
OGCA IG. They are defined here as a temporary home while a formal proposal to incorporate them
into [mCODE](http://hl7.org/fhir/us/mcode) is developed and balloted. Once adopted by mCODE,
this IG will remove its local definitions and take a dependency on the mCODE versions.

<div class="alert alert-warning" markdown="1">
**These artifacts are mCODE migration candidates.**  
They are published here to enable pilots and early implementation, not as stable OGCA-owned
definitions. Implementers should anticipate that the canonical URLs of these artifacts will
change when they migrate to mCODE, and should plan for a versioned cutover.
</div>

### Why Define Them Here?

mCODE STU4 does not yet include:
- A first-class, computable anti-cancer regimen resource (`PlanDefinition` / `RequestGroup` profiles)
- A structured line-of-therapy observation
- Regimen-level clinical context extensions (intent, treatment line, disease context)
- A structured data requirements Library pattern for oncology PA

These gaps block implementation of the OGCA CRD/DTR/PAS workflow today. Rather than wait for
mCODE STU5, this IG defines the minimum necessary artifacts under the OGCA canonical base
(`http://hl7.org/fhir/us/codex-ocpa`) so that pilots can proceed. All candidate artifacts carry
`status = draft` and `experimental = true`.

### Migration Plan

The following artifacts are proposed for mCODE STU5. Each entry lists the artifact defined
here and the anticipated mCODE destination.

#### Profiles

| Artifact | Defined in this IG | Proposed mCODE Destination |
|---|---|---|
| Anti-Cancer Regimen PlanDefinition | [AntiCancerRegimenPlanDefinition](StructureDefinition-anticancer-regimen-plandefinition.html) | `mcode-anticancer-regimen-plandefinition` (STU5 new profile) |
| Anti-Cancer Regimen RequestGroup | [AntiCancerRegimenRequestGroup](StructureDefinition-anticancer-regimen-requestgroup.html) | `mcode-anticancer-regimen-requestgroup` (STU5 new profile) |
| Line of Therapy Observation | [LineOfTherapyObservation](StructureDefinition-line-of-therapy-observation.html) | `mcode-line-of-therapy` (STU5 new profile) |
| Oncology Data Requirements Library | [OncologyDataRequirementsLibrary](StructureDefinition-oncology-data-requirements-library.html) | `mcode-oncology-data-requirements-library` (STU5 new profile) |
{: .table }

#### Extensions

| Artifact | Defined in this IG | Proposed mCODE Destination |
|---|---|---|
| Regimen Intent | [RegimenIntentExtension](StructureDefinition-ocpa-regimen-intent.html) | `mcode-regimen-intent` extension |
| Regimen Treatment Line | [RegimenTreatmentLineExtension](StructureDefinition-ocpa-regimen-treatment-line.html) | `mcode-regimen-treatment-line` extension |
| Regimen Disease Context | [RegimenDiseaseContextExtension](StructureDefinition-ocpa-regimen-disease-context.html) | `mcode-regimen-disease-context` extension |
| Regimen Days of Cycle | [RegimenDaysOfCycle](StructureDefinition-regimen-days-of-cycle.html) | Context-expansion request against `http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle` in HL7 FHIR Extensions pack |
{: .table }

#### Terminology

| Artifact | Defined in this IG | Proposed Destination |
|---|---|---|
| Regimen Intent Value Set | [RegimenIntentVS](ValueSet-regimen-intent-vs.html) | mCODE STU5 — all codes sourced from SNOMED CT (no local codes) |
| Treatment Line Code System | [TreatmentLineCS](CodeSystem-treatment-line-cs.html) | SNOMED CT extension request or mCODE-managed code system |
| Treatment Line Value Set | [TreatmentLineVS](ValueSet-treatment-line-vs.html) | mCODE STU5 — will bind to SNOMED CT or successor codes |
| OGCA Local Code System | [OcpaCodesCS](CodeSystem-ocpa-codes.html) | Individual codes submitted to LOINC / SNOMED CT; code system retired on assignment |
{: .table }

### What Implementers Should Do

- **Treat these artifacts as unstable.** Canonical URLs will change at mCODE migration.
- **Watch the [mCODE project page](https://confluence.hl7.org/display/COD/mCODE)** for STU5
  ballot announcements that include these artifacts.
- **Use the OGCA canonical URLs for pilots** — they are supported and will not be removed
  without a published migration path.
- **Do not create derived profiles or extensions** on these artifacts without accepting the
  re-base cost when migration occurs.

### Relationship to Permanent OGCA Artifacts

The following artifacts are OGCA-owned and are **not** proposed for migration to mCODE. They
define the oncology CRD/DTR/PAS integration layer and will remain in this IG:

- [OncologyDataRequirementsLibrary](StructureDefinition-oncology-data-requirements-library.html) instances (e.g., `BreastCancerPADataRequirementsLibrary`) — cancer-specific content owned by OGCA
- CDS Hooks extension definition (`org.hl7.davinci-crd.oncology`)
- [Oncology CRD Client Capability Statement](CapabilityStatement-ocpa-crd-client.html)
- [Oncology CRD Service Capability Statement](CapabilityStatement-ocpa-crd-service.html)
