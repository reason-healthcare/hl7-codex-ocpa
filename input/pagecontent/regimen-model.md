# Regimen Modeling

### Overview

For oncology prior authorization, the selected clinical unit is not a single medication order.
It is the coordinated **anti-cancer regimen**: disease context, treatment intent, regimen
components, timing, sequential phases, and the clinical facts that justify the regimen.

This IG defines two complementary profiles that separate the *definition* of a regimen from its
*instantiation* as a patient-specific order.

### The PlanDefinition / RequestGroup Separation

```
PlanDefinition    ← canonical, reusable regimen protocol (not patient-specific)
       ↑
       instantiatesCanonical
       ↑
RequestGroup      ← patient-specific ordered regimen instance (CDS Hooks payload)
       ↓
MedicationRequest / ServiceRequest  ← component orders (available at order-sign)
```

| Resource | Profile | Purpose |
|---|---|---|
| `PlanDefinition` | `OncologyAntiCancerRegimenPlanDefinition` | Canonical, versioned regimen protocol; published by guideline authority or institution |
| `RequestGroup` | `OncologyAntiCancerRegimenRequestGroup` | Patient-specific ordered instance; placed in CDS Hooks `draftOrders`; `instantiatesCanonical` references PlanDefinition |

### OncologyAntiCancerRegimenPlanDefinition

The canonical regimen definition carries:
- `type = order-set` — identifies this as an order set, not a clinical pathway
- `subject[x]` — the patient population (e.g., breast cancer)
- `action[+]` — one action per regimen component (drug or phase)
- Extensions: `regimenIntent` (adjuvant, neoadjuvant, metastatic, etc.),
  `regimenDiseaseContext`, `regimenTreatmentLine`, `regimenClinicalContextProfile`

### OncologyAntiCancerRegimenRequestGroup

The patient-specific ordered instance carries:
- `instantiatesCanonical` (Must Support) — canonical URL of the PlanDefinition being ordered
- `action[+]` — ordered components with cycle-day timing and phase sequencing

#### Cycle Day Timing

Each action declares which day(s) of the cycle the drug is administered using the
`timing-daysOfCycle` extension (`http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle`).
The `action.timingTiming` carries the machine-computable cycle period.

```json
{
  "id": "paclitaxel-action",
  "title": "Paclitaxel",
  "timingTiming": { "repeat": { "period": 7, "periodUnit": "d" } },
  "extension": [{
    "url": "http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle",
    "extension": [{ "url": "day", "valueInteger": 1 }]
  }],
  "resource": { "reference": "MedicationRequest/paclitaxel-order" }
}
```

#### Sequential Phase Ordering

For multi-phase regimens (e.g., AC→T: dose-dense doxorubicin/cyclophosphamide followed by
paclitaxel), top-level action groups represent phases. `action.relatedAction` with
`relationship = after-end` declares that the second phase begins after the first completes.

```json
{
  "id": "t-phase",
  "title": "T Phase — Paclitaxel",
  "relatedAction": [{
    "actionId": "ac-phase",
    "relationship": "after-end"
  }]
}
```

### Note on NCPDP Structured Sig

NCPDP Structured Sig encodes per-drug dispensing instructions and maps to
`MedicationRequest.dosageInstruction`. It is **compatible** with this model at the leaf level
(within each component `MedicationRequest` action) but is **not** a substitute for the
`RequestGroup` layer. NCPDP Structured Sig has no concept of cycle day, cross-drug phase
sequencing, or inter-drug ordering (`relatedAction`); those constructs live exclusively in the
`RequestGroup`. For oral oncology agents dispensed via retail pharmacy (e.g., capecitabine,
palbociclib), NCPDP SCRIPT remains the e-prescribing channel, but cycle context still belongs on
the `RequestGroup` action.

### Examples

See [Example: Paclitaxel + Trastuzumab (concurrent, weekly)](RequestGroup-THRegimenOrder.html)
and [Example: ddAC→T (sequential phases)](RequestGroup-DDACTRegimenOrder.html).
