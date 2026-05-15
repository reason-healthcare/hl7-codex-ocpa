
### Overview

This page traces the concrete API calls involved in two OGCA workflows for the same clinical
scenario, corresponding to the two-layer framework defined in [Use Cases and Actors](use-cases.html).

**Layer 1** (optional) is provider-driven pre-order CDS: a SMART app launched from the EHR
that reviews available patient data, collects missing elements, and presents
guideline-concordant regimen options before an order is placed.

**Layer 2** is the automated structured authorization exchange: the CDS Hooks pipeline that
fires during order entry and drives CRD → DTR → PAS as needed.

Both layers share the same `OncologyDataRequirementsLibrary` as their single source of truth.

### Clinical Scenario

**Patient:** Jane Smith (DOB 1968-04-15, MRN-78432)  
**Clinician:** Dr. Maria Lopez, medical oncologist  
**Diagnosis:** Invasive ductal carcinoma, right breast — HER2+, ER−, PR−, Stage IIB (T2 N1 M0), diagnosed November 2025  
**Order:** Adjuvant TH regimen (paclitaxel 80 mg/m² IV weekly + trastuzumab), 12-week course

---

### Layer 1 — Pre-Order Clinical Decision Support (Optional)

The SMART app is the primary CDS tool for the provider. It is launched directly from the
EHR when the provider clicks a CDS button in the patient chart. It has three responsibilities:

1. **Data review** — query the FHIR server for all data elements required by the applicable
   `OncologyDataRequirementsLibrary` and display what is present
2. **Data collection** — allow the provider to enter or confirm any missing elements inline
3. **Regimen options** — present guideline-concordant anticancer regimen options based on the
   complete clinical context

This flow is governed by the SMART App Launch (EHR launch) specification. No CDS Hooks
invocation occurs.

#### When This Applies

- Provider opens a patient chart and clicks the oncology CDS tool
- An oncology coordinator reviews PA readiness before the ordering encounter
- A clinician wants to explore guideline-based regimen options before selecting from the
  order-set

#### Step 1 — EHR Launch

The provider clicks the CDS button in the EHR. The EHR initiates a SMART EHR launch,
providing the app with the FHIR server base URL and a launch token encoding the current
patient context.

```
GET https://smart-app.example.org/launch?iss=https%3A%2F%2Fehr.example.org%2Ffhir&launch=<launch-token>
```

The app completes the SMART OAuth flow and obtains an access token scoped to the current
patient. The SMART App Launch specification governs this exchange and it is not reproduced
here.

#### Step 2 — Cancer Type Identification and Library Fetch

With a patient-scoped access token, the app queries the EHR FHIR server for the patient's
active primary cancer condition to determine which `OncologyDataRequirementsLibrary` applies.

##### App reads primary cancer condition

```
GET https://ehr.example.org/fhir/Condition?patient=OGCAPatientExample
    &code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-primary-cancer-disorder-vs
    &clinical-status=active
Accept: application/fhir+json
Authorization: Bearer <smart-access-token>
```

```
// Response: single active primary cancer — breast cancer (SNOMED 254837009)
{
  "resourceType": "Bundle", "type": "searchset", "total": 1,
  "entry": [{
    "resource": {
      "resourceType": "Condition",
      "code": { "coding": [{ "system": "http://snomed.info/sct", "code": "254837009", "display": "Malignant neoplasm of breast" }] },
      "clinicalStatus": { "coding": [{ "code": "active" }] }
    }
  }]
}
```

The app uses cancer type code `254837009` to fetch the breast cancer Library. It either has
the canonical pre-configured per cancer type, or queries the OGCA service by subject code:

```
// Option A — pre-configured canonical
GET https://cds.example.org/Library/BreastCancerPADataRequirements

// Option B — FHIR search by cancer type
GET https://cds.example.org/Library?subject:coding=http://snomed.info/sct|254837009
```

The Library response (see [Data Requirements Pattern](data-requirements.html)) provides the
`DataRequirement[]` entries the app will now query against.

#### Step 3 — Data Element Queries

For each `DataRequirement` in the Library, the app queries the EHR FHIR server. These run
in parallel where possible.

```
// Primary cancer condition (already retrieved in Step 2 — reused)

// TNM stage group
GET https://ehr.example.org/fhir/Observation
    ?patient=OGCAPatientExample
    &_profile=http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-stage-group
    &_sort=-date&_count=1
Authorization: Bearer <smart-access-token>

// Tumor markers (ER, PR, HER2)
GET https://ehr.example.org/fhir/Observation
    ?patient=OGCAPatientExample
    &code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-tumor-marker-test-vs
    &_sort=-date
Authorization: Bearer <smart-access-token>

// ECOG performance status
GET https://ehr.example.org/fhir/Observation
    ?patient=OGCAPatientExample
    &_profile=http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-ecog-performance-status
    &_sort=-date&_count=1
Authorization: Bearer <smart-access-token>

// Line of therapy
GET https://ehr.example.org/fhir/Observation
    ?patient=OGCAPatientExample
    &_profile=http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/line-of-therapy-observation
Authorization: Bearer <smart-access-token>

// Prior systemic therapy
GET https://ehr.example.org/fhir/MedicationRequest
    ?patient=OGCAPatientExample
    &_profile=http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-cancer-related-medication-request
    &status=completed,stopped
Authorization: Bearer <smart-access-token>
```

#### Step 4 — UX: Data Review, Missing Item Input, and Regimen Options

With query results in hand the app presents a three-phase interface. This is a UX
description, not an API call.

##### Phase 1 — Data Review

Each `DataRequirement` is shown with its current value or a missing indicator:

| Data Element | Value | Source |
|---|---|---|
| Primary cancer | Malignant neoplasm of breast | Condition (confirmed, active) |
| TNM stage | Stage IIB (T2 N1 M0) | Observation 2025-11-10 |
| ER status | Negative | Observation 2025-11-12 |
| PR status | Negative | Observation 2025-11-12 |
| HER2 status | **Missing** | No result found |
| ECOG performance status | PS 1 | Observation 2026-05-10 |
| Line of therapy | First-line | Observation |
| Prior systemic therapy | None on record | MedicationRequest |
{: .table }

##### Phase 2 — Missing Item Input

For each missing element the app renders an inline input. HER2 status is the only gap for
Jane Smith. Dr. Lopez selects the result directly in the app:

> **HER2 status** _(required for trastuzumab coverage)_  
> \[ IHC 0 \] \[ IHC 1+ \] \[ IHC 2+ \] **\[ IHC 3+ (Positive) \]** \[ ISH Amplified \] \[ ISH Not Amplified \]

> **EHR write-back limitation:** Not all EHRs grant SMART apps write access to clinical
> data. Whether the app can persist entered values as `Observation` resources on the EHR
> FHIR server depends on the scopes the EHR grants at launch. Two patterns are realistic:
>
> - **Write-back supported** — the EHR grants `patient/Observation.write` (or `patient/*.write`)
>   and the app persists the entered value directly. When order-select fires shortly after,
>   the prefetch re-execution finds the new Observation and the CDS Service can make a
>   complete determination without invoking DTR.
>
> - **Write-back not supported** — the EHR does not grant write scopes. The app holds the
>   entered value in session only. The gap remains in the FHIR server, so the CDS Service
>   will still return a DTR card at order-select time. The app’s value for the session
>   serves as a convenience pre-fill for the DTR questionnaire rather than a durable record.

Where write-back is supported, the app persists the entered value as an `Observation`
conforming to `mcode-tumor-marker-test`:

```
POST https://ehr.example.org/fhir/Observation
Content-Type: application/fhir+json
Authorization: Bearer <smart-access-token>

{
  "resourceType": "Observation",
  "meta": { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"] },
  "status": "final",
  "code": { "coding": [{ "system": "http://loinc.org", "code": "85319-2", "display": "HER2 [Presence] in Breast cancer specimen by Immune stain" }] },
  "subject": { "reference": "Patient/OGCAPatientExample" },
  "effectiveDateTime": "2026-05-15",
  "valueCodeableConcept": {
    "coding": [{ "system": "http://snomed.info/sct", "code": "10828004", "display": "Positive (qualifier value)" }]
  }
}
```

##### Phase 3 — Guideline-Based Regimen Options

With all data elements now present and confirmed, the app evaluates the clinical context
against its guideline knowledge base and presents applicable anticancer regimen options.
For Jane Smith (HER2+, ER−, PR−, Stage IIB, adjuvant intent, first-line, ECOG PS 1, no
prior HER2-directed therapy):

| Regimen | Guideline Authority | Setting | Notes |
|---|---|---|---|
| **TH** (paclitaxel + trastuzumab) | Guideline Authority | Adjuvant, HER2+ | Approvable for Stage I–II, HER2+, node-positive |
| **AC→TH** (ddAC → paclitaxel + trastuzumab) | Guideline Authority | Adjuvant, HER2+ | Higher-risk node-positive disease |
| **TCHP** (docetaxel + carboplatin + trastuzumab + pertuzumab) | Guideline Authority | Adjuvant, HER2+, node-positive | Consider when anthracycline contraindicated |
{: .table }

The provider selects the approvable regimen. That selection is carried forward into the
EHR order-set, which creates the `RequestGroup` and fires `order-select` — transitioning
into the CDS Hooks workflow described in Layer 2.

---

### Layer 2 — Structured Authorization Exchange (CDS Hooks)

This is the automated pipeline that fires during order entry. The EHR sends a standard
prefetch payload with every hook call. The CDS Service uses the patient's primary cancer
condition — returned in that prefetch — to select the applicable Library internally. No
cancer-type-specific configuration is required from the EHR.

#### API Call Sequence

```
Step 1  GET /cds-services                ← EHR registers service at startup (disease: UNKNOWN)
Step 2  POST /cds-services/oncology-crd  ← order-select fires
          ↳ 2a: CDS Service resolves Library from prefetch.primaryCancer
          ↳ 2b: CDS evaluates prefetch vs. DataRequirement[]
          ↳ 2c: Response A — pre-approved (prefetch complete)
          ↳ 2c: Response B — DTR required (HER2 status missing)
Step 3  DTR questionnaire launched (Response B path only)
Step 4  POST /cds-services/oncology-crd  ← order-sign fires (full MedicationRequests)
```

#### Step 1 — Discovery: Disease Is Unknown

The EHR contacts the OGCA CDS Service at startup or configuration time — **before any
patient is selected and before any regimen is being ordered.** The service returns a static
discovery document. At this point the EHR has no idea what cancer type the next patient will
have.

##### Request

```
GET https://cds.example.org/cds-services
Accept: application/json
```

##### Response

```jsonc
// HTTP/1.1 200 OK
// Content-Type: application/json

{
  "services": [
    {
      "id": "oncology-crd",
      "hook": "order-select",
      "title": "Oncology Coverage Requirements Discovery",
      "description": "Evaluates anti-cancer regimen orders against payer coverage criteria using mCODE patient context.",

      // Layer 1 — prefetch templates (superset across ALL supported cancer types).
      // The EHR executes these queries for every patient regardless of cancer type.
      // The service consumes only what the per-invocation Library requires.
      "prefetch": {
        "primaryCancer":     "Condition?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-primary-cancer-disorder-vs",
        "cancerStage":       "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-observation-codes-vs",
        "biomarkers":        "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-tumor-marker-test-vs",
        "lineOfTherapy":     "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/codex-ocpa/ValueSet/treatment-line-vs",
        "performanceStatus": "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-ecog-performance-status-vs",
        "priorTherapy":      "MedicationRequest?patient={{context.patientId}}&status=completed,stopped"
      },

      // Layer 2 — OGCA extension (OGCA-aware clients only).
      // Lists each supported cancer type Library. An OGCA-aware EHR MAY use this
      // to supply dataRequirements.canonical when disambiguating multiple active cancers.
      "extension": {
        "org.hl7.davinci-crd.oncology": {
          "dataRequirementsLibraries": [
            {
              "canonical": "http://hl7.org/fhir/us/codex-ocpa/Library/BreastCancerPADataRequirements|1.0.0",
              "cancerType": { "system": "http://snomed.info/sct", "code": "254837009", "display": "Malignant neoplasm of breast" }
            },
            {
              "canonical": "http://hl7.org/fhir/us/codex-ocpa/Library/LungCancerPADataRequirements|1.0.0",
              "cancerType": { "system": "http://snomed.info/sct", "code": "363358000", "display": "Malignant tumor of lung" }
            }
          ],
          "supportedRegimenProfiles": [
            "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/anticancer-regimen-requestgroup"
          ]
        }
      }
    },

    // The same service registers on order-sign using the same id, enabling updated
    // guidance after all MedicationRequests are finalised (CDS Hooks "update stale
    // guidance" pattern).
    {
      "id": "oncology-crd",
      "hook": "order-sign",
      "title": "Oncology Coverage Requirements Discovery",
      "description": "Final PA determination at order signing.",
      "prefetch": { "...": "..." },
      "extension": { "...": "..." }
    }
  ]
}
```

> **Key point:** The EHR stores this discovery document and is now configured. It does not
> need to determine which Library applies for any given patient — that is the CDS Service's
> responsibility, resolved at invocation time from the prefetch primary cancer condition.

---

#### Step 2 — order-select

Dr. Lopez selects the **TH regimen** from the oncology order-set. The EHR creates a draft
`RequestGroup` and fires `order-select`. The EHR executes the prefetch templates — including
`primaryCancer` — against the patient's FHIR server. The patient's confirmed breast cancer
condition is returned in that bundle. **This is the signal the CDS Service uses to identify
the applicable Library.** The EHR does not need to know which Library applies; it simply
sends the standard prefetch payload configured at discovery time.

##### Step 2b — order-select Hook Request

```
POST https://cds.example.org/cds-services/oncology-crd
Content-Type: application/json
```

```jsonc
{
  "hook":         "order-select",
  "hookInstance": "a8f3c2e1-7b4d-4e9a-bc21-3f8d6a901c77",
  "fhirServer":   "https://ehr.example.org/fhir",
  "fhirAuthorization": {
    "access_token": "<bearer-token>",
    "token_type":   "Bearer",
    "expires_in":   300,
    "scope":        "patient/Condition.read patient/Observation.read patient/MedicationRequest.read patient/RequestGroup.read",
    "subject":      "oncology-crd-service"
  },

  // ── Standard CDS Hooks context ────────────────────────────────────────────
  "context": {
    "userId":      "Practitioner/OGCAOncologistExample",
    "patientId":   "OGCAPatientExample",
    "encounterId": "encounter-20260515-001",

    // At order-select only the RequestGroup is in selections; MedicationRequests
    // are still being authored and are not yet finalised.
    "selections": ["RequestGroup/THRegimenOrder"],

    "draftOrders": {
      "resourceType": "Bundle",
      "type": "collection",
      "entry": [
        {
          "fullUrl": "https://ehr.example.org/fhir/RequestGroup/THRegimenOrder",
          "resource": {
            "resourceType":          "RequestGroup",
            "id":                    "THRegimenOrder",
            "status":                "draft",
            "intent":                "order",
            "subject":               { "reference": "Patient/OGCAPatientExample" },
            // instantiatesCanonical links back to the protocol definition.
            // The CDS Service MAY fetch the PlanDefinition for richer evaluation.
            "instantiatesCanonical": ["http://hl7.org/fhir/us/codex-ocpa/PlanDefinition/THRegimenDefinition"],
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-intent",
                "valueCodeableConcept": {
                  "coding": [{ "system": "http://snomed.info/sct", "code": "373846009", "display": "Adjuvant - intent" }]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-treatment-line",
                "valueCodeableConcept": {
                  "coding": [{ "system": "http://hl7.org/fhir/us/codex-ocpa/CodeSystem/treatment-line-cs", "code": "1L", "display": "First-line" }]
                }
              },
              {
                // regimenDiseaseContext: OPTIONAL. An OGCA-aware EHR MAY populate this
                // to make the disease context explicit on the RequestGroup. The CDS Service
                // does NOT require it — it reads the cancer type from prefetch.primaryCancer.
                "url": "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-regimen-disease-context",
                "valueCodeableConcept": {
                  "coding": [{ "system": "http://snomed.info/sct", "code": "254837009", "display": "Malignant neoplasm of breast" }]
                }
              }
            ],
            "action": [
              {
                "title":    "Paclitaxel 80 mg/m² IV — days 1, 8, 15 of 21-day cycle",
                "resource": { "reference": "MedicationRequest/PaclitaxelMedRequestTH" }
              },
              {
                "title":    "Trastuzumab IV — days 1, 8, 15 of 21-day cycle",
                "resource": { "reference": "MedicationRequest/TrastuzumabMedRequestTH" }
              }
            ]
          }
        }
      ]
    }
  },

  // ── Prefetch ──────────────────────────────────────────────────────────────
  // Templates are the same for every patient — the EHR does not need to know
  // in advance that this patient has breast cancer.
  "prefetch": {

    // Primary cancer condition: confirmed breast cancer — THIS is what the CDS
    // Service reads to resolve the applicable Library.
    "primaryCancer": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 1,
      "entry": [{
        "resource": {
          "resourceType":       "Condition",
          "id":                 "OGCABreastCancerConditionExample",
          "meta":               { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition"] },
          "clinicalStatus":     { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/condition-clinical", "code": "active" }] },
          "verificationStatus": { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status", "code": "confirmed" }] },
          "code":               { "coding": [{ "system": "http://snomed.info/sct", "code": "254837009", "display": "Malignant neoplasm of breast" }] },
          "subject":            { "reference": "Patient/OGCAPatientExample" },
          "onsetDateTime":      "2025-11-03"
        }
      }]
    },

    // Cancer staging: Stage IIB (T2 N1 M0)
    "cancerStage": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 1,
      "entry": [{
        "resource": {
          "resourceType": "Observation",
          "meta":         { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tnm-stage-group"] },
          "status":       "final",
          "code":         { "coding": [{ "system": "http://loinc.org", "code": "21908-9", "display": "Stage group.clinical Cancer" }] },
          "subject":      { "reference": "Patient/OGCAPatientExample" },
          "effectiveDateTime": "2025-11-10",
          "valueCodeableConcept": {
            "coding": [{ "system": "http://snomed.info/sct", "code": "1228882005", "display": "American Joint Commission on Cancer stage IIB (qualifier value)" }]
          }
        }
      }]
    },

    // Biomarkers: HER2 positive, ER negative, PR negative
    "biomarkers": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 3,
      "entry": [
        {
          "resource": {
            "resourceType": "Observation",
            "meta":   { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"] },
            "status": "final",
            "code":   { "coding": [{ "system": "http://loinc.org", "code": "85319-2", "display": "HER2 [Presence] in Breast cancer specimen by Immune stain" }] },
            "subject": { "reference": "Patient/OGCAPatientExample" },
            "effectiveDateTime": "2025-11-12",
            "valueCodeableConcept": {
              "coding": [{ "system": "http://snomed.info/sct", "code": "10828004", "display": "Positive (qualifier value)" }]
            }
          }
        },
        {
          "resource": {
            "resourceType": "Observation",
            "meta":   { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"] },
            "status": "final",
            "code":   { "coding": [{ "system": "http://loinc.org", "code": "85337-4", "display": "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain" }] },
            "subject": { "reference": "Patient/OGCAPatientExample" },
            "effectiveDateTime": "2025-11-12",
            "valueCodeableConcept": {
              "coding": [{ "system": "http://snomed.info/sct", "code": "260385009", "display": "Negative (qualifier value)" }]
            }
          }
        },
        {
          "resource": {
            "resourceType": "Observation",
            "meta":   { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-tumor-marker-test"] },
            "status": "final",
            "code":   { "coding": [{ "system": "http://loinc.org", "code": "85339-0", "display": "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain" }] },
            "subject": { "reference": "Patient/OGCAPatientExample" },
            "effectiveDateTime": "2025-11-12",
            "valueCodeableConcept": {
              "coding": [{ "system": "http://snomed.info/sct", "code": "260385009", "display": "Negative (qualifier value)" }]
            }
          }
        }
      ]
    },

    // Line of therapy: first-line
    "lineOfTherapy": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 1,
      "entry": [{
        "resource": {
          "resourceType": "Observation",
          "meta":   { "profile": ["http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/line-of-therapy-observation"] },
          "status": "final",
          "code":   { "coding": [{ "system": "http://hl7.org/fhir/us/codex-ocpa/CodeSystem/ocpa-codes", "code": "line-of-therapy", "display": "Line of Therapy" }] },
          "subject": { "reference": "Patient/OGCAPatientExample" },
          "valueCodeableConcept": {
            "coding": [{ "system": "http://hl7.org/fhir/us/codex-ocpa/CodeSystem/treatment-line-cs", "code": "1L", "display": "First-line" }]
          }
        }
      }]
    },

    // ECOG performance status: PS 1
    "performanceStatus": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 1,
      "entry": [{
        "resource": {
          "resourceType": "Observation",
          "meta":   { "profile": ["http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-ecog-performance-status"] },
          "status": "final",
          "code":   { "coding": [{ "system": "http://loinc.org", "code": "89247-1", "display": "ECOG Performance Status score" }] },
          "subject": { "reference": "Patient/OGCAPatientExample" },
          "effectiveDateTime": "2026-05-10",
          "valueInteger": 1
        }
      }]
    },

    // Prior therapy: none on record (first-line adjuvant)
    "priorTherapy": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 0
    }
  },

  // ── OGCA oncology extension ───────────────────────────────────────────────
  // orderedRegimen (REQUIRED) identifies the draft RequestGroup.
  // dataRequirements (OPTIONAL) — omitted here: Jane Smith has a single active
  // cancer condition so the service resolves the Library unambiguously from
  // prefetch.primaryCancer. Include dataRequirements.canonical only when the
  // patient has multiple active cancer conditions.
  "extension": {
    "org.hl7.davinci-crd.oncology": {
      "orderedRegimen": {
        "reference": "RequestGroup/THRegimenOrder",
        // regimenDefinition is OPTIONAL.
        "regimenDefinition": "http://hl7.org/fhir/us/codex-ocpa/PlanDefinition/THRegimenDefinition"
      }
    }
  }
}
```

##### Step 2c — CDS Service Evaluation Logic

On receipt of the hook call, the CDS Service executes the following evaluation:

```
1. Resolve Library (precedence order):
   a. extension.dataRequirements.canonical present? → use it directly
   b. absent → read prefetch.primaryCancer bundle:
        total=1, code=254837009 "Malignant neoplasm of breast"
        → single active cancer → match against internal Library registry
        → select BreastCancerPADataRequirements|1.0.0
   c. absent AND multiple active cancers in prefetch.primaryCancer?
        → return info card requesting dataRequirements.canonical disambiguation

2. For each DataRequirement[] in the resolved Library:
   → Check whether the corresponding prefetch key is populated and non-null
   → For Observation requirements: verify at least one result matches the
     required profile and code filter

3. Evaluate coverage criteria:
   → Diagnosis confirmed (mcode-primary-cancer-condition): ✓
   → Stage IIB (T2 N1 M0) present: ✓
   → HER2 positive by IHC: ✓  ← key criterion for trastuzumab authorization
   → ER−/PR− confirmed: ✓
   → ECOG PS 1: ✓
   → No prior HER2-directed therapy: ✓ (prior therapy bundle empty)
   → Line of therapy: first-line adjuvant: ✓

4. All DataRequirement[] entries satisfied → evaluate coverage rules
   → TH adjuvant for HER2+ Stage IIB breast cancer: covered per Guideline Authority
   → Pre-approval granted
```

##### Step 2c Response A — Pre-Approved (All Context Present)

All `DataRequirement[]` entries in the breast cancer Library are satisfied by the prefetch.
The CDS Service returns a success card directly — no DTR required.

```jsonc
// HTTP/1.1 200 OK
// Content-Type: application/json

{
  "cards": [
    {
      "uuid":      "card-e7f1a2b3-4c5d-6e7f-8a9b-0c1d2e3f4a5b",
      "summary":   "TH Regimen: Pre-Authorization Not Required",
      "indicator": "success",
      "detail":    "Adjuvant TH (paclitaxel + trastuzumab) for HER2-positive Stage IIB breast cancer meets coverage criteria. HER2 IHC positivity confirmed. No prior authorization required for this regimen in the adjuvant first-line setting.",
      "source": {
        "label": "OGCA Coverage Decision Support",
        "url":   "https://cds.example.org",
        "icon":  "https://cds.example.org/logo.png"
      }
    }
  ]
}
```

##### Step 2c Response B — DTR Required (HER2 Status Missing)

In this alternate scenario, the biomarkers prefetch bundle returned no HER2 observation —
the pathology report has not yet been filed. The `DataRequirement` for `mcode-tumor-marker-test`
(HER2 code filter) is unsatisfied. The service cannot confirm HER2 positivity and returns a
DTR launch card.

```jsonc
// HTTP/1.1 200 OK
// Content-Type: application/json

{
  "cards": [
    {
      "uuid":      "card-b3c4d5e6-7f8a-9b0c-1d2e-3f4a5b6c7d8e",
      "summary":   "Documentation Required: HER2 Status Needed for Trastuzumab Coverage",
      "indicator": "warning",
      "detail":    "HER2 receptor status is required to evaluate trastuzumab coverage. No HER2 result was found in the patient record. Please provide HER2 test results via the prior authorization documentation form.",
      "source": {
        "label": "OGCA Coverage Decision Support",
        "url":   "https://cds.example.org"
      },
      "links": [
        {
          "label": "Complete Prior Authorization Documentation (DTR)",
          "url":   "https://dtr.example.org/launch?iss=https%3A%2F%2Fehr.example.org%2Ffhir&launch=eyJwYXRpZW50IjoiT0dDQVBhdGllbnRFeGFtcGxlIiwibGlicmFyeSI6Imh0dHA6Ly9obDcub3JnL2ZoaXIvdXMvY29kZXgtb2NwYS9MaWJyYXJ5L0JyZWFzdENhbmNlclBBRGF0YVJlcXVpcmVtZW50c3wxLjAuMCJ9",
          "type":  "smart",
          "appContext": "{\"library\":\"http://hl7.org/fhir/us/codex-ocpa/Library/BreastCancerPADataRequirements|1.0.0\",\"regimen\":\"RequestGroup/THRegimenOrder\",\"missingRequirements\":[\"mcode-tumor-marker-test (HER2)\"]}"
        }
      ]
    }
  ]
}
```

> **Note on `appContext`:** Passed through to the DTR SMART app at launch. Carries the Library
> canonical, regimen reference, and unsatisfied `DataRequirement[]` entries so DTR can
> pre-populate the questionnaire and focus on only the genuinely missing data.

---

#### Step 3 — DTR Questionnaire (Response B Path Only)

Dr. Lopez clicks "Complete Prior Authorization Documentation." The DTR SMART app launches
within the EHR, resolves the Library from `appContext`, and pre-populates all answers
derivable from the patient record. The only unanswered item is HER2 status.

Dr. Lopez enters HER2 IHC 3+ (positive). The DTR app saves a `QuestionnaireResponse` to
the EHR's FHIR server and signals completion.

This DTR exchange is governed by the Da Vinci DTR specification and is not reproduced in
full here.

---

#### Step 4 — order-sign: Final Determination

Dr. Lopez reviews the order and clicks **Sign**. The EHR fires `order-sign`. The key
difference from `order-select`: all companion `MedicationRequest` resources are now
finalised and included in `context.draftOrders`. In the Response B path, the prefetch
re-execution now finds the HER2 observation saved by DTR.

##### Request (abbreviated — changes from order-select highlighted)

```
POST https://cds.example.org/cds-services/oncology-crd
Content-Type: application/json
```

```jsonc
{
  "hook":         "order-sign",
  "hookInstance": "f2e1d0c9-8b7a-6f5e-4d3c-2b1a0f9e8d7c",
  "fhirServer":   "https://ehr.example.org/fhir",
  "fhirAuthorization": { "...": "..." },

  "context": {
    "userId":    "Practitioner/OGCAOncologistExample",
    "patientId": "OGCAPatientExample",

    "draftOrders": {
      "resourceType": "Bundle",
      "type": "collection",
      "entry": [
        // RequestGroup — same as order-select
        { "resource": { "resourceType": "RequestGroup", "id": "THRegimenOrder", "...": "..." } },

        // MedicationRequests — now present and finalised
        {
          "resource": {
            "resourceType": "MedicationRequest",
            "id":           "PaclitaxelMedRequestTH",
            "status":       "draft",
            "intent":       "order",
            "subject":      { "reference": "Patient/OGCAPatientExample" },
            "medicationCodeableConcept": {
              "coding": [{ "system": "http://www.nlm.nih.gov/research/umls/rxnorm", "code": "56946", "display": "paclitaxel" }]
            },
            "dosageInstruction": [{ "text": "80 mg/m² IV over 1 hour, weekly (days 1, 8, 15 of 21-day cycle)" }]
          }
        },
        {
          "resource": {
            "resourceType": "MedicationRequest",
            "id":           "TrastuzumabMedRequestTH",
            "status":       "draft",
            "intent":       "order",
            "subject":      { "reference": "Patient/OGCAPatientExample" },
            "medicationCodeableConcept": {
              "coding": [{ "system": "http://www.nlm.nih.gov/research/umls/rxnorm", "code": "224905", "display": "trastuzumab" }]
            },
            "dosageInstruction": [{ "text": "4 mg/kg IV loading dose week 1, then 2 mg/kg IV weekly" }]
          }
        }
      ]
    }
  },

  "prefetch": {
    "primaryCancer":     { "...": "..." },
    "cancerStage":       { "...": "..." },
    "biomarkers": {
      "resourceType": "Bundle",
      "type": "searchset",
      "total": 3,
      "entry": [
        // HER2 IHC positive — now present (filed by DTR in Response B path)
        { "resource": { "resourceType": "Observation", "code": { "coding": [{ "system": "http://loinc.org", "code": "85319-2" }] }, "valueCodeableConcept": { "coding": [{ "system": "http://snomed.info/sct", "code": "10828004", "display": "Positive" }] } } },
        { "resource": { "...": "..." } },  // ER negative
        { "resource": { "...": "..." } }   // PR negative
      ]
    },
    "lineOfTherapy":     { "...": "..." },
    "performanceStatus": { "...": "..." },
    "priorTherapy":      { "...": "..." }
  },

  // Extension identical to order-select
  "extension": {
    "org.hl7.davinci-crd.oncology": {
      "orderedRegimen": {
        "reference":         "RequestGroup/THRegimenOrder",
        "regimenDefinition": "http://hl7.org/fhir/us/codex-ocpa/PlanDefinition/THRegimenDefinition"
      }
    }
  }
}
```

##### Response — Final Pre-Authorization Determination

```jsonc
// HTTP/1.1 200 OK
// Content-Type: application/json

{
  "cards": [
    {
      "uuid":      "card-9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d",
      "summary":   "TH Regimen: Pre-Authorization Approved",
      "indicator": "success",
      "detail":    "Adjuvant TH (paclitaxel + trastuzumab) for HER2-positive (IHC 3+) Stage IIB breast cancer is approved for coverage. Confirmed HER2 positivity, Stage IIB disease, ECOG PS 1, no prior HER2-directed therapy, first-line adjuvant intent.",
      "source": {
        "label": "OGCA Coverage Decision Support",
        "url":   "https://cds.example.org"
      }
    }
  ],
  "systemActions": [
    {
      "type":        "create",
      "description": "Record prior authorization approval",
      "resource": {
        "resourceType": "Coverage",
        "status":       "active",
        "subscriber":   { "reference": "Patient/OGCAPatientExample" },
        "payor":        [{ "display": "Example Health Plan" }]
      }
    }
  ]
}
```

---

#### What Changes for a Different Cancer Type

If Dr. Lopez had instead been ordering a lung cancer regimen (e.g., carboplatin + pemetrexed
for NSCLC), the only differences in the CDS Hooks flow would be:

| Field | Breast cancer | Lung cancer |
|---|---|---|
| `prefetch.primaryCancer` code | SNOMED 254837009 | SNOMED 363358000 |
| Library resolved by service | `BreastCancerPADataRequirements\|1.0.0` | `LungCancerPADataRequirements\|1.0.0` |
| Evaluated `DataRequirement[]` | ER/PR/HER2, TNM breast staging | EGFR/ALK/PD-L1, TNM lung staging |
| Prefetch templates executed | Same superset templates | Same superset templates |
| DTR questionnaire (if needed) | Breast cancer PA form | Lung cancer PA form |
| `dataRequirements.canonical` | Omitted (single cancer) | Omitted (single cancer) |
{: .table }

The prefetch templates, the hook registration, and the service endpoint are identical. The
service selects the correct Library internally from `prefetch.primaryCancer`. The EHR
requires no cancer-type-specific configuration.

---

#### See Also

- [CDS Hooks Oncology Extension](cds-hooks-extension.html) — extension shape, discovery layers, and conformance requirements  
- [Data Requirements Pattern](data-requirements.html) — Library structure and CRD/DTR reuse  
- [Use Case 1: Breast Cancer PA](breast-cancer-pa.html) — clinical data requirements for this scenario
