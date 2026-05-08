# Oncology Guideline and Coverage Authorization (OGCA) Implementation Guide

<div class="ogca-logo-bar">
<img src="codex-logo.png" alt="HL7 CodeX FHIR Accelerator" />
<div class="ogca-logo-tagline">A FHIR Accelerator Program implementation guide<br/>extending Da Vinci CRD / DTR / PAS for oncology prior authorization</div>
</div>

This implementation guide defines the **Oncology Guideline and Coverage Authorization (OGCA)**
framework that extends the [Da Vinci Burden Reduction](https://confluence.hl7.org/display/DVP)
suite — CRD, DTR, and PAS — with oncology-specific capabilities applicable across all cancer
types: a computable anti-cancer regimen representation and a structured patient context package
for authorization evaluation.

### The Problem

Getting cancer treatment approved takes too long. For patients with breast cancer and other
oncology diagnoses, prior authorization is fragmented, slow, and disconnected from the clinical
evidence that guided the treatment decision. There is no shared, standards-based language for
oncology treatment decisions and no common way to move the right clinical data from the point of
care to the authorization system at the right moment.

**The regulatory pressure is now direct.** CMS-0062-P (April 2026) extends prior authorization
requirements to prescription drugs — including chemotherapeutics and anti-cancer agents.

### The Framework

This IG addresses two connected layers:

1. **Optional pre-order CDS** — guideline-aligned regimen recommendations surfaced in the EHR
   before an order is placed, increasing the likelihood that the treatment ordered meets coverage
   criteria.

2. **Structured authorization exchange** — a CDS Hooks extension for oncology CRD that carries the
   ordered regimen and required patient context (diagnosis, staging, biomarkers, line of therapy)
   to the coverage decision service as structured, computable data.

<div style="border:2px solid #555; border-radius:6px; padding:16px; margin:1.2em 0; font-family:inherit; max-width:800px;">
<div style="text-align:center; font-weight:bold; font-size:1.1em; margin-bottom:14px;">The OGCA Framework</div>
<div style="display:flex; gap:12px; margin-bottom:10px;">
<div style="flex:1; border:2px solid #5b9bd5; border-radius:4px; padding:10px;">
<div style="font-weight:bold; text-align:center; margin-bottom:8px;">Optional Pre-order CDS</div>
<div style="display:flex; gap:8px; justify-content:center;">
<div style="border:1px solid #5b9bd5; border-radius:3px; padding:4px 14px; background:#dce6f1;"><a href="https://hl7.org/fhir/uv/crmi/" target="_blank" rel="noopener noreferrer">CRMI</a></div>
<div style="border:1px solid #5b9bd5; border-radius:3px; padding:4px 14px; background:#dce6f1;"><a href="https://hl7.org/fhir/uv/cpg/" target="_blank" rel="noopener noreferrer">CPG</a></div>
</div>
</div>
<div style="flex:1; border:2px solid #70ad47; border-radius:4px; padding:10px;">
<div style="font-weight:bold; text-align:center; margin-bottom:8px;">Structured Auth Exchange</div>
<div style="display:flex; gap:8px; justify-content:center;">
<div style="border:1px solid #70ad47; border-radius:3px; padding:4px 14px; background:#e2efda;"><a href="https://hl7.org/fhir/us/davinci-crd/" target="_blank" rel="noopener noreferrer">CRD</a></div>
<div style="border:1px solid #70ad47; border-radius:3px; padding:4px 14px; background:#e2efda;"><a href="https://hl7.org/fhir/us/davinci-dtr/" target="_blank" rel="noopener noreferrer">DTR</a></div>
<div style="border:1px solid #70ad47; border-radius:3px; padding:4px 14px; background:#e2efda;"><a href="https://hl7.org/fhir/us/davinci-pas/" target="_blank" rel="noopener noreferrer">PAS</a></div>
</div>
</div>
</div>
<div style="border:2px solid #c0392b; border-radius:4px; padding:10px; margin-bottom:10px;">
<div style="font-weight:bold; text-align:center; margin-bottom:8px; color:#c0392b;">Domain Models</div>
<div style="display:flex; gap:12px;">
<div style="flex:1; border:1px solid #c0392b; border-radius:3px; padding:6px; text-align:center; background:#fdf0ee; font-weight:bold;"><a href="https://hl7.org/fhir/us/mcode/" target="_blank" rel="noopener noreferrer">mCODE</a></div>
<div style="flex:1; border:1px solid #c0392b; border-radius:3px; padding:6px; text-align:center; background:#fdf0ee; font-weight:bold;"><a href="https://hl7.org/fhir/us/core/" target="_blank" rel="noopener noreferrer">US Core</a></div>
</div>
</div>
<div style="border:2px solid #e67e22; border-radius:4px; padding:10px;">
<div style="font-weight:bold; text-align:center; margin-bottom:8px; color:#e67e22;">Enablers</div>
<div style="display:flex; gap:12px;">
<div style="flex:1; border:1px solid #e67e22; border-radius:3px; padding:6px; text-align:center; background:#fef5ec; font-weight:bold;"><a href="https://cds-hooks.hl7.org/" target="_blank" rel="noopener noreferrer">CDS Hooks</a></div>
<div style="flex:1; border:1px solid #e67e22; border-radius:3px; padding:6px; text-align:center; background:#fef5ec; font-weight:bold;"><a href="https://hl7.org/fhir/smart-app-launch/" target="_blank" rel="noopener noreferrer">SMART Launch</a></div>
</div>
</div>
</div>

### Scope

**In scope:**
- All oncology cancer types (solid tumors and hematologic malignancies)
- Anti-cancer regimen representation as a first-class FHIR artifact
- CDS Hooks extension for oncology `order-select` and `order-sign`
- Patient context data requirements for oncology PA evaluation
- **Use Case 1: Breast cancer prior authorization** — the first concrete data requirements
  implementation, serving as the template for other cancer types

**Out of scope (this version):**
- **Coverage adjudication and benefit determination** — whether a treatment is covered is a payer decision; this IG delivers the structured request, not the decision logic
- **Post-denial workflows** — appeals, grievances, and peer-to-peer review processes
- **Regimen clinical equivalence and preference ranking** — comparative effectiveness of treatment options is a clinical decision support concern outside authorization exchange
- **Dose calculation and modification rules** — weight-based dosing, renal/hepatic adjustments, and toxicity-driven modifications are out of scope
- **Pharmacy benefit management (PBM) integration** — specialty pharmacy routing, formulary lookups, and drug pricing are not addressed
- **Radiation therapy and surgical procedure authorization** — this version covers anti-cancer drug regimens only
- **X12 transaction details** — EDI mapping is delegated to Da Vinci PAS
- **Clinical trial eligibility matching** — protocol screening and trial enrollment are outside the authorization workflow modeled here

### Stakeholders

| Stakeholder | Benefit |
|---|---|
| **Oncology Practice / Clinician** | Guideline-aligned recommendations surface at the moment of ordering — structuring the treatment decision in a way that moves through authorization without friction |
| **Cancer Patient** | Guideline-appropriate treatment is authorized faster because the clinical evidence supporting the decision arrives at the payer in a structured, computable form |
| **Health Plan / Payer** | Authorization requests carry the structured clinical evidence — diagnosis, staging, biomarkers, line of therapy — that coverage policy requires, enabling consistent, evidence-grounded determinations |
| **EHR / Ordering System** | A single conformant integration delivers guideline-aligned CDS and structured authorization requests across all payers and cancer types, replacing fragmented per-payer builds |
| **Guideline Authority** | Computable regimen definitions flow directly from publication into clinical decision support and payer coverage evaluation — creating a traceable path from evidence to real-world treatment authorization |

<div style="max-width: 800px;">
![OGCA Stakeholder Diagram](ogca-stakeholders.svg)
</div>

### Dependencies

| Implementation Guide | Version | Role |
|---|---|---|
| [US Core](http://hl7.org/fhir/us/core) | 7.0.0 | Base US patient, practitioner, and clinical data profiles |
| [mCODE](http://hl7.org/fhir/us/mcode) | 4.0.0 | Oncology clinical data foundation |
| [Da Vinci CRD](http://hl7.org/fhir/us/davinci-crd) | 2.1.0 | Coverage Requirements Discovery workflow backbone |
| [Da Vinci DTR](http://hl7.org/fhir/us/davinci-dtr) | 2.0.0 | Documentation Templates and Rules |
| [Da Vinci PAS](http://hl7.org/fhir/us/davinci-pas) | 2.2.1 | Prior Authorization Support |

### How to Read This Guide

- [Background](background.html) — Clinical problem, regulatory context, and gaps in existing standards
- [Use Cases and Actors](use-cases.html) — The two-layer workflow, system actors, and actor responsibilities
- **Specification:**
  - [Regimen Modeling](regimen-model.html) — How anti-cancer regimens are represented as FHIR `PlanDefinition` and `RequestGroup`
  - [CDS Hooks Oncology Extension](cds-hooks-extension.html) — The CDS Hooks extension for oncology CRD
  - [Data Requirements Pattern](data-requirements.html) — The `Library`-based patient context package for CRD and DTR
  - [Breast Cancer PA](breast-cancer-pa.html) — Breast cancer-specific data requirements and gap analysis
- [Conformance](conformance.html) — Requirements for claiming conformance to this IG
- [Artifacts](artifacts.html) — All profiles, extensions, value sets, and examples
