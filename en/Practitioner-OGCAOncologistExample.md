# Example Oncologist: Dr. Maria Lopez - Oncology Guideline and Coverage Authorization (OGCA) v0.1.0

## Example Practitioner: Example Oncologist: Dr. Maria Lopez

Profile: [US Core Practitioner Profile](http://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-practitioner.html)

**identifier**: [United States National Provider Identifier](http://terminology.hl7.org/7.1.0/NamingSystem-npi.html)/1234567893

**name**: Maria Lopez (Official)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "OGCAOncologistExample",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"]
  },
  "identifier" : [{
    "system" : "http://hl7.org/fhir/sid/us-npi",
    "value" : "1234567893"
  }],
  "name" : [{
    "use" : "official",
    "family" : "Lopez",
    "given" : ["Maria"],
    "prefix" : ["Dr."]
  }]
}

```
