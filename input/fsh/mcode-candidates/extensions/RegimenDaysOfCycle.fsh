// ============================================================
// RegimenDaysOfCycle.fsh
// Local extension for cycle-day timing in anti-cancer regimens.
//
// WHY A LOCAL COPY?
// The official hl7.org/fhir/StructureDefinition/timing-daysOfCycle
// restricts its context to top-level PlanDefinition.action and
// RequestGroup.action. Phased regimens (e.g., ddAC→T) require the
// extension on nested action.action elements, which the official
// context disallows. This local extension is semantically identical
// and differs only in its broader Timing context. It is intended for
// submission as a context expansion request against the official
// extension before mCODE STU5.
// ============================================================

Extension: RegimenDaysOfCycle
Id: regimen-days-of-cycle
Title: "Regimen Days of Cycle"
Description: """Specifies the days within a repeating treatment cycle on which a
regimen action is to be performed. Semantically identical to the HL7 core extension
[timing-daysOfCycle](http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle),
but with context broadened to `Timing` so it can be applied to nested
`RequestGroup.action.action` elements used in phased multi-agent regimens.

The cycle length is expressed via `Timing.repeat.period` / `Timing.repeat.periodUnit`
on the same element. Day numbering starts at 1 (day 1 = first day of cycle 1).

This extension is a migration candidate for inclusion in the HL7 FHIR Extensions
pack with an expanded context. See [regimen-model.html](regimen-model.html)."""

* ^context[0].type = #element
* ^context[0].expression = "Timing"
* ^context[1].type = #element
* ^context[1].expression = "PlanDefinition.action"
* ^purpose = """mCODE Migration Candidate — proposed as a context-expansion request against
http://hl7.org/fhir/StructureDefinition/timing-daysOfCycle in the HL7 FHIR Extensions pack.
This artifact is defined in the MOPA IG as a temporary home while that request is processed.
It is NOT intended to be a permanent artifact of this IG. Canonical URLs will change at
migration. See the mCODE Gap Proposals page in this IG for the full proposal backlog."""
* ^context[2].type = #element
* ^context[2].expression = "RequestGroup.action"

* value[x] 0..0

* extension contains day 1..*
* extension[day] ^short = "Day(s) of the cycle on which the action is performed"
* extension[day] ^definition = """An integer specifying a day within the cycle on which
this action is performed. 1 = first day of cycle 1. Multiple repetitions indicate
multiple administration days within the same cycle (e.g., 1, 8, 15 for weekly dosing
in a 21-day cycle)."""
* extension[day].value[x] only integer
* extension[day].value[x] 1..1
