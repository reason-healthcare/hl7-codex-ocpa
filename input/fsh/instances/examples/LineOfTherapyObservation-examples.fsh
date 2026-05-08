// ============================================================
// LineOfTherapyObservation-examples.fsh
// 3 examples covering:
//   1 — First-line adjuvant (Jane Smith, early stage)
//   2 — Second-line metastatic (same patient, progressed)
//   3 — Maintenance (post-response, TreatmentLineCS#maintenance)
// ============================================================

// ─── 1: First-line, adjuvant ────────────────────────────────────────────────
// Jane Smith starting adjuvant TH therapy. All Must Support elements populated.
Instance: LineOfTherapyFirstLine
InstanceOf: LineOfTherapyObservation
Usage: #example
Title: "Example: Line of Therapy — First-Line Adjuvant (Jane Smith)"
Description: """First-line adjuvant systemic anti-cancer therapy for Jane Smith's
Stage IIB HER2+ breast cancer, beginning January 2026 with the TH regimen.
All Must Support elements populated. This is the primary reference example."""

* status = #final
* code   = $OcpaCS#line-of-therapy "Line of Therapy"
* subject = Reference(OGCAPatientExample)
* focus[+] = Reference(OGCABreastCancerConditionExample)
* effectivePeriod.start = "2026-01-15"
* valueCodeableConcept = $TreatmentLineCS#1L "First-line"


// ─── 2: Second-line, metastatic ─────────────────────────────────────────────
// Same patient, 14 months later. Progressed to metastatic disease after adjuvant.
// Now starting second-line systemic therapy.
Instance: LineOfTherapySecondLine
InstanceOf: LineOfTherapyObservation
Usage: #example
Title: "Example: Line of Therapy — Second-Line Metastatic (Jane Smith)"
Description: """Second-line systemic anti-cancer therapy for Jane Smith after disease
recurrence with metastatic spread (liver) in March 2027, 14 months after completing
adjuvant TH. Demonstrates second-line metastatic setting."""

* status = #final
* code   = $OcpaCS#line-of-therapy "Line of Therapy"
* subject = Reference(OGCAPatientExample)
* focus[+] = Reference(OGCAMetastaticBreastCancerConditionExample)
* effectivePeriod.start = "2027-03-22"
* valueCodeableConcept = $TreatmentLineCS#2L "Second-line"


// ─── 3: Maintenance ─────────────────────────────────────────────────────────
// After achieving response on PHD, patient transitions to maintenance trastuzumab.
// Demonstrates the maintenance treatment line code.
Instance: LineOfTherapyMaintenance
InstanceOf: LineOfTherapyObservation
Usage: #example
Title: "Example: Line of Therapy — Maintenance (Jane Smith, Post-PHD Response)"
Description: """Maintenance trastuzumab therapy for Jane Smith following response to
PHD induction in metastatic HER2+ setting. Demonstrates TreatmentLineCS#maintenance."""

* status = #final
* code   = $OcpaCS#line-of-therapy "Line of Therapy"
* subject = Reference(OGCAPatientExample)
* focus[+] = Reference(OGCAMetastaticBreastCancerConditionExample)
* effectivePeriod.start = "2027-10-01"
* valueCodeableConcept = $TreatmentLineCS#maintenance "Maintenance"
