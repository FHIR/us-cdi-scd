### Conformance Requirements

This Implementation Guide builds on [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/). Systems claiming conformance to USCDI-SCD SHALL also conform to US Core 8.0.1. All US Core conformance requirements apply unless this guide explicitly overrides them.

Actors and systems claiming conformance to this guide SHALL implement the requirements in the corresponding [Capability Statements](#capability-statements).

### Conformance Verbs

This guide uses the following conformance verbs, consistent with [RFC 2119](https://tools.ietf.org/html/rfc2119) and US Core conventions:

| Verb | Meaning |
|---|---|
| **SHALL** | An absolute requirement. Not meeting it is a conformance failure. |
| **SHALL NOT** | An absolute prohibition. |
| **SHOULD** | Recommended. There may be valid reasons to deviate, but the full implications should be understood and carefully weighed first. |
| **SHOULD NOT** | Not recommended. There may be valid reasons to do so, but the full implications should be understood and carefully weighed first. |
| **MAY** | Optional. Permitted but not required. |

### Must Support

Elements flagged **Must Support** in the profiles of this guide follow the [US Core 8.0.1 Must Support](http://hl7.org/fhir/us/core/STU8.0.1/must-support.html) definition, with the following requirements:

- Systems SHALL be capable of populating Must Support data elements as specified by the profiles.
- Systems SHALL be capable of processing resource instances containing Must Support data elements without generating an error or causing the application to fail. Systems SHOULD be capable of displaying the data elements for human use or storing them for other purposes.
- When information for a Must Support data element is not present and the reason for its absence is unknown, systems SHALL NOT include the data element in the resource instance, unless the element is required (minimum cardinality of 1). See [Missing Data](#missing-data).
- When accessing USCDI-SCD data, systems SHALL interpret missing data elements within resource instances as data not present.

The USCDI-SCD BiologicallyDerivedProduct profile is based directly on the FHIR R4 BiologicallyDerivedProduct resource, because US Core has no equivalent profile. The same Must Support rules apply to it.

### Missing Data

This guide follows the [US Core 8.0.1 Missing Data](http://hl7.org/fhir/us/core/STU8.0.1/general-requirements.html#missing-data) guidance:

- If a Must Support element has a minimum cardinality of 0 and the data is not available, the element SHALL be omitted.
- If an element has a minimum cardinality of 1 and the data is not available:
  - For non-coded elements, systems SHALL use the [Data Absent Reason](http://hl7.org/fhir/R4/extension-data-absent-reason.html) extension.
  - For coded elements with a required binding, systems SHALL use the appropriate "unknown" concept from the bound value set, where one exists.
  - For coded elements with an extensible or preferred binding, systems SHALL use the `unknown` code from the [DataAbsentReason code system](http://terminology.hl7.org/CodeSystem/data-absent-reason) or provide text only.

### Capability Statements

This guide defines two Capability Statements:

| Capability Statement | Actor | Description |
|---|---|---|
| [USCDI-SCD Server](CapabilityStatement-uscdi-scd-server.html) | Responder / Server | Requirements for systems that expose SCD data, such as EHRs and health information exchanges |
| [USCDI-SCD Client](CapabilityStatement-uscdi-scd-client.html) | Requestor / Client | Requirements for systems that query for and use SCD data |

**USCDI-SCD Servers SHALL:**

1. Support all US Core 8.0.1 Server requirements.
2. Support read and search for the USCDI-SCD profiles listed below.
3. Support SMART on FHIR (standalone launch and EHR launch).
4. Use TLS 1.2 or higher for all connections.
5. Support FHIR AuditEvent for access logging.

**USCDI-SCD Clients SHALL:**

1. Support all US Core 8.0.1 Client requirements.
2. Be capable of requesting and processing the USCDI-SCD profiles marked SHALL below, and SHOULD support those marked SHOULD.
3. Process all Must Support elements in USCDI-SCD profiles without error.
4. Handle missing data as described in [Missing Data](#missing-data).
5. Display SCD-relevant clinical data in human-readable form.

### Profile Conformance Summary

The table below summarizes the expected level of support for each profile. These levels match the per-resource expectations in the Capability Statements. Clients SHALL support the profiles at the core of the SCD use cases (the patient, diagnoses, encounters, observations, procedures, allergies and prescriptions), and SHOULD support the supporting profiles.

| Profile | Server | Client |
|---|---|---|
| [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | SHALL | SHALL |
| [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html) | SHALL | SHOULD |
| [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html) | SHALL | SHOULD |
| [USCDI-SCD Organization](StructureDefinition-uscdi-scd-organization.html) | SHALL | SHOULD |
| [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html) | SHALL | SHOULD |
| [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | SHALL | SHALL |
| [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html) | SHALL | SHALL |
| [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html) | SHALL | SHALL |
| [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html) | SHALL | SHALL |
| [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html) | SHALL | SHOULD |
| [USCDI-SCD ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html) | SHALL | SHOULD |
| [USCDI-SCD Medication](StructureDefinition-uscdi-scd-medication.html) | SHALL | SHOULD |
| [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html) | SHALL | SHALL |
| [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html) | SHALL | SHALL |
| [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html) | SHALL | SHALL |
| [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | SHALL | SHALL |
| [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) | SHOULD | SHOULD |

BiologicallyDerivedProduct support is recommended for systems that manage blood product transfusion records for SCD patients. Systems that do not manage transfusion records MAY omit it.
