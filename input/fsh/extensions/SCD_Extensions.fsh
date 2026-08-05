// ==============================================================================
// USCDI-SCD FSH Extensions
// File: input/fsh/extensions/SCD_Extensions.fsh
//
// Extensions defined by the USCDI-SCD IG for SCD-specific data elements
// not covered by base FHIR R4 or US Core 8.0.1.
//
// Each extension includes:
//   - Clinical rationale
//   - Context of use (which resource/element it extends)
//   - Data type and value constraints
//
// DESIGN PRINCIPLE: Extensions are defined sparingly. Before creating a new
// extension, the IG authors SHALL verify that:
//   1. The concept cannot be represented using existing FHIR elements
//   2. No suitable extension exists in hl7.fhir.uv.extensions.r4
//   3. The US Core 8.0.1 package does not already provide the extension
// ==============================================================================


// ==============================================================================
// Extension: SCD Genotype
// ==============================================================================
// Context: Condition (SCDConditionProblemsAndHealthConcerns)
// Purpose: Captures the specific SCD genotype/subtype in structured form,
//          complementing the Condition.code with a formal genotype code.
//          While genotype is often captured via the Condition.code (ICD-10-CM
//          D57.x or SNOMED CT subtype codes), this extension provides an
//          explicit, searchable genotype field for clinical decision support
//          and population health queries.
// ==============================================================================

Extension: SCDGenotypeExtension
Id: scd-genotype
Title: "SCD Genotype"
Description: """
  Captures the confirmed Sickle Cell Disease genotype or subtype of the
  patient in a structured, coded format. This extension is intended for use
  on the Condition resource representing the patient's primary SCD diagnosis.

  The genotype SHALL be coded using a value from the SCDGenotypeVS value set,
  which includes SNOMED CT and ICD-10-CM codes for all major SCD subtypes
  (HbSS, HbSC, HbS-Beta0-thalassemia, HbS-Beta+-thalassemia, etc.).

  This extension supports:
  - Clinical decision support (e.g., hydroxyurea dosing guidance by genotype)
  - Population health stratification by SCD subtype
  - Research and quality measure calculations
  - Transfusion planning (HbSS vs HbSC affects target HbS%)

  Note: Confirmation of genotype requires hemoglobin fractionation (HPLC or
  electrophoresis) and/or molecular genetic testing. The verificationStatus
  of the parent Condition SHALL reflect the confirmation status.
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "Condition"

* value[x] only CodeableConcept
* valueCodeableConcept from SCDGenotypeVS (extensible)
* valueCodeableConcept ^short = "SCD genotype code (HbSS, HbSC, HbS-Beta0, etc.)"


// ==============================================================================
// Extension: Transfusion Antigen Match Profile
// ==============================================================================
// Context: BiologicallyDerivedProduct (SCDBiologicallyDerivedProduct)
//          Procedure (SCDProcedure — transfusion)
// Purpose: Documents the red cell antigen matching criteria applied to a
//          specific blood product or transfusion order, supporting extended
//          antigen-matched transfusion therapy in SCD.
// ==============================================================================

Extension: SCDTransfusionAntigenMatchExtension
Id: scd-transfusion-antigen-match
Title: "SCD Transfusion Red Cell Antigen Match Profile"
Description: """
  Documents the red cell antigen matching criteria that were applied in
  selecting a blood product for transfusion in a patient with Sickle Cell Disease.

  Extended antigen-matched transfusion — typically including C, c, E, e (Rh),
  K (Kell), Fya/Fyb (Duffy), and Jka/Jkb (Kidd) at minimum — significantly
  reduces the risk of alloimmunization in SCD patients on chronic transfusion
  therapy. This extension enables structured documentation of which antigens
  were matched for a given transfusion event.

  This extension SHALL be used on SCDBiologicallyDerivedProduct instances when
  extended antigen matching was performed. It MAY also be used on the SCDProcedure
  instance representing the transfusion to document the matching requirements
  specified in the order.
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "BiologicallyDerivedProduct"
* ^context[+].type = #element
* ^context[=].expression = "Procedure"

* extension contains
    matchedAntigen 0..* MS and
    matchingProtocol 0..1 MS

* extension[matchedAntigen] ^short = "Specific antigen confirmed matched/negative"
* extension[matchedAntigen] ^definition = "A specific red cell antigen that was confirmed negative (matched) in the selected blood product."
* extension[matchedAntigen].value[x] only CodeableConcept
* extension[matchedAntigen].valueCodeableConcept from SCDRedCellAntigenVS (extensible)

* extension[matchingProtocol] ^short = "Antigen matching protocol used"
* extension[matchingProtocol] ^definition = "The institutional or standard matching protocol applied (e.g., 'CcEeK matching', 'Extended 5-antigen match', 'Full phenotype match')."
* extension[matchingProtocol].value[x] only string


// ==============================================================================
// Extension: SCD Hydroxyurea Adherence
// ==============================================================================
// Context: MedicationStatement or Observation
// Purpose: Captures structured adherence data for hydroxyurea therapy,
//          a key predictor of treatment success and disease outcomes.
// ==============================================================================

Extension: SCDHydroxyureaAdherenceExtension
Id: scd-hydroxyurea-adherence
Title: "SCD Hydroxyurea Adherence"
Description: """
  Captures the documented adherence level of a patient to hydroxyurea therapy.
  Hydroxyurea is the cornerstone disease-modifying therapy for SCD, but its
  effectiveness depends critically on consistent adherence. Non-adherence is
  associated with higher rates of VOC, ACS, and mortality.

  Adherence may be assessed by:
  - Patient/caregiver self-report
  - Pharmacy refill records (Medication Possession Ratio / PDC)
  - Laboratory biomarker (MCV elevation, HbF% increase as markers of response)
  - Pill count

  This extension is intended for use on MedicationStatement or as a component
  of an Observation (adherence monitoring encounter finding).

  TODO: Align adherence coding with established adherence measurement frameworks
  (e.g., MMAS, ARMS, WHO adherence classification) and reference appropriate
  LOINC codes if available.
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^context[+].type = #element
* ^context[=].expression = "Observation"

* extension contains
    adherenceLevel 0..1 MS and
    adherenceMethod 0..1 MS and
    assessmentDate 0..1 MS

* extension[adherenceLevel] ^short = "Adherence level (high / moderate / low / non-adherent)"
* extension[adherenceLevel].value[x] only CodeableConcept
// TODO: Bind to adherence level VS (locally defined or SNOMED CT)

* extension[adherenceMethod] ^short = "Method used to assess adherence"
* extension[adherenceMethod].value[x] only CodeableConcept
// TODO: Bind to adherence method VS

* extension[assessmentDate] ^short = "Date adherence was assessed"
* extension[assessmentDate].value[x] only date


// ==============================================================================
// Extension: SCD VOC Episode Frequency
// ==============================================================================
// Context: Condition (SCDConditionProblemsAndHealthConcerns)
// Purpose: Documents the frequency of vaso-occlusive crisis (VOC) episodes
//          over a defined period, a key clinical indicator used to guide
//          therapy escalation decisions (e.g., starting crizanlizumab,
//          initiating chronic transfusion, considering HSCT).
// ==============================================================================

Extension: SCDVOCFrequencyExtension
Id: scd-voc-frequency
Title: "SCD Vaso-Occlusive Crisis Frequency"
Description: """
  Documents the reported or documented frequency of vaso-occlusive crisis (VOC)
  episodes for a patient with Sickle Cell Disease over a defined observation
  period. This is a key clinical parameter used to assess disease severity
  and guide therapy escalation.

  Clinical context:
  - ≥2 VOC episodes/year: threshold for considering hydroxyurea initiation
  - ≥2 VOC episodes/year on hydroxyurea: threshold for considering crizanlizumab
  - Frequent hospitalizations for VOC: consideration for HSCT evaluation

  This extension is intended for use on the Condition resource representing
  the patient's primary SCD diagnosis (problem list entry).
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "Condition"

* extension contains
    episodeCount 1..1 MS and
    observationPeriod 1..1 MS and
    measurementMethod 0..1 MS

* extension[episodeCount] ^short = "Number of VOC episodes in the observation period"
* extension[episodeCount].value[x] only integer

* extension[observationPeriod] ^short = "Period over which VOC episodes were counted"
* extension[observationPeriod].value[x] only Period

* extension[measurementMethod] ^short = "How episodes were counted (self-report, chart review, hospitalization records)"
* extension[measurementMethod].value[x] only CodeableConcept


// ==============================================================================
// Extension: SCD Blood Product Age
// ==============================================================================
// Context: BiologicallyDerivedProduct (SCDBiologicallyDerivedProduct)
// Purpose: Documents the age of a blood product (days from collection to
//          transfusion) at the time of transfusion. Fresher blood is preferred
//          for SCD exchange transfusion to optimize 2,3-DPG levels and
//          post-exchange HbS% reduction efficacy.
// ==============================================================================

Extension: SCDBloodProductAgeExtension
Id: scd-blood-product-age
Title: "SCD Blood Product Age at Transfusion"
Description: """
  Documents the age of a blood product in days from the date of collection
  (phlebotomy) to the date of transfusion. For Sickle Cell Disease patients
  undergoing automated red cell exchange (erythrocytapheresis), fresher blood
  products (≤7 days) are preferred to maximize post-exchange efficacy and
  minimize issues related to 2,3-DPG depletion and increased RBC rigidity
  in stored cells.

  This extension is intended for use on SCDBiologicallyDerivedProduct instances
  when the product age at time of transfusion is clinically documented.
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "BiologicallyDerivedProduct"

* value[x] only Quantity
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #d
* valueQuantity ^short = "Age of blood product in days at time of transfusion"


// ==============================================================================
// Extension: SCD Iron Chelation Indication
// ==============================================================================
// Context: MedicationRequest (iron chelation prescriptions)
// Purpose: Documents the clinical indication and triggering threshold for
//          initiating iron chelation therapy in an SCD patient, supporting
//          quality measurement and care documentation.
// ==============================================================================

Extension: SCDIronChelationIndicationExtension
Id: scd-iron-chelation-indication
Title: "SCD Iron Chelation Indication"
Description: """
  Documents the clinical indication and triggering laboratory or imaging
  threshold that led to initiation of iron chelation therapy for a patient
  with Sickle Cell Disease on chronic transfusion therapy.

  Iron chelation is indicated when serum ferritin exceeds a threshold
  (commonly >1000 ng/mL sustained over time, or per institutional protocol)
  or when liver iron concentration (LIC) measured by MRI exceeds guidelines
  (typically >5–7 mg Fe/g dry weight). This extension captures the specific
  trigger value and the method used to assess iron burden.
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"

* extension contains
    indicationCode 0..1 MS and
    triggerMeasurement 0..1 MS and
    triggerValue 0..1 MS

* extension[indicationCode] ^short = "Reason for initiating iron chelation"
* extension[indicationCode].value[x] only CodeableConcept
// TODO: Bind to iron overload indication value set

* extension[triggerMeasurement] ^short = "Laboratory or imaging measure that triggered chelation"
* extension[triggerMeasurement].value[x] only CodeableConcept
// e.g., serum ferritin, liver iron concentration (MRI), transferrin saturation

* extension[triggerValue] ^short = "The value at which chelation was initiated"
* extension[triggerValue].value[x] only Quantity


// ==============================================================================
// Extension: SCD Newborn Screen Reference
// ==============================================================================
// Context: Condition (primary SCD diagnosis)
//          Patient (SCDPatient)
// Purpose: Links the SCD diagnosis on the problem list to the original
//          newborn screening result that established the diagnosis, supporting
//          continuity of newborn screening follow-up programs and state registry
//          integration.
// ==============================================================================

Extension: SCDNewbornScreenReferenceExtension
Id: scd-newborn-screen-reference
Title: "SCD Newborn Screen Reference"
Description: """
  References the Observation or DiagnosticReport representing the newborn
  screening result that originally identified or confirmed the patient's
  Sickle Cell Disease diagnosis. This extension supports longitudinal care
  coordination between state newborn screening programs, follow-up programs
  (such as HRSA-funded SCD newborn screening follow-up programs), and ongoing
  clinical care.

  The referenced resource SHOULD be an Observation (hemoglobin fractionation
  result from newborn heel stick) or a DiagnosticReport representing the
  complete newborn screen report.
"""
* ^status = #active
* ^experimental = false
* ^context[+].type = #element
* ^context[=].expression = "Condition"
* ^context[+].type = #element
* ^context[=].expression = "Patient"

* value[x] only Reference(Observation or DiagnosticReport)
* valueReference ^short = "Reference to the original newborn screening Observation or DiagnosticReport"


// ==============================================================================
// Value Set: SCD Genotype (referenced by SCDGenotypeExtension)
// ==============================================================================
// NOTE: Defined here for proximity to the extension that uses it.
// This VS could also reside in SCD_ValueSets.fsh.
// ==============================================================================

ValueSet: SCDGenotypeVS
Id: scd-genotype-vs
Title: "SCD Genotype Value Set"
Description: """
  Value set of codes representing confirmed Sickle Cell Disease genotypes
  for use with the SCDGenotypeExtension on the patient's primary SCD
  Condition resource.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// SNOMED CT SCD genotype concepts
* $sct#127040003  "Sickle cell-hemoglobin SS disease (disorder)"          // HbSS
* $sct#416180004  "Sickle cell-hemoglobin C disease (disorder)"           // HbSC
* $sct#417571000  "Sickle cell-beta-zero-thalassemia (disorder)"          // HbS-Beta0
* $sct#417425009  "Sickle cell-beta-plus-thalassemia (disorder)"          // HbS-Beta+
* $sct#417748003  "Sickle cell-hemoglobin D disease (disorder)"           // HbSD
* $sct#417279003  "Sickle cell-hemoglobin E disease (disorder)"           // HbSE
* $sct#444751005  "Hemoglobin S-O Arab disease (disorder)"                // HbSOArab
* $sct#35434009   "Sickle cell disorder (disorder)"                        // unspecified


// ==============================================================================
// Value Set: SCD Red Cell Antigen (referenced by SCDTransfusionAntigenMatchExtension)
// ==============================================================================

ValueSet: SCDRedCellAntigenVS
Id: scd-red-cell-antigen-vs
Title: "SCD Red Cell Antigen Value Set"
Description: """
  Value set of codes representing red cell blood group antigens used in
  extended antigen-matched transfusion for Sickle Cell Disease patients.
  Covers antigens in the Rh, Kell, Duffy, Kidd, and MNS blood group systems.

  TODO: Map to ISBT 128 antigen codes (primary coding system for blood banking).
  SNOMED CT codes used as placeholder pending ISBT 128 integration.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Rh System
* $sct#16951006   "C antigen (Rh2) (substance)"
* $sct#6411008    "c antigen (Rh4) (substance)"
* $sct#73817003   "E antigen (Rh3) (substance)"
* $sct#35095006   "e antigen (Rh5) (substance)"

// Kell System
* $sct#90290005   "K antigen (Kell1) (substance)"
* $sct#6532007    "k antigen (Kell2) (substance)"

// Duffy System
* $sct#57813001   "Fy(a) antigen (substance)"
* $sct#57814007   "Fy(b) antigen (substance)"

// Kidd System
* $sct#36732006   "Jk(a) antigen (substance)"
* $sct#36733001   "Jk(b) antigen (substance)"

// MNS System
* $sct#21974004   "M antigen (substance)"
* $sct#21977006   "N antigen (substance)"
* $sct#21976002   "S antigen (substance)"
* $sct#21975003   "s antigen (substance)"
