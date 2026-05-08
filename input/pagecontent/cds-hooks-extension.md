
### Overview

This IG defines an oncology-specific extension for CDS Hooks `order-select` and `order-sign`
hooks, used within Da Vinci CRD. The extension carries the ordered regimen identity and the
cancer-specific data requirements needed for coverage evaluation.

### Conformance Intent

Base CDS Hooks and Da Vinci CRD are not modified. This IG defines a CRD oncology **profile**:
conditional requirements for systems claiming conformance to this IG.

> For CDS Clients claiming conformance to this oncology CRD profile, when an anti-cancer therapy
> regimen is selected or signed, the client **SHALL** include the oncology CRD extension in the
> CDS Hooks request.

> For CDS Services claiming conformance to this oncology CRD profile, the service **SHALL** be
> capable of interpreting the oncology CRD extension and the referenced anti-cancer regimen
> `RequestGroup` and its instantiated `PlanDefinition`.

### Extension Shape

The extension key is `org.hl7.davinci-crd.oncology`. It has three components:

| Component | Required | Purpose |
|---|---|---|
| `orderedRegimen` | SHALL | Identifies the `RequestGroup` instance and its canonical `PlanDefinition` |
| `dataRequirements` | SHALL | Identifies the cancer-specific data requirements (canonical or inline) |
| `patientContextExpectation` | SHOULD | Declares how patient context will be supplied |

```json
"extension": {
  "org.hl7.davinci-crd.oncology": {
    "orderedRegimen": {
      "reference": "RequestGroup/breast-cancer-regimen-001",
      "regimenDefinition": "http://hl7.org/fhir/us/codex-ocpa/PlanDefinition/paclitaxel-trastuzumab-regimen",
      "profile": "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-anticancer-regimen-requestgroup"
    },
    "dataRequirements": {
      "purpose": "pre-approval",
      "canonical": "http://hl7.org/fhir/us/codex-ocpa/Library/breast-cancer-pa-data-requirements|1.0.0"
    },
    "patientContextExpectation": {
      "mode": "prefetch-or-fhir-access",
      "completeContextRequiredForPreApproval": true
    }
  }
}
```

### Inline Data Requirements Option

For pilots or simpler implementations, `dataRequirements` may include inline `DataRequirement`
entries rather than a canonical Library reference. See [Data Requirements Pattern](data-requirements.html).

### CDS Service Discovery

The CDS Hooks discovery endpoint (`GET /cds-services`) is the first point of contact between an
EHR and a conformant OGCA service. This IG defines two complementary layers for advertising data
requirements at discovery time, serving different levels of client capability.

#### Layer 1 — `prefetch` (standard EHR compatibility)

A conformant CDS Service **SHALL** include `prefetch` entries derived from each supported
`OncologyDataRequirementsLibrary`. This ensures that any CDS Hooks-compliant EHR can pre-fetch
the required patient context without OGCA-specific awareness.

Prefetch query templates are a flattened projection of the `Library.dataRequirement[]` entries —
each `DataRequirement` with a code filter maps to a FHIR search query keyed by a descriptive name:

```json
{
  "services": [{
    "id": "oncology-crd",
    "hook": "order-select",
    "title": "Oncology Coverage Requirements Discovery",
    "prefetch": {
      "primaryCancer":     "Condition?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-primary-cancer-disorder-vs",
      "cancerStage":       "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-observation-codes-vs",
      "biomarkers":        "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-tumor-marker-test-vs",
      "lineOfTherapy":     "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/codex-ocpa/ValueSet/treatment-line-vs",
      "performanceStatus": "Observation?patient={{context.patientId}}&code:in=http://hl7.org/fhir/us/mcode/ValueSet/mcode-ecog-performance-status-vs"
    }
  }]
}
```

#### Layer 2 — `extension` (OGCA-aware clients)

A conformant CDS Service **SHOULD** advertise the canonical URL(s) of supported
`OncologyDataRequirementsLibrary` instances via the `org.hl7.davinci-crd.oncology` extension on
the discovery service object. This enables OGCA-aware clients to retrieve the full structured
`DataRequirement[]` entries before the hook fires.

```json
{
  "services": [{
    "id": "oncology-crd",
    "hook": "order-select",
    "title": "Oncology Coverage Requirements Discovery",
    "prefetch": { "...": "..." },
    "extension": {
      "org.hl7.davinci-crd.oncology": {
        "dataRequirementsLibraries": [
          {
            "canonical": "http://hl7.org/fhir/us/codex-ocpa/Library/breast-cancer-pa-data-requirements|1.0.0",
            "cancerType": {
              "system": "http://snomed.info/sct",
              "code": "254837009",
              "display": "Breast cancer"
            }
          }
        ],
        "supportedRegimenProfiles": [
          "http://hl7.org/fhir/us/codex-ocpa/StructureDefinition/ocpa-anticancer-regimen-requestgroup"
        ]
      }
    }
  }]
}
```

An OGCA-aware CDS Client that resolves the advertised Library canonical MAY use the retrieved
`DataRequirement[]` entries to pre-stage the DTR `Questionnaire`, validate prefetch completeness,
or negotiate capability with the service before submitting the hook.

#### Relationship between discovery layers and the Library

The `OncologyDataRequirementsLibrary` is the single source of truth. The two discovery layers are
derivations of it:

```
OncologyDataRequirementsLibrary.dataRequirement[]
  ├── prefetch{}      ← flattened FHIR query projection (Layer 1, standard EHRs)
  └── extension{}     ← canonical pointer to the Library (Layer 2, OGCA-aware clients)
```

Changes to a Library version propagate to both layers — implementers SHOULD regenerate prefetch
templates when a new Library version is published.

#### Discovery conformance requirements

| Actor | Requirement |
|---|---|
| CDS Service | **SHALL** include `prefetch` entries derived from each supported `OncologyDataRequirementsLibrary` |
| CDS Service | **SHOULD** advertise Library canonical URL(s) via the `org.hl7.davinci-crd.oncology` discovery extension |
| CDS Client (standard) | **SHALL** submit prefetch-populated context when pre-fetched data is available |
| CDS Client (OGCA-aware) | **MAY** fetch the advertised Library to pre-stage DTR or validate prefetch completeness before submitting the hook |

### Possible CRD Outcomes

| Condition | CRD Response |
|---|---|
| Required context complete + criteria satisfied | No PA required, pre-approval, or silent success |
| Required context incomplete | Return DTR launch card |
| Required context complete but criteria not met | Return PA required or documentation required |
| Regimen cannot be evaluated | Return coverage/documentation guidance |

![OGCA CDS Hooks Sequence](ogca-cds-hooks.svg)

### Examples

See [Example: order-select request](Bundle-ExampleOrderSelectBundle.html) and
[Example: order-sign request](Bundle-ExampleOrderSignBundle.html).
