### Data Element Mapping

This page maps the data elements in this guide to their FHIR profiles and elements. It lists every Must Support element and every required element for each profile, with its cardinality, data type and terminology binding. It is generated from the profile definitions, so it always matches them.

**Download:** [uscdi-scd-data-element-mapping.csv](uscdi-scd-data-element-mapping.csv) (opens in Excel)

<!-- TODO: Add the data element names from the USCDI+ SCD project's data element
     list to this chart (the "USCDI+ SCD Data Element" column in the CSV). -->

#### How to read this chart

| Column | Meaning |
|---|---|
| Element | The FHIR element path. A name after a colon (for example, `extension:scd-genotype`) is a named slice. |
| Card. | Cardinality: minimum..maximum occurrences. A minimum of 1 means the element is required. |
| MS | **Y** means the element is Must Support. See [Must Support](conformance.html#must-support). |
| Type | The data type. For references, the profiles the reference must conform to. |
| Binding | The value set the element's codes come from, and the binding strength. |
| Source | **USCDI-SCD** if this guide adds or changes the element; **Inherited** if it comes unchanged from the parent profile (usually US Core). |

Elements inherited from US Core are included so testers can see every requirement in one place. Child elements are listed only when their parent is listed.

---

#### [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html)

**Parent:** US Core Patient Profile &nbsp;·&nbsp; **Use case:** Transfer of Care, Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-patient](Patient-maya-johnson-patient.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Patient.extension:race` | 0..1 | Y | Extension(US Core Race Extension) |  | USCDI-SCD | US Core Race Extension |
| `Patient.extension:ethnicity` | 0..1 | Y | Extension(US Core Ethnicity Extension) |  | USCDI-SCD | US Core ethnicity Extension |
| `Patient.extension:scd-newborn-screen-reference` | 0..1 |  | Extension(SCD Newborn Screen Reference) |  | USCDI-SCD | Newborn screening result that identified SCD |
| `Patient.identifier` | 1..* | Y | Identifier |  | Inherited | An identifier for this patient |
| `Patient.identifier.system` | 1..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Patient.identifier.value` | 1..1 | Y | string |  | Inherited | The value that is unique within the system. |
| `Patient.name` | 1..* | Y | HumanName |  | Inherited | A name associated with the patient |
| `Patient.name.family` | 0..1 | Y | string |  | Inherited | Family name (often called 'Surname') |
| `Patient.name.given` | 0..* | Y | string |  | Inherited | Given names (not always 'first'). Includes middle names |
| `Patient.telecom` | 0..* | Y | ContactPoint |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: A contact detail for the individual |
| `Patient.telecom.system` | 1..1 | Y | code | contact-point-system (required) | Inherited | phone \| fax \| email \| pager \| url \| sms \| other |
| `Patient.telecom.value` | 1..1 | Y | string |  | Inherited | The actual contact point details |
| `Patient.telecom.use` | 0..1 | Y | code | contact-point-use (required) | Inherited | home \| work \| temp \| old \| mobile - purpose of this contact point |
| `Patient.birthDate` | 0..1 | Y | date |  | Inherited | The date of birth for the individual |
| `Patient.address` | 0..* | Y | Address |  | Inherited | An address for the individual |
| `Patient.address.line` | 0..* | Y | string |  | Inherited | Street name, number, direction & P.O. Box etc. |
| `Patient.address.city` | 0..1 | Y | string |  | Inherited | Name of city, town etc. |
| `Patient.address.state` | 0..1 | Y | string | USPS-State (extensible) | Inherited | Sub-unit of country (abbreviations ok) |
| `Patient.address.postalCode` | 0..1 | Y | string |  | Inherited | US Zip Codes |
| `Patient.communication` | 0..* | Y | BackboneElement |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: A language which may be used to communicate with the patient about his or her health |

</div>

---

#### [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html)

**Parent:** US Core Practitioner Profile &nbsp;·&nbsp; **Use case:** Transfer of Care &nbsp;·&nbsp; **Examples:** [dr-sarah-chen-practitioner](Practitioner-dr-sarah-chen-practitioner.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Practitioner.identifier` | 1..* | Y | Identifier |  | Inherited | An identifier for the person as this agent |
| `Practitioner.identifier.system` | 1..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Practitioner.identifier.value` | 1..1 | Y | string |  | Inherited | The value that is unique |
| `Practitioner.identifier:NPI` | 0..* | Y | Identifier |  | Inherited | An identifier for the person as this agent |
| `Practitioner.identifier:NPI.system` | 1..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Practitioner.identifier:NPI.value` | 1..1 | Y | string |  | Inherited | The value that is unique |
| `Practitioner.name` | 1..* | Y | HumanName |  | Inherited | The name(s) associated with the practitioner |
| `Practitioner.name.family` | 1..1 | Y | string |  | Inherited | Family name (often called 'Surname') |
| `Practitioner.telecom` | 0..* | Y | ContactPoint |  | Inherited | A contact detail for the practitioner (that apply to all roles) |
| `Practitioner.telecom.system` | 0..1 | Y | code | contact-point-system (required) | Inherited | phone \| fax \| email \| pager \| url \| sms \| other |
| `Practitioner.telecom.value` | 0..1 | Y | string |  | Inherited | The actual contact point details |
| `Practitioner.address` | 0..* | Y | Address |  | Inherited | Address(es) of the practitioner |
| `Practitioner.address.line` | 0..4 | Y | string |  | Inherited | Street name, number, direction & P.O. Box etc. |
| `Practitioner.address.city` | 0..1 | Y | string |  | Inherited | Name of city, town etc. |
| `Practitioner.address.state` | 0..1 | Y | string | USPS-State (extensible) | Inherited | Sub-unit of country (abbreviations ok) |
| `Practitioner.address.postalCode` | 0..1 | Y | string |  | Inherited | US Zip Codes |
| `Practitioner.address.country` | 0..1 | Y | string |  | Inherited | Country (e.g. can be ISO 3166 2 or 3 letter code) |

</div>

---

#### [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html)

**Parent:** US Core PractitionerRole Profile &nbsp;·&nbsp; **Use case:** Transfer of Care &nbsp;·&nbsp; **Examples:** [dr-sarah-chen-hematology-role](PractitionerRole-dr-sarah-chen-hematology-role.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `PractitionerRole.practitioner` | 0..1 | Y | Reference(US Core Practitioner Profile) |  | Inherited | Practitioner that is able to provide the defined services for the organization |
| `PractitionerRole.organization` | 0..1 | Y | Reference(US Core Organization Profile) |  | Inherited | Organization where the roles are available |
| `PractitionerRole.code` | 0..* | Y | CodeableConcept | 2.16.840.1.113762.1.4.1099.30 (extensible) | Inherited | Roles which this practitioner may perform |
| `PractitionerRole.specialty` | 0..* | Y | CodeableConcept | 2.16.840.1.114222.4.11.1066 (extensible) | Inherited | Specific specialty of the practitioner |
| `PractitionerRole.location` | 0..* | Y | Reference(US Core Location Profile) |  | Inherited | The location(s) at which this practitioner provides care |
| `PractitionerRole.telecom` | 0..* | Y | ContactPoint |  | Inherited | Contact details that are specific to the role/location/service |
| `PractitionerRole.telecom.system` | 1..1 | Y | code | contact-point-system (required) | Inherited | phone \| fax \| email \| pager \| url \| sms \| other |
| `PractitionerRole.telecom.value` | 1..1 | Y | string |  | Inherited | The actual contact point details |
| `PractitionerRole.endpoint` | 0..* | Y | Reference(Endpoint) |  | Inherited | Technical endpoints providing access to services operated for the practitioner with this role |

</div>

---

#### [USCDI-SCD Organization](StructureDefinition-uscdi-scd-organization.html)

**Parent:** US Core Organization Profile &nbsp;·&nbsp; **Use case:** Transfer of Care &nbsp;·&nbsp; **Examples:** [metro-scd-center-org](Organization-metro-scd-center-org.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Organization.identifier` | 0..* | Y | Identifier |  | Inherited | Identifies this organization  across multiple systems |
| `Organization.identifier.system` | 0..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Organization.identifier.value` | 0..1 | Y | string |  | Inherited | The value that is unique |
| `Organization.identifier:NPI` | 0..* | Y | Identifier |  | Inherited | National Provider Identifier (NPI) |
| `Organization.identifier:NPI.system` | 0..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Organization.identifier:NPI.value` | 0..1 | Y | string |  | Inherited | The value that is unique |
| `Organization.identifier:CLIA.system` | 0..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Organization.identifier:CLIA.value` | 0..1 | Y | string |  | Inherited | The value that is unique |
| `Organization.identifier:NAIC.system` | 0..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Organization.identifier:NAIC.value` | 0..1 | Y | string |  | Inherited | The value that is unique |
| `Organization.active` | 1..1 | Y | boolean |  | Inherited | Whether the organization's record is still in active use |
| `Organization.name` | 1..1 | Y | string |  | Inherited | Name used for the organization |
| `Organization.telecom` | 0..* | Y | ContactPoint |  | Inherited | A contact detail for the organization |
| `Organization.telecom.system` | 0..1 | Y | code | contact-point-system (required) | Inherited | phone \| fax \| email \| pager \| url \| sms \| other |
| `Organization.telecom.value` | 0..1 | Y | string |  | Inherited | The actual contact point details |
| `Organization.address` | 0..* | Y | Address |  | Inherited | An address for the organization |
| `Organization.address.line` | 0..4 | Y | string |  | Inherited | Street name, number, direction & P.O. Box etc. |
| `Organization.address.city` | 0..1 | Y | string |  | Inherited | Name of city, town etc. |
| `Organization.address.state` | 0..1 | Y | string | USPS-State (extensible) | Inherited | Sub-unit of country (abbreviations ok) |
| `Organization.address.postalCode` | 0..1 | Y | string |  | Inherited | US Zip Codes |
| `Organization.address.country` | 0..1 | Y | string |  | Inherited | Country (e.g. can be ISO 3166 2 or 3 letter code) |

</div>

---

#### [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html)

**Parent:** US Core Location Profile &nbsp;·&nbsp; **Use case:** Supporting &nbsp;·&nbsp; **Examples:** [metro-scd-center-hematology-clinic](Location-metro-scd-center-hematology-clinic.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Location.identifier` | 0..* | Y | Identifier |  | Inherited | Unique business identifier for facility or location. |
| `Location.status` | 0..1 | Y | code | location-status (required) | Inherited | active \| suspended \| inactive |
| `Location.name` | 1..1 | Y | string |  | Inherited | Name by which a facility or location is known. |
| `Location.type` | 0..* | Y | CodeableConcept | v3-ServiceDeliveryLocationRoleType (extensible) | Inherited | Category of service or resource available in a location. |
| `Location.type.coding` | 1..* | Y | Coding |  | Inherited | Code defined by a terminology system |
| `Location.type.coding.system` | 1..1 | Y | uri |  | Inherited | Identity of the terminology system |
| `Location.type.coding.code` | 1..1 | Y | code |  | Inherited | Symbol in syntax defined by the system |
| `Location.telecom` | 0..* | Y | ContactPoint |  | Inherited | Contact details of the location |
| `Location.address` | 0..1 | Y | Address |  | Inherited | Physical location |
| `Location.address.line` | 0..* | Y | string |  | Inherited | Street name, number, direction & P.O. Box etc. |
| `Location.address.city` | 0..1 | Y | string |  | Inherited | Name of city, town etc. |
| `Location.address.state` | 0..1 | Y | string | USPS-State (extensible) | Inherited | Sub-unit of country (abbreviations ok) |
| `Location.address.postalCode` | 0..1 | Y | string |  | Inherited | US Zip Codes |
| `Location.managingOrganization` | 0..1 | Y | Reference(US Core Organization Profile) |  | Inherited | Organization responsible for provisioning and upkeep |

</div>

---

#### [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html)

**Parent:** US Core Encounter Profile &nbsp;·&nbsp; **Use case:** Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-ed-encounter](Encounter-maya-johnson-ed-encounter.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Encounter.meta.lastUpdated` | 0..1 | Y | instant |  | Inherited | When the resource last changed |
| `Encounter.identifier` | 0..* | Y | Identifier |  | Inherited | Identifier(s) by which this encounter is known |
| `Encounter.identifier.system` | 1..1 | Y | uri |  | Inherited | The namespace for the identifier value |
| `Encounter.identifier.value` | 1..1 | Y | string |  | Inherited | The value that is unique |
| `Encounter.status` | 1..1 | Y | code | encounter-status (required) | Inherited | planned \| arrived \| triaged \| in-progress \| onleave \| finished \| cancelled + |
| `Encounter.class` | 1..1 | Y | Coding | v3-ActEncounterCode (extensible) | Inherited | Classification of patient encounter |
| `Encounter.type` | 1..* | Y | CodeableConcept | 2.16.840.1.113762.1.4.1267.23 (extensible) | Inherited | Specific type of encounter |
| `Encounter.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | The patient or group present at the encounter |
| `Encounter.participant` | 0..* | Y | BackboneElement |  | Inherited | List of participants involved in the encounter |
| `Encounter.participant.type` | 0..* | Y | CodeableConcept | encounter-participant-type (extensible) | Inherited | Role of participant in encounter |
| `Encounter.participant.period` | 0..1 | Y | Period |  | Inherited | Period of time during the encounter that the participant participated |
| `Encounter.participant.individual` | 0..1 | Y | Reference(USCDI-SCD Practitioner \| USCDI-SCD PractitionerRole) |  | USCDI-SCD | Persons involved in the encounter other than the patient |
| `Encounter.period` | 0..1 | Y | Period |  | Inherited | The start and end time of the encounter |
| `Encounter.reasonCode` | 0..* | Y | CodeableConcept | encounter-reason (preferred) | Inherited | Coded reason the encounter takes place |
| `Encounter.reasonReference` | 0..* | Y | Reference(USCDI-SCD Condition Encounter Diagnosis \| USCDI-SCD Condition Problems and Health Concerns \| USCDI-SCD Procedure \| USCDI-SCD Laboratory Result) |  | USCDI-SCD | Reason the encounter takes place (reference) |
| `Encounter.diagnosis` | 0..* | Y | BackboneElement |  | USCDI-SCD | The list of diagnosis relevant to this encounter |
| `Encounter.diagnosis.condition` | 1..1 | Y | Reference(Condition \| Procedure) |  | USCDI-SCD | The diagnosis or procedure relevant to the encounter |
| `Encounter.diagnosis.use` | 0..1 | Y | CodeableConcept | diagnosis-role (preferred) | USCDI-SCD | Role that this diagnosis has within the encounter (e.g. admission, billing, discharge …) |
| `Encounter.hospitalization` | 0..1 | Y | BackboneElement |  | Inherited | Details about the admission to a healthcare service |
| `Encounter.hospitalization.dischargeDisposition` | 0..1 | Y | CodeableConcept | v3-USEncounterDischargeDisposition (preferred) | Inherited | Category or kind of location after discharge |
| `Encounter.location` | 0..* | Y | BackboneElement |  | Inherited | List of locations where the patient has been |
| `Encounter.location.location` | 1..1 | Y | Reference(USCDI-SCD Location) |  | USCDI-SCD | Location the encounter takes place |
| `Encounter.serviceProvider` | 0..1 | Y | Reference(USCDI-SCD Organization) |  | USCDI-SCD | The organization (facility) responsible for this encounter |

</div>

---

#### [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html)

**Parent:** US Core Condition Problems and Health Concerns Profile &nbsp;·&nbsp; **Use case:** Transfer of Care &nbsp;·&nbsp; **Examples:** [maya-johnson-scd-diagnosis](Condition-maya-johnson-scd-diagnosis.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Condition.meta.lastUpdated` | 0..1 | Y | instant |  | Inherited | When the resource last changed |
| `Condition.extension:assertedDate` | 0..1 | Y | Extension(assertedDate) |  | Inherited | Date the condition was first asserted |
| `Condition.extension:scd-genotype` | 0..1 | Y | Extension(SCD Genotype) |  | USCDI-SCD | Confirmed SCD genotype (HbSS, HbSC, HbS-beta thalassemia, etc.) |
| `Condition.extension:scd-voc-frequency` | 0..1 | Y | Extension(SCD Vaso-Occlusive Crisis Frequency) |  | USCDI-SCD | Frequency of vaso-occlusive crisis episodes |
| `Condition.extension:scd-newborn-screen-reference` | 0..1 |  | Extension(SCD Newborn Screen Reference) |  | USCDI-SCD | Newborn screening result that identified SCD |
| `Condition.clinicalStatus` | 0..1 | Y | CodeableConcept | condition-clinical (required) | Inherited | active \| recurrence \| relapse \| inactive \| remission \| resolved |
| `Condition.verificationStatus` | 0..1 | Y | CodeableConcept | condition-ver-status (required) | Inherited | unconfirmed \| provisional \| differential \| confirmed \| refuted \| entered-in-error |
| `Condition.category` | 1..* | Y | CodeableConcept | condition-category (extensible) | Inherited | category codes |
| `Condition.category:us-core` | 1..* | Y | CodeableConcept | us-core-problem-or-health-concern (required) | Inherited | problem-list-item \| health-concern |
| `Condition.code` | 1..1 | Y | CodeableConcept | SCD Diagnosis Value Set (extensible) | USCDI-SCD | SCD diagnosis, genotype, or chronic complication code |
| `Condition.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who has the condition? |
| `Condition.onset[x]` | 0..1 | Y | dateTime \| Age \| Period \| Range \| string |  | Inherited | Estimated or actual date,  date-time, or age |
| `Condition.abatement[x]` | 0..1 | Y | dateTime \| Age \| Period \| Range \| string |  | Inherited | When in resolution/remission |
| `Condition.recordedDate` | 0..1 | Y | dateTime |  | Inherited | Date record was first recorded |
| `Condition.recorder` | 0..1 | Y | Reference(US Core Practitioner Profile \| US Core Patient Profile \| PractitionerRole \| US Core RelatedPerson Profile) |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: Who recorded the condition |
| `Condition.asserter` | 0..1 | Y | Reference(Practitioner \| PractitionerRole \| Patient \| RelatedPerson) |  | USCDI-SCD | Person who asserts this condition |
| `Condition.evidence` | 0..* | Y | BackboneElement |  | USCDI-SCD | Supporting evidence |

</div>

---

#### [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html)

**Parent:** US Core Condition Encounter Diagnosis Profile &nbsp;·&nbsp; **Use case:** Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-voc-encounter-dx](Condition-maya-johnson-voc-encounter-dx.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Condition.clinicalStatus` | 0..1 | Y | CodeableConcept | condition-clinical (required) | USCDI-SCD | active \| recurrence \| relapse \| inactive \| remission \| resolved |
| `Condition.verificationStatus` | 0..1 | Y | CodeableConcept | condition-ver-status (required) | USCDI-SCD | unconfirmed \| provisional \| differential \| confirmed \| refuted \| entered-in-error |
| `Condition.category` | 1..* | Y | CodeableConcept | condition-category (extensible) | Inherited | category codes |
| `Condition.category:us-core` | 1..1 | Y | CodeableConcept | condition-category (extensible) | Inherited | encounter-diagnosis |
| `Condition.code` | 1..1 | Y | CodeableConcept | SCD Acute Complication Value Set (extensible) | USCDI-SCD | Acute SCD diagnosis code (SNOMED CT or ICD-10-CM) |
| `Condition.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who has the condition? |
| `Condition.encounter` | 0..1 | Y | Reference(USCDI-SCD Encounter) |  | USCDI-SCD | Encounter created as part of |
| `Condition.onset[x]` | 0..1 | Y | dateTime \| Age \| Period \| Range \| string |  | USCDI-SCD | Estimated or actual date,  date-time, or age |
| `Condition.abatement[x]` | 0..1 | Y | dateTime \| Age \| Period \| Range \| string |  | USCDI-SCD | When in resolution/remission |
| `Condition.recordedDate` | 0..1 | Y | dateTime |  | Inherited | Date record was first recorded |
| `Condition.evidence` | 0..* | Y | BackboneElement |  | USCDI-SCD | Supporting evidence |

</div>

---

#### [USCDI-SCD Medication](StructureDefinition-uscdi-scd-medication.html)

**Parent:** US Core Medication Profile &nbsp;·&nbsp; **Use case:** Supporting &nbsp;·&nbsp; **Examples:** [hydroxyurea-medication-example](Medication-hydroxyurea-medication-example.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Medication.code` | 1..1 | Y | CodeableConcept | SCD Medication Value Set (extensible) | USCDI-SCD | SCD medication code (RxNorm preferred) |

</div>

---

#### [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html)

**Parent:** US Core MedicationRequest Profile &nbsp;·&nbsp; **Use case:** Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-deferasirox-request](MedicationRequest-maya-johnson-deferasirox-request.html), [maya-johnson-hydroxyurea-request](MedicationRequest-maya-johnson-hydroxyurea-request.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `MedicationRequest.extension:scd-iron-chelation-indication` | 0..1 | Y | Extension(SCD Iron Chelation Indication) |  | USCDI-SCD | Indication and trigger for iron chelation therapy |
| `MedicationRequest.status` | 1..1 | Y | code | medicationrequest-status (required) | Inherited | active \| on-hold \| cancelled \| completed \| entered-in-error \| stopped \| draft \| unknown |
| `MedicationRequest.intent` | 1..1 | Y | code | medicationrequest-intent (required) | Inherited | proposal \| plan \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option |
| `MedicationRequest.category` | 0..* | Y | CodeableConcept | medicationrequest-category (example) | Inherited | Type of medication usage |
| `MedicationRequest.category:us-core` | 0..* | Y | CodeableConcept | medicationrequest-category (required) | Inherited | Type of medication usage |
| `MedicationRequest.reported[x]` | 0..1 | Y | boolean \| Reference(US Core Practitioner Profile \| US Core Organization Profile \| US Core Patient Profile \| US Core PractitionerRole Profile \| US Core RelatedPerson Profile) |  | Inherited | Reported rather than primary record |
| `MedicationRequest.medication[x]` | 1..1 | Y | CodeableConcept \| Reference(US Core Medication Profile) | 2.16.840.1.113762.1.4.1010.4 (extensible) | Inherited | SCD medication (RxNorm preferred) |
| `MedicationRequest.medication[x]:medicationReference` | 0..1 | Y | Reference(USCDI-SCD Medication) |  | USCDI-SCD | Medication to be taken |
| `MedicationRequest.medication[x]:medicationCodeableConcept` | 0..1 | Y | CodeableConcept | SCD Medication Value Set (extensible) | USCDI-SCD | Medication to be taken |
| `MedicationRequest.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who or group medication request is for |
| `MedicationRequest.encounter` | 0..1 | Y | Reference(USCDI-SCD Encounter) |  | USCDI-SCD | Encounter created as part of encounter/admission/stay |
| `MedicationRequest.authoredOn` | 0..1 | Y | dateTime |  | Inherited | When request was initially authored |
| `MedicationRequest.requester` | 0..1 | Y | Reference(US Core Practitioner Profile \| US Core Patient Profile \| US Core Organization Profile \| US Core PractitionerRole Profile \| US Core RelatedPerson Profile \| Device) |  | Inherited | Who/What requested the Request |
| `MedicationRequest.reasonCode` | 0..* | Y | CodeableConcept | us-core-condition-code (extensible) | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: Reason or indication for ordering or not ordering the medication |
| `MedicationRequest.reasonReference` | 0..* | Y | Reference(USCDI-SCD Condition Encounter Diagnosis \| USCDI-SCD Condition Problems and Health Concerns \| USCDI-SCD Laboratory Result) |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Condition or Observation that supports the prescription |
| `MedicationRequest.dosageInstruction` | 0..* | Y | Dosage |  | Inherited | How the medication should be taken |
| `MedicationRequest.dosageInstruction.timing` | 0..1 | Y | Timing |  | Inherited | When medication should be administered |
| `MedicationRequest.dosageInstruction.route` | 0..1 | Y | CodeableConcept | 2.16.840.1.113762.1.4.1267.22 (extensible) | Inherited | How drug should enter body |
| `MedicationRequest.dosageInstruction.doseAndRate` | 0..* | Y | Element |  | Inherited | Amount of medication administered |
| `MedicationRequest.dosageInstruction.doseAndRate.dose[x]` | 0..1 | Y | Quantity \| Range | ucum-common (preferred) | Inherited | Amount of medication per dose |
| `MedicationRequest.dispenseRequest` | 0..1 | Y | BackboneElement |  | Inherited | Medication supply authorization |
| `MedicationRequest.dispenseRequest.numberOfRepeatsAllowed` | 0..1 | Y | unsignedInt |  | Inherited | Number of refills authorized |
| `MedicationRequest.dispenseRequest.quantity` | 0..1 | Y | Quantity |  | Inherited | Amount of medication to supply per dispense |

</div>

---

#### [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html)

**Parent:** US Core AllergyIntolerance Profile &nbsp;·&nbsp; **Use case:** Supporting &nbsp;·&nbsp; **Examples:** [maya-johnson-nsaid-allergy](AllergyIntolerance-maya-johnson-nsaid-allergy.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `AllergyIntolerance.clinicalStatus` | 0..1 | Y | CodeableConcept | allergyintolerance-clinical (required) | Inherited | active \| inactive \| resolved |
| `AllergyIntolerance.verificationStatus` | 0..1 | Y | CodeableConcept | allergyintolerance-verification (required) | Inherited | unconfirmed \| confirmed \| refuted \| entered-in-error |
| `AllergyIntolerance.type` | 0..1 | Y | code | allergy-intolerance-type (required) | USCDI-SCD | allergy \| intolerance - Underlying mechanism (if known) |
| `AllergyIntolerance.category` | 0..* | Y | code | allergy-intolerance-category (required) | USCDI-SCD | food \| medication \| environment \| biologic |
| `AllergyIntolerance.criticality` | 0..1 | Y | code | allergy-intolerance-criticality (required) | USCDI-SCD | low \| high \| unable-to-assess |
| `AllergyIntolerance.code` | 1..1 | Y | CodeableConcept | 2.16.840.1.113762.1.4.1186.8 (extensible) | Inherited | Allergen or substance causing reaction (drug, blood product) |
| `AllergyIntolerance.patient` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who the sensitivity is for |
| `AllergyIntolerance.onset[x]` | 0..1 | Y | dateTime \| Age \| Period \| Range \| string |  | USCDI-SCD | When allergy or intolerance was identified |
| `AllergyIntolerance.reaction` | 0..* | Y | BackboneElement |  | Inherited | Adverse Reaction Events linked to exposure to substance |
| `AllergyIntolerance.reaction.substance` | 0..1 | Y | CodeableConcept | substance-code (example) | USCDI-SCD | Specific substance or pharmaceutical product considered to be responsible for event |
| `AllergyIntolerance.reaction.manifestation` | 1..* | Y | CodeableConcept | clinical-findings (extensible) | Inherited | Clinical symptoms/signs associated with the Event |
| `AllergyIntolerance.reaction.severity` | 0..1 | Y | code | reaction-event-severity (required) | USCDI-SCD | mild \| moderate \| severe (of event as a whole) |

</div>

---

#### [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html)

**Parent:** US Core CarePlan Profile &nbsp;·&nbsp; **Use case:** Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-chronic-transfusion-plan](CarePlan-maya-johnson-chronic-transfusion-plan.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `CarePlan.text.status` | 1..1 | Y | code | us-core-narrative-status (required) | Inherited | generated \| additional |
| `CarePlan.text.div` | 1..1 | Y | xhtml |  | Inherited | Limited xhtml content |
| `CarePlan.status` | 1..1 | Y | code | request-status (required) | Inherited | draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown |
| `CarePlan.intent` | 1..1 | Y | code | care-plan-intent (required) | Inherited | proposal \| plan \| order \| option |
| `CarePlan.category` | 1..* | Y | CodeableConcept | care-plan-category (example) | Inherited | Type of plan |
| `CarePlan.category:AssessPlan` | 0..1 | Y | CodeableConcept | care-plan-category (example) | Inherited | Type of plan |
| `CarePlan.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who the care plan is for |
| `CarePlan.period` | 0..1 | Y | Period |  | USCDI-SCD | Plan effective period |
| `CarePlan.author` | 0..1 | Y | Reference(USCDI-SCD Practitioner \| USCDI-SCD PractitionerRole \| USCDI-SCD Organization) |  | USCDI-SCD | Who is the designated responsible party |
| `CarePlan.careTeam` | 0..* | Y | Reference(CareTeam) |  | USCDI-SCD | Who's involved in plan? |
| `CarePlan.addresses` | 0..* | Y | Reference(USCDI-SCD Condition Problems and Health Concerns) |  | USCDI-SCD | Health issues this plan addresses |
| `CarePlan.goal` | 0..* | Y | Reference(Goal) |  | USCDI-SCD | Desired outcome of plan |
| `CarePlan.activity` | 0..* | Y | BackboneElement |  | USCDI-SCD | Action to occur as part of plan |
| `CarePlan.activity.reference` | 0..1 | Y | Reference(Appointment \| CommunicationRequest \| DeviceRequest \| MedicationRequest \| NutritionOrder \| Task \| ServiceRequest \| VisionPrescription \| RequestGroup) |  | USCDI-SCD | Activity details defined in specific resource |
| `CarePlan.activity.detail` | 0..1 | Y | BackboneElement |  | USCDI-SCD | In-line definition of activity |
| `CarePlan.activity.detail.status` | 1..1 | Y | code | care-plan-activity-status (required) | USCDI-SCD | not-started \| scheduled \| in-progress \| on-hold \| completed \| cancelled \| stopped \| unknown \| entered-in-error |
| `CarePlan.activity.detail.description` | 0..1 | Y | string |  | USCDI-SCD | Extra info describing activity to perform |

</div>

---

#### [USCDI-SCD ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html)

**Parent:** US Core ServiceRequest Profile &nbsp;·&nbsp; **Use case:** Supporting &nbsp;·&nbsp; **Examples:** [exchange-transfusion-order-example](ServiceRequest-exchange-transfusion-order-example.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `ServiceRequest.status` | 1..1 | Y | code | request-status (required) | Inherited | draft \| active \| on-hold \| revoked \| completed \| entered-in-error \| unknown |
| `ServiceRequest.intent` | 1..1 | Y | code | request-intent (required) | Inherited | proposal \| plan \| directive \| order \| original-order \| reflex-order \| filler-order \| instance-order \| option |
| `ServiceRequest.category` | 0..* | Y | CodeableConcept | servicerequest-category (example) | Inherited | Classification of service |
| `ServiceRequest.category:us-core` | 0..* | Y | CodeableConcept | us-core-servicerequest-category (required) | Inherited | Classification of service |
| `ServiceRequest.code` | 1..1 | Y | CodeableConcept | us-core-procedure-code (extensible) | Inherited | SCD referral, procedure, or order code (SNOMED CT, CPT, LOINC) |
| `ServiceRequest.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Individual or Entity the service is ordered for |
| `ServiceRequest.encounter` | 0..1 | Y | Reference(USCDI-SCD Encounter) |  | USCDI-SCD | Encounter in which the request was created |
| `ServiceRequest.occurrence[x]` | 0..1 | Y | Period \| dateTime \| Timing |  | Inherited | When service should occur |
| `ServiceRequest.authoredOn` | 0..1 | Y | dateTime |  | Inherited | Date request signed |
| `ServiceRequest.requester` | 0..1 | Y | Reference(USCDI-SCD Practitioner \| USCDI-SCD PractitionerRole) |  | USCDI-SCD | Who/what is requesting service |
| `ServiceRequest.performer` | 0..* | Y | Reference(USCDI-SCD Practitioner \| USCDI-SCD PractitionerRole \| USCDI-SCD Organization) |  | USCDI-SCD | Requested performer |
| `ServiceRequest.reasonCode` | 0..* | Y | CodeableConcept | us-core-condition-code (extensible) | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: Explanation/Justification for procedure or service |
| `ServiceRequest.reasonReference` | 0..* | Y | Reference(USCDI-SCD Condition Encounter Diagnosis \| USCDI-SCD Condition Problems and Health Concerns) |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Profile that supports the requested service |

</div>

---

#### [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html)

**Parent:** US Core Procedure Profile &nbsp;·&nbsp; **Use case:** Supporting &nbsp;·&nbsp; **Examples:** [maya-johnson-exchange-transfusion](Procedure-maya-johnson-exchange-transfusion.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Procedure.extension:scd-transfusion-antigen-match` | 0..1 |  | Extension(SCD Transfusion Red Cell Antigen Match Profile) |  | USCDI-SCD | Red cell antigen matching requested for the transfusion |
| `Procedure.status` | 1..1 | Y | code | event-status (required) | Inherited | preparation \| in-progress \| not-done \| on-hold \| stopped \| completed \| entered-in-error \| unknown |
| `Procedure.code` | 1..1 | Y | CodeableConcept | SCD Procedure Value Set (extensible) | USCDI-SCD | SCD procedure code (SNOMED CT or CPT) |
| `Procedure.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who the procedure was performed on |
| `Procedure.encounter` | 0..1 | Y | Reference(USCDI-SCD Encounter) |  | USCDI-SCD | Encounter associated with the procedure |
| `Procedure.performed[x]` | 0..1 | Y | dateTime \| Period \| string \| Age \| Range |  | Inherited | When the procedure was performed |
| `Procedure.performer` | 0..* | Y | BackboneElement |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: The people who performed the procedure |
| `Procedure.performer.actor` | 1..1 | Y | Reference(USCDI-SCD Practitioner \| USCDI-SCD PractitionerRole \| USCDI-SCD Organization) |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: The reference to the practitioner |
| `Procedure.reasonCode` | 0..* | Y | CodeableConcept | us-core-condition-code (extensible) | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: Coded reason procedure performed |
| `Procedure.reasonReference` | 0..* | Y | Reference(USCDI-SCD Condition Encounter Diagnosis \| USCDI-SCD Condition Problems and Health Concerns) |  | USCDI-SCD | 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜: US Core Profile justifying the reason procedure performed |
| `Procedure.usedReference` | 0..* | Y | Reference(USCDI-SCD Medication \| Device) |  | USCDI-SCD | Medications or devices used during the procedure |

</div>

---

#### [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html)

**Parent:** US Core Laboratory Result Observation Profile &nbsp;·&nbsp; **Use case:** Transfer of Care, Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-hgb-fractionation](Observation-maya-johnson-hgb-fractionation.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Observation.meta.lastUpdated` | 0..1 | Y | instant |  | Inherited | When the resource last changed |
| `Observation.status` | 1..1 | Y | code | observation-status (required) | Inherited | registered \| preliminary \| final \| amended + |
| `Observation.category` | 1..* | Y | CodeableConcept | observation-category (preferred) | Inherited | Classification of  type of observation |
| `Observation.category:us-core` | 1..1 | Y | CodeableConcept | us-core-clinical-result-observation-category (required) | Inherited | Classification of type of observation |
| `Observation.code` | 1..1 | Y | CodeableConcept | SCD Laboratory Panel Value Set (extensible) | USCDI-SCD | LOINC code for SCD laboratory test |
| `Observation.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who and/or what the observation is about |
| `Observation.encounter` | 0..1 | Y | Reference(US Core Encounter Profile) |  | Inherited | Encounter associated with Observation |
| `Observation.effective[x]` | 0..1 | Y | dateTime \| Period \| Timing \| instant |  | Inherited | Clinically relevant time/time-period for observation |
| `Observation.performer` | 0..* | Y | Reference(US Core Practitioner Profile \| US Core Organization Profile \| US Core Patient Profile \| PractitionerRole \| US Core CareTeam Profile \| US Core RelatedPerson Profile) |  | Inherited | Who is responsible for the observation |
| `Observation.value[x]` | 0..1 | Y | Quantity \| CodeableConcept \| string \| boolean \| integer \| Range \| Ratio \| SampledData \| time \| dateTime \| Period |  | Inherited | Result Value |
| `Observation.dataAbsentReason` | 0..1 | Y | CodeableConcept | data-absent-reason (extensible) | Inherited | Why the result is missing |
| `Observation.interpretation` | 0..* | Y | CodeableConcept | observation-interpretation (extensible) | Inherited | Result interpretation |
| `Observation.specimen` | 0..1 | Y | Reference(US Core Specimen Profile) |  | Inherited | Specimen used for this observation |
| `Observation.referenceRange` | 0..* | Y | BackboneElement |  | Inherited | Result reference range |
| `Observation.referenceRange.low` | 0..1 | Y | Quantity |  | USCDI-SCD | Low Range, if relevant |
| `Observation.referenceRange.high` | 0..1 | Y | Quantity |  | USCDI-SCD | High Range, if relevant |
| `Observation.component` | 0..* | Y | BackboneElement |  | USCDI-SCD | Individual result components (e.g., Hgb fractionation panel) |
| `Observation.component.code` | 1..1 | Y | CodeableConcept | observation-codes (example) | USCDI-SCD | Type of component observation (code / type) |
| `Observation.component.value[x]` | 0..1 | Y | Quantity \| CodeableConcept \| string \| boolean \| integer \| Range \| Ratio \| SampledData \| time \| dateTime \| Period |  | USCDI-SCD | Actual component result |

</div>

---

#### [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html)

**Parent:** US Core Vital Signs Profile &nbsp;·&nbsp; **Use case:** Emergency Department &nbsp;·&nbsp; **Examples:** [maya-johnson-pain-score](Observation-maya-johnson-pain-score.html), [maya-johnson-spo2](Observation-maya-johnson-spo2.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `Observation.status` | 1..1 | Y | code | observation-status (required) | Inherited | registered \| preliminary \| final \| amended + |
| `Observation.category` | 1..* | Y | CodeableConcept | observation-category (preferred) | Inherited | Classification of  type of observation |
| `Observation.category:VSCat` | 1..1 | Y | CodeableConcept | observation-category (preferred) | Inherited | Classification of  type of observation |
| `Observation.category:VSCat.coding` | 1..* | Y | Coding |  | Inherited | Code defined by a terminology system |
| `Observation.category:VSCat.coding.system` | 1..1 | Y | uri |  | Inherited | Identity of the terminology system |
| `Observation.category:VSCat.coding.code` | 1..1 | Y | code |  | Inherited | Symbol in syntax defined by the system |
| `Observation.code` | 1..1 | Y | CodeableConcept | SCD Vital Signs Value Set (extensible) | USCDI-SCD | Vital sign LOINC code (SpO2, pain score, BP, temp, RR, HR, weight) |
| `Observation.subject` | 1..1 | Y | Reference(USCDI-SCD Patient) |  | USCDI-SCD | Who and/or what the observation is about |
| `Observation.effective[x]` | 1..1 | Y | dateTime \| Period |  | Inherited | Often just a dateTime for Vital Signs |
| `Observation.performer` | 0..* | Y | Reference(US Core Practitioner Profile \| US Core Organization Profile \| US Core Patient Profile \| PractitionerRole \| US Core CareTeam Profile \| US Core RelatedPerson Profile) |  | Inherited | Who is responsible for the observation |
| `Observation.value[x]` | 0..1 | Y | Quantity \| CodeableConcept \| string \| boolean \| integer \| Range \| Ratio \| SampledData \| time \| dateTime \| Period | ucum-vitals-common (extensible) | Inherited | Vital Signs Value |
| `Observation.dataAbsentReason` | 0..1 | Y | CodeableConcept | data-absent-reason (extensible) | Inherited | Why the result is missing |
| `Observation.component` | 0..* | Y | BackboneElement |  | Inherited | Component observations |
| `Observation.component.code` | 1..1 | Y | CodeableConcept | 2.16.840.1.113883.3.88.12.80.62 (extensible) | Inherited | Coded vital sign result type |
| `Observation.component.value[x]` | 0..1 | Y | Quantity \| CodeableConcept \| string \| boolean \| integer \| Range \| Ratio \| SampledData \| time \| dateTime \| Period | ucum-vitals-common (extensible) | Inherited | Vital Sign Component Value |
| `Observation.component.dataAbsentReason` | 0..1 | Y | CodeableConcept | data-absent-reason (extensible) | Inherited | Why the component result is missing |

</div>

---

#### [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html)

**Parent:** BiologicallyDerivedProduct &nbsp;·&nbsp; **Use case:** Supporting &nbsp;·&nbsp; **Examples:** [prbcs-antigen-matched-example](BiologicallyDerivedProduct-prbcs-antigen-matched-example.html)

<div style="overflow-x:auto" markdown="1">

| Element | Card. | MS | Type | Binding | Source | Description |
|---|---|---|---|---|---|---|
| `BiologicallyDerivedProduct.extension:scd-transfusion-antigen-match` | 0..1 | Y | Extension(SCD Transfusion Red Cell Antigen Match Profile) |  | USCDI-SCD | Red cell antigens matched for this product |
| `BiologicallyDerivedProduct.extension:scd-blood-product-age` | 0..1 | Y | Extension(SCD Blood Product Age at Transfusion) |  | USCDI-SCD | Age of the product in days at transfusion |
| `BiologicallyDerivedProduct.productCategory` | 0..1 | Y | code | product-category (required) | USCDI-SCD | biologicalAgent \| cells \| fluid \| tissue \| organ |
| `BiologicallyDerivedProduct.productCode` | 0..1 | Y | CodeableConcept | SCD Blood Product Type Value Set (extensible) | USCDI-SCD | Blood product type code (ISBT 128 or SNOMED CT) |
| `BiologicallyDerivedProduct.status` | 0..1 | Y | code | product-status (required) | USCDI-SCD | available \| unavailable \| unsatisfactory \| entered-in-error |
| `BiologicallyDerivedProduct.request` | 0..* | Y | Reference(USCDI-SCD ServiceRequest) |  | USCDI-SCD | Reference to the transfusion order (SCDServiceRequest) |
| `BiologicallyDerivedProduct.collection` | 0..1 | Y | BackboneElement |  | USCDI-SCD | Collection details (donor vs autologous, collection time) |
| `BiologicallyDerivedProduct.collection.source` | 0..1 | Y | Reference(Patient \| Organization) |  | USCDI-SCD | Donor (allogeneic) or patient (autologous) |
| `BiologicallyDerivedProduct.collection.collected[x]` | 0..1 | Y | dateTime \| Period |  | USCDI-SCD | Time of product collection |
| `BiologicallyDerivedProduct.processing` | 0..* | Y | BackboneElement |  | USCDI-SCD | Product processing steps (irradiation, leukoreduction, CMV-neg) |
| `BiologicallyDerivedProduct.processing.description` | 0..1 | Y | string |  | USCDI-SCD | Description of of processing |
| `BiologicallyDerivedProduct.processing.procedure` | 0..1 | Y | CodeableConcept | SCD Blood Product Processing Value Set (extensible) | USCDI-SCD | Procesing code |
| `BiologicallyDerivedProduct.processing.time[x]` | 0..1 | Y | dateTime \| Period |  | USCDI-SCD | Time of processing |
| `BiologicallyDerivedProduct.storage` | 0..* | Y | BackboneElement |  | USCDI-SCD | Storage conditions and duration |
| `BiologicallyDerivedProduct.storage.duration` | 0..1 | Y | Period |  | USCDI-SCD | Storage timeperiod |

</div>

---

#### Extension Details

The parts of each SCD extension used in the profiles above.

<div style="overflow-x:auto" markdown="1">

| Extension | Part | Card. | Type | Binding | Description |
|---|---|---|---|---|---|
| [SCD Blood Product Age at Transfusion](StructureDefinition-scd-blood-product-age.html) | (value) | 0..* | Quantity |  | Extension |
| [SCD Genotype](StructureDefinition-scd-genotype.html) | (value) | 0..* | CodeableConcept | SCD Genotype Value Set (extensible) | Extension |
| [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) | indicationCode | 0..1 | CodeableConcept |  | Reason for initiating iron chelation |
| [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) | triggerMeasurement | 0..1 | CodeableConcept |  | Laboratory or imaging measure that triggered chelation |
| [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) | triggerValue | 0..1 | Quantity |  | The value at which chelation was initiated |
| [SCD Newborn Screen Reference](StructureDefinition-scd-newborn-screen-reference.html) | (value) | 0..* | Reference(Observation \| DiagnosticReport) |  | Extension |
| [SCD Transfusion Red Cell Antigen Match Profile](StructureDefinition-scd-transfusion-antigen-match.html) | matchedAntigen | 0..* | CodeableConcept | SCD Red Cell Antigen Value Set (extensible) | Specific antigen confirmed matched/negative |
| [SCD Transfusion Red Cell Antigen Match Profile](StructureDefinition-scd-transfusion-antigen-match.html) | matchingProtocol | 0..1 | string |  | Antigen matching protocol used |
| [SCD Vaso-Occlusive Crisis Frequency](StructureDefinition-scd-voc-frequency.html) | episodeCount | 1..1 | integer |  | Number of VOC episodes in the observation period |
| [SCD Vaso-Occlusive Crisis Frequency](StructureDefinition-scd-voc-frequency.html) | observationPeriod | 1..1 | Period |  | Period over which VOC episodes were counted |
| [SCD Vaso-Occlusive Crisis Frequency](StructureDefinition-scd-voc-frequency.html) | measurementMethod | 0..1 | CodeableConcept |  | How episodes were counted (self-report, chart review, hospitalization records) |

</div>
