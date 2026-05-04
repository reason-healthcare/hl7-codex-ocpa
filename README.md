# OCPA Implementation Guide

This repository is now set up as a **FHIR Implementation Guide (IG)** project using:

- **[FSH / SUSHI](https://fshschool.org/docs/sushi/)** for authoring
- **HL7 IG Publisher** for generating the implementation guide

The goal is to build the **Oncology Prior Authorization (OCPA) IG** as a formal FHIR implementation guide.

## Project Structure

- `sushi-config.yaml` — SUSHI project configuration
- `ig.ini` — IG Publisher entry point
- `input/fsh/` — FSH definitions
- `input/pagecontent/` — narrative IG pages
- `docs/` — existing project documentation moved out of the repo root
- `_genonce.sh` — build the IG locally
- `_updatePublisher.sh` — download/update the IG Publisher jar

## Existing Documentation

The prior analysis and design documents have been moved to [`./docs`](./docs):

- [`docs/initial-analysis.md`](./docs/initial-analysis.md)
- [`docs/iteration-2-exec-summary.md`](./docs/iteration-2-exec-summary.md)
- [`docs/iteration-2-mcode-gaps.md`](./docs/iteration-2-mcode-gaps.md)
- [`docs/iteration-2-oncology-pa-support-codex.md`](./docs/iteration-2-oncology-pa-support-codex.md)

## Getting Started

### Prerequisites

- Node.js
- Java

### Install dependencies

```bash
npm install
```

### Run SUSHI only

```bash
npm run sushi
```

### Build the IG with IG Publisher

```bash
npm run build
```

This will:
1. Run SUSHI to generate FHIR artifacts
2. Download IG Publisher if needed
3. Run IG Publisher using `ig.ini`

## Next Authoring Steps

1. Add OCPA profiles, extensions, value sets, and examples in `input/fsh/`
2. Add narrative guide content in `input/pagecontent/`
3. Refine package metadata in `sushi-config.yaml`
4. Add dependencies (for example Da Vinci and mCODE packages) when the formal content is ready
