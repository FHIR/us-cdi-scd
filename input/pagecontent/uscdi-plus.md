{%- comment -%}
================================================================================
USCDI+ SCD DATA ELEMENTS PAGE — uscdi-plus.md
Generated from ONC's Version 1 USCDI+ SCD data element lists (retrieved
2026-10-26). Regenerate when ONC publishes a new version.
================================================================================
{%- endcomment -%}

This page maps each data element in ONC's Version 1 USCDI+ Sickle Cell Disease data element lists to where it is represented in this guide. It answers two questions: which profile and element carries each data element, and which data elements are not yet covered.

The lists are published by ONC for the [SCD Diagnosis](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=84d4c4a23bdd03503cb59d0864e45a2a&view=sp) use case (A, 37 data elements) and the [SCD Emergency Care](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=a7e444623bdd03503cb59d0864e45a96&view=sp) use case (B, 71 data elements). Together they contain 75 distinct data elements.

For the requirements on each profile element (cardinality, Must Support and bindings), see [Data Element Mapping](data-element-mapping.html).

### Coverage Summary

| Coverage | Meaning | Data elements |
|---|---|---|
| **USCDI-SCD profile** | Represented in a profile defined by this guide | 55 |
| **US Core (imported)** | Represented in a US Core 8.0.1 profile that servers must support through the imported [US Core Server CapabilityStatement](http://hl7.org/fhir/us/core/STU8.0.1/CapabilityStatement-us-core-server.html); this guide adds no SCD-specific profile | 15 |
| **Partial** | Partly represented; see the note | 3 |
| **Not covered** | Not represented in this guide | 2 |

US Core 8.0.1 implements USCDI v5. Data elements that are also USCDI data elements follow the [US Core USCDI mapping](http://hl7.org/fhir/us/core/STU8.0.1/uscdi.html).

### Gaps and Partial Coverage

- **Blood Transfusion Product Blood Type** (Biologically Derived Product; use case B): Not covered. FHIR R4 BiologicallyDerivedProduct has no element for the product's ABO/Rh type, and the guide defines no extension for it.
- **Variant Interpretation** (Genomics; use cases A and B): Not covered. No profile or guidance for genetic variant results.
- **Blood Genotype** (Genomics; use cases A and B): Partial. Serologic ABO and Rh typing results can be sent as laboratory results. The guide has no guidance for blood group genotyping.
- **Blood Transfusion Product Antibody** (Biologically Derived Product; use case B): Partial. The patient's antibody screen and identification can be sent as laboratory results. The blood product profile has no element for antibodies.
- **Blood Transfusion Product Antigen** (Biologically Derived Product; use case B): Partial. Records the antigens matched for the transfusion, not the product's full antigen profile.

These items are also listed on [Known Issues and Open Questions](issues.html).

### Mapping by Data Class

Use case: **A** = SCD Diagnosis, **B** = SCD Emergency Care.

#### Allergies and Intolerances

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Drug Class Allergy Intolerance | B | [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html) | `AllergyIntolerance.code` | USCDI-SCD profile |
| Medication Allergy Intolerance | B | [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html) | `AllergyIntolerance.code` | USCDI-SCD profile |
| Non-Medication Allergy Intolerance | B | [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html) | `AllergyIntolerance.code` | USCDI-SCD profile |
| Reaction | B | [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html) | `AllergyIntolerance.reaction.manifestation` | USCDI-SCD profile |

#### Biologically Derived Product

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Blood Transfusion Product Antibody | B | [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html) | `Observation.code` (antibody screen 890-4, antibodies identified 888-8) | Partial: The patient's antibody screen and identification can be sent as laboratory results. The blood product profile has no element for antibodies. |
| Blood Transfusion Product Antigen | B | [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) | `BiologicallyDerivedProduct.extension:scd-transfusion-antigen-match` | Partial: Records the antigens matched for the transfusion, not the product's full antigen profile. |
| Blood Transfusion Product Blood Type | B | — | — | Not covered: FHIR R4 BiologicallyDerivedProduct has no element for the product's ABO/Rh type, and the guide defines no extension for it. |
| Blood Transfusion Product Name | B | [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) | `BiologicallyDerivedProduct.productCode` | USCDI-SCD profile |

#### Care Plans

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Assessment and Plan of Treatment | A, B | [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html) | `CarePlan.text`, `CarePlan.category` | USCDI-SCD profile |
| Care Plan | B | [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html) | `CarePlan.addresses`, `CarePlan.goal`, `CarePlan.activity`, `CarePlan.careTeam` | USCDI-SCD profile |

#### Care Team Members

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Care Team Member Identifier | A, B | [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html) | `Practitioner.identifier` | USCDI-SCD profile |
| Care Team Member Location | A, B | [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html) | `PractitionerRole.location` | USCDI-SCD profile |
| Care Team Member Name | A, B | [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html) | `Practitioner.name` | USCDI-SCD profile |
| Care Team Member Role | A, B | [US Core CareTeam](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-careteam.html), [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html) | `CareTeam.participant.role`, `PractitionerRole.code` | US Core (imported): USCDI-SCD CarePlan references the care team (`CarePlan.careTeam`); there is no USCDI-SCD CareTeam profile. |
| Care Team Member Telecom | A, B | [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html), [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html) | `PractitionerRole.telecom`, `Practitioner.telecom` | USCDI-SCD profile |

#### Clinical Tests

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Clinical Test | B | [US Core Observation Clinical Result](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-clinical-result.html) | `Observation.code` | US Core (imported) |
| Clinical Test Result/Report | B | [US Core Observation Clinical Result](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-clinical-result.html), [US Core DiagnosticReport for Report and Note Exchange](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-diagnosticreport-note.html) | `Observation.value[x]`, `DiagnosticReport.presentedForm` | US Core (imported) |

#### Diagnostic Imaging

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Diagnostic Imaging Report | B | [US Core DiagnosticReport for Report and Note Exchange](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-diagnosticreport-note.html) | `DiagnosticReport.presentedForm` | US Core (imported) |
| Diagnostic Imaging Test | B | [US Core Observation Clinical Result](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-clinical-result.html), [US Core DiagnosticReport for Report and Note Exchange](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-diagnosticreport-note.html) | `Observation.code`, `DiagnosticReport.code` | US Core (imported) |

#### Encounter Information

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Encounter Diagnosis | B | [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html), [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html) | `Encounter.diagnosis.condition`, `Condition.code` | USCDI-SCD profile |
| Encounter Disposition | B | [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | `Encounter.hospitalization.dischargeDisposition` | USCDI-SCD profile |
| Encounter Identifier | B | [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | `Encounter.identifier` | USCDI-SCD profile |
| Encounter Location | B | [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | `Encounter.location.location` | USCDI-SCD profile |
| Encounter Time | B | [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | `Encounter.period` | USCDI-SCD profile |
| Encounter Type | B | [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | `Encounter.type` | USCDI-SCD profile |

#### Facility Information

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Facility Address | A, B | [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html) | `Location.address` | USCDI-SCD profile |
| Facility Identifier | A, B | [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html) | `Location.identifier` | USCDI-SCD profile |
| Facility Name | A, B | [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html) | `Location.name` | USCDI-SCD profile |
| Facility Type | A, B | [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html) | `Location.type` | USCDI-SCD profile |

#### Genomics

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Blood Genotype | A, B | [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html) | `Observation.code` (ABO group 883-9, Rh type 10331-7), `Observation.value[x]` | Partial: Serologic ABO and Rh typing results can be sent as laboratory results. The guide has no guidance for blood group genotyping. |
| Variant Interpretation | A, B | — | — | Not covered: No profile or guidance for genetic variant results. |

#### Goals and Preferences

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Patient Goals | B | [US Core Goal](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-goal.html) | `Goal.description` | US Core (imported): USCDI-SCD CarePlan references goals (`CarePlan.goal`); there is no USCDI-SCD Goal profile. |

#### Health Status Assessments

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Disability Status | B | [US Core Observation Screening Assessment](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-screening-assessment.html) | `Observation.code`, `Observation.value[x]` | US Core (imported) |
| Functional Status | B | [US Core Observation Screening Assessment](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-screening-assessment.html) | `Observation.code`, `Observation.value[x]` | US Core (imported) |
| Health Concerns | B | [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html) | `Condition.category` (`health-concern`), `Condition.code` | USCDI-SCD profile |
| Mental/Cognitive Status | B | [US Core Observation Screening Assessment](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-screening-assessment.html) | `Observation.code`, `Observation.value[x]` | US Core (imported) |
| Pain Assessment | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.code` (38208-5 or 72514-3), `Observation.value[x]` | USCDI-SCD profile |

#### Immunizations

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Immunizations | B | [US Core Immunization](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-immunization.html) | `Immunization.vaccineCode` | US Core (imported) |

#### Laboratory

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Tests | A, B | [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html) | `Observation.code` | USCDI-SCD profile |
| Values/Results | A, B | [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html) | `Observation.value[x]`, `Observation.component.value[x]` | USCDI-SCD profile |

#### Medications

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Dose | A, B | [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html) | `MedicationRequest.dosageInstruction.doseAndRate.dose[x]` | USCDI-SCD profile |
| Dose Unit of Measure | B | [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html) | `MedicationRequest.dosageInstruction.doseAndRate.doseQuantity.unit`, `.code` | USCDI-SCD profile |
| Medications | A, B | [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html), [USCDI-SCD Medication](StructureDefinition-uscdi-scd-medication.html) | `MedicationRequest.medication[x]`, `Medication.code` | USCDI-SCD profile |

#### Patient Demographics/Information

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Current Address | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.address` | USCDI-SCD profile |
| Date of Birth | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.birthDate` | USCDI-SCD profile |
| Date of Death | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.deceased[x]` | USCDI-SCD profile |
| Email Address | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.telecom` (system `email`) | USCDI-SCD profile |
| Ethnicity | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.extension:ethnicity` | USCDI-SCD profile |
| First Name | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.name.given` | USCDI-SCD profile |
| Last Name | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.name.family` | USCDI-SCD profile |
| Middle Name (Including middle initial) | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.name.given` | USCDI-SCD profile |
| Name Suffix | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.name.suffix` | USCDI-SCD profile |
| Phone Number | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.telecom` (system `phone`) | USCDI-SCD profile |
| Previous Name | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.name` (with `use` = `old` or `name.period.end`) | USCDI-SCD profile |
| Race | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.extension:race` | USCDI-SCD profile |
| Sex | A, B | [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | `Patient.extension:sex` | USCDI-SCD profile |

#### Problems

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Condition Evidence | A, B | [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html), [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html) | `Condition.evidence.code`, `Condition.evidence.detail` | USCDI-SCD profile |
| Date of Diagnosis | A, B | [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html), [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html) | `Condition.onset[x]`; `Condition.extension:assertedDate` (Problems and Health Concerns only) | USCDI-SCD profile |
| Date of Resolution | A, B | [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html), [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html) | `Condition.abatement[x]` | USCDI-SCD profile |
| Problems | A, B | [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html) | `Condition.code` (see the [SCD Diagnosis Value Set](ValueSet-scd-diagnosis-vs.html)) | USCDI-SCD profile |
| SDOH Problems/Health Concerns | B | [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html) | `Condition.category` (`sdoh`), `Condition.code` | USCDI-SCD profile |

#### Procedures

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Blood Transfusion Date & Time | B | [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html) | `Procedure.performed[x]` (transfusion procedure) | USCDI-SCD profile |
| Performance Time | B | [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html) | `Procedure.performed[x]` | USCDI-SCD profile |
| Procedures | B | [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html) | `Procedure.code` | USCDI-SCD profile |

#### Provenance

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| Author | A | [US Core Provenance](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-provenance.html) | `Provenance.agent.who` | US Core (imported) |
| Author Organization | A | [US Core Provenance](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-provenance.html) | `Provenance.agent.onBehalfOf` | US Core (imported) |
| Author Role | A | [US Core Provenance](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-provenance.html) | `Provenance.agent.type` | US Core (imported) |
| Author Time Stamp | A | [US Core Provenance](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-provenance.html) | `Provenance.recorded` | US Core (imported) |

#### Vital Signs

| Data element | Use case | Profile | Element(s) | Coverage |
|---|---|---|---|---|
| BMI Percentile (2 - 20 years) | B | [US Core Pediatric BMI for Age](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-pediatric-bmi-for-age.html) | `Observation.value[x]` | US Core (imported) |
| Body Height | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.code` (8302-2), `Observation.value[x]` | USCDI-SCD profile |
| Body Temperature | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.code` (8310-5), `Observation.value[x]` | USCDI-SCD profile |
| Body Weight | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.code` (29463-7), `Observation.value[x]` | USCDI-SCD profile |
| Diastolic Blood Pressure | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.component` (8462-4) | USCDI-SCD profile |
| Pulse Oximetry | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.code` (59408-5), `Observation.value[x]` | USCDI-SCD profile |
| Systolic Blood Pressure | B | [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | `Observation.component` (8480-6) | USCDI-SCD profile |

### Elements in This Guide Beyond the Version 1 Lists

The following parts of this guide do not correspond to a data element in the Version 1 lists. They are retained pending review by the project team.

| Artifact | Purpose |
|---|---|
| [SCD Vaso-Occlusive Crisis Frequency](StructureDefinition-scd-voc-frequency.html) | Number of VOC episodes over a period |
| [SCD Newborn Screen Reference](StructureDefinition-scd-newborn-screen-reference.html) | Link to the newborn screening result that identified SCD |
| [SCD Hydroxyurea Adherence](StructureDefinition-scd-hydroxyurea-adherence.html) | Hydroxyurea adherence assessment |
| [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) | Why iron chelation therapy was started |
| [SCD Blood Product Age at Transfusion](StructureDefinition-scd-blood-product-age.html) | Age of the blood product at transfusion |
| [USCDI-SCD ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html) | Referrals and orders; links transfusion procedures to blood products |
