# Oncology Prior Authorization: Executive Summary

## The Problem

Getting cancer treatment approved takes too long.

For patients with breast cancer and other oncology diagnoses, the prior authorization process between oncologists and health plans is fragmented, slow, and often disconnected from the clinical evidence that guided the treatment decision in the first place. Clinicians document the same information in multiple systems. Payers request data that is already in the medical record. Approvals are delayed. Treatments are postponed.

The root cause is structural: there is no shared, standards-based language for oncology treatment decisions, and no common way to move the right clinical data from the point of care to the authorization system at the right moment.

**The regulatory pressure is now direct.** CMS-0062-P, proposed in April 2026, extends prior authorization requirements to prescription drugs — including chemotherapeutics and anti-cancer agents. For the first time, health plans face federal requirements to support structured, electronic prior authorization for the drug classes at the center of oncology care. The compliance window is short, and no interoperability standard currently exists that adequately addresses how to exchange the clinical context — regimen, stage, biomarkers, line of therapy — that oncology drug authorization actually requires.

---

## What We Are Proposing

We are proposing a standards-based oncology prior authorization framework built on existing open HL7 standards — specifically the **Da Vinci Burden Reduction** suite and **mCODE** (Minimal Common Oncology Data Elements).

The framework has two connected layers:

### 1. Guideline-Aligned Clinical Planning (at the point of order)

Before a clinician places an order, the EHR surfaces relevant clinical decision support based on the patient's specific situation — diagnosis, stage, biomarkers (e.g., ER/PR/HER2 status), and line of therapy.

The system draws on computable, published guidelines to recommend regimens that are both clinically appropriate and likely to meet payer criteria. The goal is to align the treatment decision with known coverage requirements *before* the order is placed — not after a denial.

### 2. Structured Authorization Exchange (between provider and payer)

Once an order is placed, the framework uses the Da Vinci CRD/DTR/PAS workflow to transmit a structured, computable authorization request to the payer. Rather than submitting free text or PDFs, the request carries structured clinical data: the ordered regimen, the patient's cancer diagnosis and staging, biomarker results, disease status, and line of therapy — all in a machine-readable format both sides can act on.

This eliminates redundant data collection, enables real-time decision support during the ordering workflow, and supports faster, more consistent authorization responses.

---

## Why This Approach

**Built on open standards.** The framework extends HL7 FHIR standards already in active use and under active development by major EHR vendors, payers, and health IT organizations. It does not require proprietary integration or point-to-point contracting.

**Addresses a proven gap.** The current mCODE standard provides strong coverage for oncology clinical data but does not include a computable representation of anti-cancer regimens as ordered treatment plans, or a structured pattern for packaging oncology prior authorization data requirements. This proposal fills both gaps.

**Reduces burden on both sides.** Providers spend less time preparing and resubmitting authorization requests. Payers receive structured, computable data they can evaluate programmatically — reducing manual review and inconsistent decisions.

**Directly responsive to CMS-0062-P.** The proposed rule requires structured electronic prior authorization for prescription drugs. This framework provides the interoperability layer specifically missing for oncology: a computable regimen profile, a standard patient-context package, and a CDS Hooks extension that enables payer systems to evaluate anti-cancer drug authorization requests using the same clinical data that drives the prescribing decision.

**Designed for first-pass success.** By surfacing coverage alignment at the point of clinical decision-making, the framework increases the probability that the treatment ordered is the treatment approved — reducing denials, peer-to-peer reviews, and treatment delays.

---

## What a Successful Outcome Looks Like

- An oncologist selects a breast cancer regimen. The EHR confirms it is guideline-aligned and likely to meet payer criteria before the order is signed.
- The authorization request is submitted with structured clinical data — diagnosis, stage, biomarkers, regimen — automatically assembled from the existing chart.
- The payer's system evaluates the request against computable rules using the same data standards.
- Approval is returned in real time or within hours, not days or weeks.
- The patient starts treatment on schedule.

---

## Scope of the Current Work

This effort is scoped to **breast cancer prior authorization** as the lead use case, with a design that generalizes to other oncology types.

The current deliverables are:

1. A proposed CDS Hooks extension for oncology CRD — defining how the ordered regimen and required patient context are communicated to a coverage decision service.
2. Anti-cancer regimen profiles — a canonical regimen definition and a patient-specific ordered instance, structured to carry the treatment schedule (cycle days, sequential phases) needed for authorization evaluation.
3. A breast cancer PA data requirements matrix — mapping each clinical data element needed for authorization to existing mCODE / FHIR representations, identifying gaps, and recommending new profiles or constraints where needed.

These artifacts are intended for submission to the relevant HL7 working groups as the basis for a formal oncology prior authorization implementation guide or CRD oncology profile.

---

## Stakeholders and Beneficiaries

| Stakeholder | Benefit |
|---|---|
| Oncology practices | Fewer authorization delays; reduced administrative workload |
| Cancer patients | Faster access to guideline-appropriate treatment |
| Health plans / payers | Structured, computable authorization requests; fewer manual reviews |
| EHR vendors | Reusable, standards-based integration pattern for oncology workflows |
| HL7 / standards community | Fills a documented gap in mCODE and Da Vinci coverage for oncology |
