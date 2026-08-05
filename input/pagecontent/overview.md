{%- comment -%}
================================================================================
OVERVIEW PAGE — overview.md
================================================================================
CONTENT TO INSERT:
  - Architectural overview diagram (actors, systems, data flows)
  - Profile dependency / hierarchy diagram
  - Mapping of USCDI+ SCD data elements → FHIR profiles/elements
  - Summary narrative of how the profiles fit together
  - Conventions used in this IG (Must Support, cardinality, binding strength)
================================================================================
{%- endcomment -%}

### Overview



---
This Implementation Guide (IG) for the US Core Data for Interoperability Plus Sickle Cell Disease (USCDI+SCD) is the first product related to ASTP’s efforts to facilitate interoperability for Sickle Cell Disease (SCD) patient care-related data exchanges.  Two related Use Cases are addressed by this guide.
### USCDI+ SCD Data Element Mapping

The Information Model below represents the information to be included in exchanges supporting the 2 Use Cases addressed by this IG. 
Each box represents an information concept or class, and generally corresponds to an individual FHIR resource included in the IG. These resources contain multiple related data elements.
Each connecting line represents a relationship between the concepts. The text on the line describes the relationship represented and should be interpreted fron the line start to the arrowhead (e.g.: A Problem/Condition is evidenced by a Lab Result). 
NOTE: There is no cardinality of the relationship represented in this model.  Actual manifestation within the FHIR resources (using resource references) may/may not follow the direction of the arrows.

![UCSDI-SCD Info Model](UCSDI-SCD Info Model 20260330.jpg)
The table below maps known USCDI+ Sickle Cell Disease data elements to the
corresponding FHIR profiles and elements in this IG.

<!-- TODO: Complete the mapping table below based on the published USCDI+
     SCD data element list from HRSA/ONC. Add rows for each data element.

| USCDI+ SCD Data Element | FHIR Profile | FHIR Element |
|---|---|---|
| SCD Diagnosis | SCD Condition (Problems) | Condition.code (SNOMED/ICD-10) |
| SCD Genotype / Subtype | SCD Condition (Problems) | Condition.code |
| Hemoglobin Electrophoresis / Fractionation | SCD Laboratory Result | Observation.code + Observation.value |
| HbS % | SCD Laboratory Result | Observation.code (LOINC) + value |
| Hydroxyurea Use | SCD Medication | MedicationRequest.medication |
| Transfusion History | SCD Procedure + BiologicallyDerivedProduct | Procedure.code + product reference |
| Pain Score | SCD Vital Signs (Pain) | Observation.code (LOINC 38208-5) |
| Oxygen Saturation | US Core Vital Signs | Observation.code (LOINC 59408-5) |
| Acute Pain Episode (VOC) | SCD Encounter Diagnosis | Condition.code |
| Red Cell Antigen Phenotype | SCD Laboratory Result | Observation (panel) |
| Ferritin | SCD Laboratory Result | Observation.code (LOINC 2276-4) |

-->

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
| USCDI-SCD Procedure | Procedure | US Core Procedure | Transfusions, HSCT, phlebotomy |
| USCDI-SCD Laboratory Result | Observation | US Core Laboratory Result Observation | CBC, Hgb fractionation, ferritin |
| USCDI-SCD Vital Signs | Observation | US Core Vital Signs | SpO2, pain, BP, temp |
| USCDI-SCD BiologicallyDerivedProduct | BiologicallyDerivedProduct | FHIR 4.0.1 Base | Blood products used in SCD care |

---

### Conventions

<!-- TODO: Describe the conventions used throughout this IG:
       - How "Must Support" is defined (reference US Core definition)
       - Cardinality notation (0..1, 1..*, etc.)
       - Terminology binding strengths (required, extensible, preferred, example)
       - How invariants and constraints are expressed
       - Versioning conventions
       - How examples are provided
-->
