### Overview

This Implementation Guide (IG) for the US Core Data for Interoperability Plus Sickle Cell Disease (USCDI+SCD) is the first FHIR product of the Assistant Secretary for Technology Policy/Office of the National Coordinator for Health IT (ASTP/ONC) USCDI+ Sickle Cell Disease (SCD) project, which supports interoperability for SCD patient care-related data exchanges. The project has also produced a landscape analysis and a data element list. Two related Use Cases are addressed by this guide.
### USCDI+ SCD Data Element Mapping

The Information Model below represents the information to be included in exchanges supporting the 2 Use Cases addressed by this IG. 
Each box represents an information concept or class, and generally corresponds to an individual FHIR resource included in the IG. These resources contain multiple related data elements.
Each connecting line represents a relationship between the concepts. The text on the line describes the relationship represented and should be interpreted from the line start to the arrowhead (e.g.: A Problem/Condition is evidenced by a Lab Result). 
NOTE: There is no cardinality of the relationship represented in this model.  Actual manifestation within the FHIR resources (using resource references) may/may not follow the direction of the arrows.


<figure>
  <img src="uscdi-scd-info-model.jpg" alt="USCDI-SCD Information Model" style="max-width:100%"/>
  <figcaption><b>Figure 1: USCDI-SCD Information Model</b></figcaption>
</figure>

<!-- TODO: Add a table mapping the USCDI+ Sickle Cell Disease data elements to the
     corresponding FHIR profiles and elements in this IG (requires the official
     USCDI+ SCD data element list). -->

---

### Profile Summary

The following profiles are defined or used in this IG:

| Profile | Base Resource | Parent Profile | Purpose |
|---|---|---|---|
| USCDI-SCD Patient | Patient | US Core Patient | SCD patient demographics |
| USCDI-SCD Practitioner | Practitioner | US Core Practitioner | SCD care team providers |
| USCDI-SCD PractitionerRole | PractitionerRole | US Core PractitionerRole | Provider roles and affiliations |
| USCDI-SCD Organization | Organization | US Core Organization | Care organizations |
| USCDI-SCD Location | Location | US Core Location | Care delivery locations |
| USCDI-SCD Encounter | Encounter | US Core Encounter | SCD-related encounters |
| USCDI-SCD Condition Encounter Diagnosis | Condition | US Core Condition Encounter Diagnosis | Acute diagnoses (VOC, ACS) |
| USCDI-SCD Condition Problems and Health Concerns | Condition | US Core Condition Problems and Health Concerns | Chronic SCD problem list |
| USCDI-SCD AllergyIntolerance | AllergyIntolerance | US Core Allergy Intolerance | Drug/transfusion allergies |
| USCDI-SCD CarePlan | CarePlan | US Core CarePlan | SCD disease management care plans |
| USCDI-SCD ServiceRequest | ServiceRequest | US Core ServiceRequest | Referrals and orders |
| USCDI-SCD Medication | Medication | US Core Medication | SCD medications |
| USCDI-SCD MedicationRequest | MedicationRequest | US Core MedicationRequest | SCD prescriptions (hydroxyurea, iron chelation) |
| USCDI-SCD Procedure | Procedure | US Core Procedure | Transfusions, HSCT, phlebotomy |
| USCDI-SCD Laboratory Result | Observation | US Core Laboratory Result Observation | CBC, Hgb fractionation, ferritin |
| USCDI-SCD Vital Signs | Observation | US Core Vital Signs | SpO2, pain, BP, temp |
| USCDI-SCD BiologicallyDerivedProduct | BiologicallyDerivedProduct | FHIR 4.0.1 Base | Blood products used in SCD care |

---

### Conventions

The following conventions apply throughout this guide.

- **Naming.** Profiles are titled "USCDI-SCD [Resource]" (for example, USCDI-SCD Patient) and extensions are titled "SCD [Concept]" (for example, SCD Genotype). All artifacts defined by this guide have canonical URLs beginning with `http://hl7.org/fhir/us/uscdi-scd/`.
- **Profile basis.** Every profile extends a [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/) profile except USCDI-SCD BiologicallyDerivedProduct, which is based on the FHIR R4 resource. Where a reference points to a resource that has a USCDI-SCD profile, it is constrained to that profile (for example, a diagnosis references a USCDI-SCD Patient).
- **Must Support.** Elements marked with an **S** in a profile are Must Support. See [Must Support](conformance.html#must-support).
- **Conformance verbs.** SHALL, SHOULD and MAY have the meanings defined in [Conformance Verbs](conformance.html#conformance-verbs).
- **Terminology bindings.** This guide does not add terminology requirements beyond US Core. Its value sets are reference lists, and where it binds one, the binding strength is **example**. See [Terminology](terminology.html).
- **Code systems.** Diagnoses use SNOMED CT, and ICD-10-CM may be added. Procedures use SNOMED CT, and CPT may be added. Laboratory results and vital signs use LOINC. Medications use RxNorm.
- **Examples.** All examples follow a single fictional patient. See [Examples](examples.html).
- **Draft status.** This is a draft guide. Open questions are recorded as TODO notes in the source.

