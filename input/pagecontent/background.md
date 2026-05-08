
### The Oncology Prior Authorization Problem

For oncology patients, the prior authorization process between clinicians and health plans is
fragmented, slow, and often disconnected from the clinical evidence that guided the treatment
decision. Clinicians document the same information in multiple systems. Payers request data
already in the medical record. Approvals are delayed. Treatments are postponed.

The problem is consistent across cancer types — breast, lung, colorectal, hematologic, and
beyond. The root cause is structural: there is no shared, standards-based language for oncology
treatment decisions, and no common way to move the right clinical data from the point of care
to the authorization system at the right moment.

### Regulatory Context

**CMS-0062-P** (proposed April 2026) extends prior authorization requirements to prescription
drugs, including chemotherapeutics and anti-cancer agents. For the first time, health plans face
federal requirements to support structured, electronic prior authorization for the drug classes at
the center of oncology care. No interoperability standard currently exists that adequately
addresses how to exchange the clinical context — regimen, stage, biomarkers, line of therapy —
that oncology drug authorization actually requires.

### Gaps in Existing Standards

#### Da Vinci CRD / DTR / PAS

Da Vinci significantly improves the mechanics of prior authorization, but it operates:
- **Reactively (post-order)** — starting after order selection with no ability to guide regimen
  choice upfront, leading to rework and avoidable denials
- **At the service level, not regimen level** — authorization is per medication, while oncology
  decisions are made at the protocol level
- **Without clinical equivalence semantics** — no standard way to express preferred vs acceptable
  regimen options or step therapy within oncology care
- **Without an oncology data foundation** — US Core alone does not support staging, biomarkers,
  or treatment context, resulting in heavy DTR burden

#### mCODE

mCODE provides a strong foundation for oncology interoperability — diagnosis, staging, biomarkers,
performance status, and treatment events — but does not yet:
- Represent **anti-cancer regimens as first-class, computable entities** (ordered treatment plans
  rather than individual medication requests)
- Standardize **line-of-therapy and treatment setting** concepts required for PA decisions
- Express **clinical equivalence or preference** across regimens
- Provide a **structured PA submission package** that carries all required patient context

### The Role of a Guideline Authority

An independent guideline authority (such as NCCN or ASCO) can play a unique dual role: serving
both as a trusted source of **clinical decision support** and as a neutral arbiter of baseline
electronic prior authorization. By publishing evidence-based, computable guidance that defines
clinically appropriate and equivalent treatment options, the authority establishes a common
foundation that both providers and payers rely on.

This creates the opportunity for a **baseline approval layer**, where treatments that adhere to
guideline-defined criteria can be automatically recognized as appropriate for authorization,
reducing variability across payers.

### Relationship to This IG

This IG fills the identified gaps by defining:

1. A **computable anti-cancer regimen representation** — `PlanDefinition` (canonical protocol)
   and `RequestGroup` (patient-specific ordered instance)
2. A **CDS Hooks oncology extension** for `order-select` / `order-sign` that carries the regimen
   and required patient context to the coverage decision service
3. A **data requirements Library pattern** that drives both CRD pre-approval evaluation and DTR
   documentation collection from the same artifact
4. A **cancer-specific data requirements package** pattern — `OncologyDataRequirementsLibrary` —
   with breast cancer PA as the first concrete implementation (`BreastCancerPADataRequirementsLibrary`),
   designed to be replicated for lung, colorectal, hematologic, and other cancer types

These artifacts are designed as incremental extensions to Da Vinci CRD/DTR/PAS and mCODE, not as
replacements.
