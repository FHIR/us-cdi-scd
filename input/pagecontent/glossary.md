{%- comment -%}
================================================================================
GLOSSARY PAGE — glossary.md
================================================================================
{%- endcomment -%}

This page defines the technical, standards and clinical terms used in this guide. Terms are listed alphabetically within each section.

### FHIR and Standards Terms

| Term | Definition |
|---|---|
| **Actor** | A system that plays a defined role in an exchange. This guide defines two actors: the USCDI-SCD Server (responder) and the USCDI-SCD Client (requestor). See [Conformance Requirements](conformance.html#capabilitystatements). |
| **Binding (binding strength)** | The link between a coded element and a value set. FHIR defines four [binding strengths](http://hl7.org/fhir/R4/terminologies.html#strength): **required** (codes SHALL come from the value set), **extensible** (codes SHALL come from the value set if a suitable code exists), **preferred** (codes from the value set are encouraged) and **example** (the value set only illustrates the kinds of codes expected). |
| **Bundle** | A FHIR resource that groups other resources. This guide uses a *transaction* Bundle to load test data and *searchset* Bundles to show expected search results. |
| **Canonical URL** | The permanent, unique identifier of a conformance resource such as a profile, extension or value set. All artifacts in this guide have canonical URLs beginning with `http://hl7.org/fhir/us/uscdi-scd/`. |
| **CapabilityStatement** | A FHIR resource that states which resources, interactions and searches a system supports, or must support to conform to a guide. |
| **Cardinality** | How many times an element can appear, written as minimum..maximum. For example, `1..1` means exactly once (required) and `0..*` means optional and repeating. |
| **Code system** | A set of codes with defined meanings, such as SNOMED CT or LOINC. |
| **Connectathon** | An HL7 testing event where implementers test exchanges between their systems using a FHIR specification. |
| **Data Absent Reason** | A FHIR [extension](http://hl7.org/fhir/R4/extension-data-absent-reason.html) and code system used to say why a required value is missing. See [Missing Data](conformance.html#missing-data). |
| **Differential / Snapshot** | Two views of a profile. The differential shows only what the profile changes compared to its parent; the snapshot shows the complete definition. |
| **Extension** | An element added to a FHIR resource to carry information that the base resource does not define. See [Extensions](extensions.html). |
| **FHIR** | Fast Healthcare Interoperability Resources, the HL7 standard for exchanging health information. This guide uses FHIR R4 (4.0.1). |
| **FHIR Shorthand (FSH) / SUSHI** | FSH is a language for writing FHIR profiles and other artifacts. SUSHI compiles FSH into FHIR resources. This guide's source is written in FSH. |
| **ICD-10-CM** | International Classification of Diseases, Tenth Revision, Clinical Modification: the US classification of diagnoses, used for billing and reporting. |
| **Implementation Guide (IG)** | A set of rules and documentation describing how FHIR is used for a particular purpose. |
| **ISBT 128** | The international standard for the identification, labeling and coding of medical products of human origin, including blood products. |
| **LOINC** | Logical Observation Identifiers Names and Codes: the standard code system for laboratory tests and clinical observations. |
| **Must Support** | A flag on a profile element meaning conforming systems must be able to populate and process it. See [Must Support](conformance.html#must-support). |
| **OID** | Object identifier: a numeric identifier used by some terminology systems, such as VSAC and CDA documents, to identify code systems and value sets. |
| **Profile** | A set of constraints on a FHIR resource for a particular use, such as the USCDI-SCD Patient profile. See [Profiles](profiles.html). |
| **Resource** | The basic unit of exchange in FHIR, such as Patient, Condition or Observation. |
| **RxNorm** | The National Library of Medicine's standard code system for clinical drugs. |
| **Search parameter** | A named criterion a client can use to search for resources on a FHIR server, such as `patient` or `category`. |
| **SMART App Launch** | An HL7 specification for authorizing applications to access FHIR data using OAuth 2.0. See [SMART App Launch](http://hl7.org/fhir/smart-app-launch/). |
| **SNOMED CT** | A comprehensive clinical terminology used to code diagnoses, procedures, findings and substances. This guide uses the US Edition. |
| **UCUM** | The Unified Code for Units of Measure, used for units such as `mg/dL` or `d` (days). |
| **US Core** | The HL7 FHIR guide that sets the baseline requirements for exchanging USCDI data in the United States. This guide builds on [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/). |
| **USCDI / USCDI+** | The United States Core Data for Interoperability (USCDI) is the ONC-defined set of data elements for nationwide exchange. USCDI+ extends USCDI with data elements for specific domains and programs, such as Sickle Cell Disease. |
| **Value set** | A set of codes, drawn from one or more code systems, for use in a particular element. See [Terminology](terminology.html). |
| **VSAC** | The National Library of Medicine's [Value Set Authority Center](https://vsac.nlm.nih.gov/), which publishes and maintains value sets. |

### Clinical Terms

| Term | Definition |
|---|---|
| **Acute chest syndrome (ACS)** | A lung complication of SCD in which a new infiltrate appears on chest imaging, together with symptoms such as fever, chest pain or breathing difficulty. |
| **Alloimmunization** | The formation of antibodies against red cell antigens of donor blood, which can make future transfusions harder to match. |
| **Antigen matching (extended)** | Selecting donor red cells that match the patient for red cell antigens beyond ABO and RhD, such as C, E and K. |
| **Aplastic crisis** | A temporary stop in red blood cell production, most often caused by parvovirus B19 infection, leading to severe anemia. |
| **Exchange transfusion** | A transfusion in which the patient's red cells are removed and replaced with donor red cells. It can be done manually or with an automated machine (automated red cell exchange). |
| **Hematopoietic stem cell transplantation (HSCT)** | A transplant of blood-forming stem cells (hematopoietic progenitor cells) from bone marrow, peripheral blood or cord blood. |
| **Hemoglobin fractionation** | Laboratory testing, such as hemoglobin electrophoresis or high-performance liquid chromatography, that measures the proportions of hemoglobin types (for example, HbA, HbS, HbF, HbA2 and HbC). |
| **Hydroxyurea** | An oral disease-modifying medication for SCD that increases fetal hemoglobin (HbF). |
| **Iron chelation** | Medication therapy (such as deferasirox, deferoxamine or deferiprone) that removes excess iron from the body. |
| **Iron overload (transfusional hemosiderosis)** | The build-up of iron in organs such as the liver and heart as a result of repeated transfusions. |
| **Leukoreduction** | Removal of white blood cells from a blood product. |
| **Newborn screening** | State public health programs that test newborns for certain conditions, including SCD. |
| **Packed red blood cells (pRBCs)** | A blood product made of red blood cells with most of the plasma removed. |
| **Sickle cell disease (SCD)** | A group of inherited red blood cell disorders in which an abnormal hemoglobin (hemoglobin S) causes red blood cells to become rigid and sickle-shaped. |
| **SCD subtypes (HbSS, HbSC, HbS-β⁰-thalassemia, HbS-β⁺-thalassemia)** | The main forms of SCD. HbSS (sickle cell anemia): two copies of the sickle hemoglobin gene. HbSC: one sickle and one hemoglobin C gene. HbS-β-thalassemia: one sickle gene and one beta-thalassemia gene, with no beta-globin produced from that gene (β⁰) or reduced production (β⁺). In this guide the subtype is recorded in the diagnosis code. |
| **Sickle cell trait** | Carrying one sickle hemoglobin gene and one typical gene. Sickle cell trait is not a form of SCD. |
| **Splenic sequestration** | Sudden trapping of red blood cells in the spleen, causing the spleen to enlarge and hemoglobin to fall rapidly. |
| **Transcranial Doppler (TCD)** | An ultrasound test of blood flow speed in the brain's arteries, used to screen children with SCD for stroke risk. |
| **Vaso-occlusive crisis (VOC)** | An episode of acute pain caused by sickled red blood cells blocking blood flow. |
| **Warrior** | A term used by the SCD community for a person living with SCD. |

### Acronyms

| Acronym | Meaning |
|---|---|
| **ASH** | American Society of Hematology |
| **ASPE** | Office of the Assistant Secretary for Planning and Evaluation |
| **CDA** | Clinical Document Architecture (HL7) |
| **ED** | Emergency department |
| **EHR** | Electronic health record |
| **HHS** | U.S. Department of Health and Human Services |
| **HIE** | Health information exchange |
| **HL7** | Health Level Seven International |
| **NHLBI** | National Heart, Lung, and Blood Institute |
| **NLM** | National Library of Medicine |
| **ONC** | Office of the National Coordinator for Health Information Technology |
| **OS-PCORTF** | HHS Office of the Secretary Patient-Centered Outcomes Research Trust Fund |
| **SCD** | Sickle cell disease |
| **TEP** | Technical Expert Panel |
| **TLS** | Transport Layer Security |
