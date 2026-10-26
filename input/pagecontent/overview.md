This Implementation Guide (IG) for the United States Core Data for Interoperability Plus (USCDI+) Sickle Cell Disease (SCD) data elements is the first FHIR product of the Office of the National Coordinator for Health Information Technology (ONC) USCDI+ SCD project, which supports interoperability for SCD patient care-related data exchanges. The project has also produced a landscape analysis and a data element list. Two related use cases are addressed by this guide; see [Scope and Usage](scope_and_usage.html).

### Information Model

The information model below represents the information to be included in exchanges supporting the two use cases addressed by this IG. 
Each box represents an information concept or class, and generally corresponds to an individual FHIR resource included in the IG. These resources contain multiple related data elements.
Each connecting line represents a relationship between the concepts. The text on the line describes the relationship represented and should be interpreted from the line start to the arrowhead (e.g.: A Problem/Condition is evidenced by a Lab Result). 
NOTE: There is no cardinality of the relationship represented in this model.  Actual manifestation within the FHIR resources (using resource references) may/may not follow the direction of the arrows.


<figure>
  <img src="uscdi-scd-info-model.jpg" alt="USCDI-SCD Information Model" style="max-width:100%"/>
  <figcaption><b>Figure 2: USCDI-SCD Information Model</b></figcaption>
</figure>

The [USCDI+ SCD Data Elements](uscdi-plus.html) page maps each data element in ONC's Version 1 USCDI+ SCD data element lists to the profile and element that represents it, and lists the data elements not yet covered.

---

### Profile Summary

The following profiles are defined or used in this IG:

| Profile | Base Resource | Parent Profile | Purpose |
|---|---|---|---|
| [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html) | Patient | US Core Patient | SCD patient demographics |
| [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html) | Practitioner | US Core Practitioner | SCD care team providers |
| [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html) | PractitionerRole | US Core PractitionerRole | Provider roles and affiliations |
| [USCDI-SCD Organization](StructureDefinition-uscdi-scd-organization.html) | Organization | US Core Organization | Care organizations |
| [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html) | Location | US Core Location | Care delivery locations |
| [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html) | Encounter | US Core Encounter | SCD-related encounters |
| [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html) | Condition | US Core Condition Encounter Diagnosis | Acute diagnoses (VOC, ACS) |
| [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html) | Condition | US Core Condition Problems and Health Concerns | Chronic SCD problem list |
| [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html) | AllergyIntolerance | US Core Allergy Intolerance | Drug/transfusion allergies |
| [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html) | CarePlan | US Core CarePlan | SCD disease management care plans |
| [USCDI-SCD ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html) | ServiceRequest | US Core ServiceRequest | Referrals and orders |
| [USCDI-SCD Medication](StructureDefinition-uscdi-scd-medication.html) | Medication | US Core Medication | SCD medications |
| [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html) | MedicationRequest | US Core MedicationRequest | SCD prescriptions (hydroxyurea, iron chelation) |
| [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html) | Procedure | US Core Procedure | Transfusions, HSCT, phlebotomy |
| [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html) | Observation | US Core Laboratory Result Observation | CBC, Hgb fractionation, ferritin |
| [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html) | Observation | US Core Vital Signs | SpO2, pain, BP, temp |
| [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) | BiologicallyDerivedProduct | FHIR 4.0.1 Base | Blood products used in SCD care |

---

### Conventions

The following conventions apply throughout this guide.

- **Naming.** Profiles are titled "USCDI-SCD [Resource]" (for example, USCDI-SCD Patient) and extensions are titled "SCD [Concept]" (for example, SCD Newborn Screen Reference). All artifacts defined by this guide have canonical URLs beginning with `http://hl7.org/fhir/us/uscdi-scd/`.
- **Profile basis.** Every profile extends a [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/) profile except USCDI-SCD BiologicallyDerivedProduct, which is based on the FHIR R4 resource. In every clinical profile, the reference to the patient is constrained to the USCDI-SCD Patient profile, and many other references (such as encounter, reason and performer) are constrained to the corresponding USCDI-SCD profiles. The administrative profiles and USCDI-SCD Medication do not constrain their references.
- **Must Support.** Elements marked with an **S** in a profile are Must Support. See [Must Support](conformance.html#must-support).
- **Conformance verbs.** SHALL, SHOULD and MAY have the meanings defined in [Conformance Verbs](conformance.html#conformance-verbs).
- **Terminology bindings.** This guide does not add terminology requirements beyond US Core. Its value sets are reference lists, and where it binds one, the binding strength is **example**. See [Terminology](terminology.html).
- **Code systems.** Diagnoses use SNOMED CT, and ICD-10-CM may be added. Procedures use SNOMED CT, and CPT may be added. Laboratory results and vital signs use LOINC. Medications use RxNorm.
- **Examples.** All examples follow a single fictional patient. See [Examples](examples.html).
- **Draft status.** This is a draft guide. Known limitations and unresolved questions are listed on the [Known Issues and Open Questions](issues.html) page.

