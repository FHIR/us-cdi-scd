// ==============================================================================
// USCDI-SCD FSH Profiles — Encounter and Conditions
// File: input/fsh/profiles/SCD_EncounterCondition.fsh
//
// Profiles:
//   - SCDEncounter
//   - SCDConditionEncounterDiagnosis
//   - SCDConditionProblemsAndHealthConcerns
// ==============================================================================


// ==============================================================================
// SCDEncounter
// ==============================================================================
// Extends: US Core Encounter Profile
// Purpose: Represents encounters for SCD patients, including:
//   - Emergency department visits (vaso-occlusive crisis, ACS)
//   - Outpatient hematology visits
//   - Day hospital / infusion center visits (transfusion)
//   - Inpatient admissions (ACS, stroke, HSCT)
// ==============================================================================

Profile: SCDEncounter
Parent: us-core-encounter
Id: uscdi-scd-encounter
Title: "USCDI-SCD Encounter"
Description: """
  The USCDI-SCD Encounter profile represents a clinical encounter for a patient
  with Sickle Cell Disease. This profile extends the
  [US Core Encounter Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-encounter.html).

  SCD patients frequently present across multiple care settings. Common SCD
  encounter types include:
  - **Emergency visits** for vaso-occlusive crisis (VOC), acute chest syndrome
    (ACS), fever/infection, splenic sequestration, and priapism
  - **Outpatient hematology visits** for disease monitoring and medication
    management
  - **Day hospital / infusion center visits** for chronic transfusion therapy
    (simple and exchange transfusion)
  - **Inpatient admissions** for severe VOC, ACS, stroke, or hematopoietic
    stem cell transplantation (HSCT)

  The reason for encounter (reasonCode or reasonReference) SHOULD reference an
  USCDI-SCD Condition where applicable. The encounter SHOULD be linked to
  BiologicallyDerivedProduct resources when a blood product transfusion occurs.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Encounter
* identifier MS
* status MS
* class MS
* type MS
* subject MS
* subject only Reference(SCDPatient)
* participant MS
* participant.individual MS
* participant.individual only Reference(SCDPractitioner or SCDPractitionerRole)
* period MS
* reasonCode MS
* reasonReference MS
* reasonReference only Reference(SCDConditionEncounterDiagnosis or SCDConditionProblemsAndHealthConcerns or SCDProcedure or SCDObservationLaboratoryResult)
* diagnosis MS
* diagnosis.condition MS
* diagnosis.use MS
* hospitalization MS
* hospitalization.dischargeDisposition MS
* location MS
* location.location MS
* location.location only Reference(SCDLocation)
* serviceProvider MS
* serviceProvider only Reference(SCDOrganization)

// SCD-specific constraint: encounter type SHOULD use SCD-relevant codes
// TODO: Bind reasonCode to SCDEncounterReasonVS (value set to be defined)
// * reasonCode from SCDEncounterReasonVS (extensible)


// ==============================================================================
// SCDConditionEncounterDiagnosis
// ==============================================================================
// Extends: US Core Condition Encounter Diagnosis Profile
// Purpose: Represents acute diagnoses documented during an SCD-related
//          encounter (e.g., vaso-occlusive crisis, acute chest syndrome,
//          stroke, splenic sequestration, priapism, fever in SCD).
// ==============================================================================

Profile: SCDConditionEncounterDiagnosis
Parent: us-core-condition-encounter-diagnosis
Id: uscdi-scd-condition-encounter-diagnosis
Title: "USCDI-SCD Condition Encounter Diagnosis"
Description: """
  The USCDI-SCD Condition Encounter Diagnosis profile represents an acute
  diagnosis documented during an encounter for a patient with Sickle Cell Disease.
  This profile extends the
  [US Core Condition Encounter Diagnosis Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-condition-encounter-diagnosis.html).

  Common acute SCD encounter diagnoses represented by this profile include:
  - Vaso-occlusive crisis (VOC) / Acute Pain Episode
    (ICD-10-CM: D57.00, D57.01, D57.211–D57.219, D57.411–D57.419, D57.811–D57.819)
  - Acute Chest Syndrome (ACS)
    (ICD-10-CM: D57.01, D57.211, D57.411, D57.811)
  - Splenic sequestration
    (ICD-10-CM: D57.02, D57.212, D57.412, D57.812)
  - Stroke / Cerebrovascular accident in SCD
  - Priapism in SCD
  - Fever / Sepsis in SCD patient
  - Acute kidney injury in SCD
  - Acute hepatic sequestration

  Clinical systems SHALL populate `condition.code` using SNOMED CT or ICD-10-CM
  codes. Both code systems SHOULD be provided via `condition.code.coding`.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Condition Encounter Diagnosis
* clinicalStatus MS
* verificationStatus MS
* category MS
* code MS
* code ^short = "Acute SCD diagnosis code (SNOMED CT or ICD-10-CM)"
* code ^comment = """
  For SCD encounter diagnoses, code SHOULD use SNOMED CT or ICD-10-CM.
  Where both are available, both SHOULD be included as coding repetitions.
  TODO: Bind to SCDAcuteComplicationVS (value set to be defined).
"""
* subject MS
* subject only Reference(SCDPatient)
* encounter MS
* encounter only Reference(SCDEncounter)
* onset[x] MS
* abatement[x] MS
* recordedDate MS
* evidence MS
* evidence.id MS

// TODO: Add value set binding when SCDAcuteComplicationVS is defined:
// * code from SCDAcuteComplicationVS (extensible)


// ==============================================================================
// SCDConditionProblemsAndHealthConcerns
// ==============================================================================
// Extends: US Core Condition Problems and Health Concerns Profile
// Purpose: Represents the chronic SCD problem list, including:
//   - SCD diagnosis and genotype/subtype
//   - Chronic organ complications (avascular necrosis, CKD, retinopathy,
//     pulmonary hypertension, silent cerebral infarcts, iron overload)
//   - Psychosocial health concerns (depression, anxiety, chronic pain)
//   - Comorbidities managed alongside SCD
// ==============================================================================

Profile: SCDConditionProblemsAndHealthConcerns
Parent: us-core-condition-problems-health-concerns
Id: uscdi-scd-condition-problems
Title: "USCDI-SCD Condition Problems and Health Concerns"
Description: """
  The USCDI-SCD Condition Problems and Health Concerns profile represents
  active and resolved conditions on the problem list for a patient with Sickle
  Cell Disease. This profile extends the
  [US Core Condition Problems and Health Concerns Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-condition-problems-health-concerns.html).

  Key problem list entries for SCD patients represented by this profile:

  **SCD Diagnosis and Genotype:**
  - Sickle cell anemia (HbSS): SNOMED 127040003; ICD-10-CM D57.1
  - Sickle cell–hemoglobin C disease (HbSC): SNOMED 416180004; ICD-10-CM D57.2
  - Sickle cell–beta-0-thalassemia: SNOMED 417571000; ICD-10-CM D57.40
  - Sickle cell–beta-plus-thalassemia: SNOMED 417425009; ICD-10-CM D57.44
  - (Additional genotypes: see SCD Genotype value set)

  **Chronic Complications:**
  - Avascular necrosis of femoral head in SCD
  - Chronic kidney disease (CKD) in SCD
  - Proliferative retinopathy in SCD
  - Pulmonary arterial hypertension in SCD
  - Silent cerebral infarction in SCD
  - Chronic iron overload (due to transfusion)
  - Leg ulcers in SCD
  - Priapism (recurrent)

  **Psychosocial Health Concerns:**
  - Chronic pain syndrome
  - Depression complicating SCD
  - Anxiety disorder in SCD patient

  The primary SCD diagnosis (genotype) SHALL be included on the problem list
  for all patients within scope of this IG.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Condition Problems and Health Concerns
* clinicalStatus MS
* verificationStatus MS
* category MS
* code MS
* code ^short = "SCD diagnosis, genotype, or chronic complication code"
* code ^comment = """
  The code SHALL represent the patient's SCD diagnosis. For the primary SCD
  diagnosis, this SHOULD be the genotype-specific code (e.g., HbSS, HbSC).
  Use SNOMED CT or ICD-10-CM. Both SHOULD be included when available.
  TODO: Bind to SCDDiagnosisVS (value set to be defined) for the primary
  SCD diagnosis entry.
"""
* subject MS
* subject only Reference(SCDPatient)
* onset[x] MS
* abatement[x] MS
* recordedDate MS
* recorder MS
* asserter MS
* evidence MS
* evidence.id MS

// Extension slot for SCD genotype detail
// TODO: Add extension reference once SCDGenotypeExtension is defined:
// * extension[scd-genotype] MS

// TODO: Add value set binding when SCDDiagnosisVS and SCDChronicComplicationVS
// are defined. Primary SCD code should be required; complication codes extensible.
// * code from SCDDiagnosisAndComplicationVS (extensible)
