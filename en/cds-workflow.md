# CRD Workflow - MOPA — Medical Oncology Prior Authorization v0.1.0

## CRD Workflow

### Overview

This IG describes how the Da Vinci CRD workflow is used for oncology prior authorization. The payer CRD service uses standard CDS Hooks mechanisms — specifically FHIR API access provided via `fhirAuthorization` — to query the EHR's FHIR server directly for the oncology patient context it requires.

This approach keeps the EHR-side integration simple and standard: the EHR fires the standard `order-select` and `order-sign` hooks with the `RequestGroup` in `draftOrders`, and the CRD service does the work of fetching what it needs.

### How the CRD Service Obtains Patient Context

When a CDS Hooks request includes a `fhirAuthorization` object, the CRD service **MAY** use the provided access token to query the EHR's FHIR server directly for the oncology facts it requires to evaluate the ordered regimen.

The CRD service queries for the same clinical data elements that would otherwise be collected via DTR — the difference is that the payer queries them directly rather than asking the clinician to re-enter them. This is opaque to the standard CDS Hooks API: the EHR does not need to know which resources the payer will query.

Relevant data categories the CRD service typically queries:

| | | |
| :--- | :--- | :--- |
| Primary cancer condition | `Condition` | mCODE primary cancer ValueSet, active status |
| Cancer stage | `Observation` | mCODE staging codes |
| Biomarkers | `Observation` | mCODE tumor marker ValueSet |
| Line of therapy | `Observation` | MOPA treatment-line ValueSet |
| Performance status | `Observation` | mCODE ECOG/Karnofsky codes |
| Prior therapy | `MedicationRequest`/`Procedure` | Completed anti-cancer treatments |

### CDS Hooks Request Shape

The EHR fires a standard CRD hook with:

* `context.patientId` — identifies the patient
* `context.selections` and `context.draftOrders` — includes the `RequestGroup` conforming to `OncologyAntiCancerRegimenRequestGroup`
* `fhirAuthorization` — FHIR access credentials the CRD service uses to query back (when available)

```
{
  "hook": "order-select",
  "hookInstance": "...",
  "context": {
    "userId": "Practitioner/DrLopez",
    "patientId": "MOPAPatientExample",
    "selections": ["RequestGroup/THRegimenOrder"],
    "draftOrders": {
      "resourceType": "Bundle",
      "entry": [{ "resource": { "resourceType": "RequestGroup", "id": "THRegimenOrder", "..." } }]
    }
  },
  "fhirAuthorization": {
    "access_token": "...",
    "token_type": "Bearer",
    "expires_in": 300,
    "scope": "patient/Condition.read patient/Observation.read patient/MedicationRequest.read",
    "subject": "cds-service"
  },
  "fhirServer": "https://ehr.example.org/fhir"
}

```

### CRD Service Evaluation Flow

Upon receiving the hook, the CRD service:

1. Reads the`RequestGroup`from`context.draftOrders`to identify the ordered regimen
1. If`RequestGroup.instantiatesCanonical`is populated, optionally resolves the canonical`PlanDefinition`for richer protocol-level evaluation
1. Uses`fhirAuthorization`to query the EHR FHIR server for the required oncology facts
1. Evaluates the regimen against its coverage policy using the retrieved context
1. Returns the appropriate CRD response card(s)

### Possible CRD Outcomes

| | |
| :--- | :--- |
| Required context complete + criteria satisfied | **Authorization Satisfied**— PA conditions have been evaluated and PA can be bypassed |
| Required context retrievable but criteria not met | Return PA required or documentation required |
| Required context not yet available in EHR | Return DTR launch card to collect missing data |
| Regimen cannot be evaluated | Return coverage/documentation guidance |

### Conformance Requirements

| | |
| :--- | :--- |
| **Oncology CRD Client** | **SHALL**include the`RequestGroup`in`context.draftOrders`conforming to`OncologyAntiCancerRegimenRequestGroup` |
| **Oncology CRD Client** | **SHOULD**provide`fhirAuthorization`so the CRD service can query for patient context |
| **Oncology CRD Service** | **SHALL**be capable of evaluating the`RequestGroup`to identify the ordered regimen |
| **Oncology CRD Service** | **SHOULD**use`fhirAuthorization`to query the EHR for required oncology facts when provided |
| **Oncology CRD Service** | **SHALL**return a DTR launch card when required context is not available via FHIR query |

### Examples

For a complete end-to-end walkthrough see [Workflow Walkthrough](walkthrough.md).

For the `RequestGroup` payload, see [Example: TH Regimen Order](RequestGroup-THRegimenOrder.md).

