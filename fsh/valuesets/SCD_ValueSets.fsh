// ==============================================================================
// USCDI-SCD FSH Value Sets
// File: input/fsh/valuesets/SCD_ValueSets.fsh
//
// Value sets defined in this file:
//   - SCDDiagnosisVS
//   - SCDAcuteComplicationVS
//   - SCDChronicComplicationVS
//   - SCDGenotypeVS
//   - SCDMedicationVS
//   - SCDLaboratoryPanelVS
//   - SCDProcedureVS
//   - SCDBloodProductTypeVS
//   - SCDBloodProductProcessingVS
//   - SCDEncounterReasonVS
//   - SCDVitalSignsVS
//   - SCDCareTeamRoleVS
//
// NOTE: VSAC-hosted value sets (OID-referenced) should be defined in VSAC
//       and referenced here by canonical URI. Value sets listed here are
//       defined locally for IG completeness pending VSAC submission.
//       TODO: Submit all value sets to VSAC and update canonical URIs.
// ==============================================================================


// ==============================================================================
// SCDDiagnosisVS — Primary SCD Diagnosis Codes
// ==============================================================================
// Covers the root SCD diagnosis codes (ICD-10-CM and SNOMED CT).
// This VS is intended for binding to SCDConditionProblemsAndHealthConcerns.code
// for the primary SCD diagnosis entry on the problem list.
// ==============================================================================

ValueSet: SCDDiagnosisVS
Id: scd-diagnosis-vs
Title: "SCD Diagnosis Value Set"
Description: """
  Value set of codes representing the primary Sickle Cell Disease diagnoses,
  including all major genotypic subtypes. Intended for use with the
  SCDConditionProblemsAndHealthConcerns profile for the primary SCD diagnosis
  entry on a patient's problem list.

  Includes ICD-10-CM D57.x codes and equivalent SNOMED CT codes.

  TODO: Expand with complete SNOMED CT concept set and confirm ICD-10-CM
  code coverage. Submit to VSAC for OID assignment.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^copyright = "ICD-10-CM codes are in the public domain. SNOMED CT codes require a SNOMED CT affiliate license."

// ICD-10-CM — Sickle Cell Disease codes (D57 category)
// HbSS (Sickle Cell Anemia)
* $icd10cm#D57.1   "Sickle-cell disease without crisis, Hb-SS"
* $icd10cm#D57.00  "Hb-SS disease with crisis, unspecified"
* $icd10cm#D57.01  "Hb-SS disease with acute chest syndrome"
* $icd10cm#D57.02  "Hb-SS disease with splenic sequestration"
* $icd10cm#D57.03  "Hb-SS disease with cerebral vascular involvement"
* $icd10cm#D57.04  "Hb-SS disease with dactylitis"
* $icd10cm#D57.09  "Hb-SS disease with crisis with other specified complication"
// HbSC
* $icd10cm#D57.20  "Sickle-cell/Hb-C disease without crisis"
* $icd10cm#D57.211 "Sickle-cell/Hb-C disease with acute chest syndrome"
* $icd10cm#D57.212 "Sickle-cell/Hb-C disease with splenic sequestration"
* $icd10cm#D57.213 "Sickle-cell/Hb-C disease with cerebral vascular involvement"
* $icd10cm#D57.214 "Sickle-cell/Hb-C disease with dactylitis"
* $icd10cm#D57.219 "Sickle-cell/Hb-C disease with crisis, unspecified"
// HbS-Beta-thalassemia
* $icd10cm#D57.40  "Sickle-cell thalassemia, unspecified, without crisis"
* $icd10cm#D57.411 "Sickle-cell thalassemia, unspecified, with acute chest syndrome"
* $icd10cm#D57.412 "Sickle-cell thalassemia, unspecified, with splenic sequestration"
* $icd10cm#D57.419 "Sickle-cell thalassemia, unspecified, with crisis"
* $icd10cm#D57.42  "Sickle-cell thalassemia beta zero without crisis"
* $icd10cm#D57.431 "Sickle-cell thalassemia beta zero with acute chest syndrome"
* $icd10cm#D57.432 "Sickle-cell thalassemia beta zero with splenic sequestration"
* $icd10cm#D57.439 "Sickle-cell thalassemia beta zero with crisis, unspecified"
* $icd10cm#D57.44  "Sickle-cell thalassemia beta plus without crisis"
* $icd10cm#D57.451 "Sickle-cell thalassemia beta plus with acute chest syndrome"
* $icd10cm#D57.452 "Sickle-cell thalassemia beta plus with splenic sequestration"
* $icd10cm#D57.459 "Sickle-cell thalassemia beta plus with crisis, unspecified"
// Other and unspecified SCD
* $icd10cm#D57.80  "Other sickle-cell disorders without crisis"
* $icd10cm#D57.811 "Other sickle-cell disorders with acute chest syndrome"
* $icd10cm#D57.812 "Other sickle-cell disorders with splenic sequestration"
* $icd10cm#D57.819 "Other sickle-cell disorders with crisis, unspecified"

// SNOMED CT — Sickle Cell Disease concepts
* $sct#127040003  "Sickle cell-hemoglobin SS disease (disorder)"
* $sct#416180004  "Sickle cell-hemoglobin C disease (disorder)"
* $sct#417571000  "Sickle cell-beta-zero-thalassemia (disorder)"
* $sct#417425009  "Sickle cell-beta-plus-thalassemia (disorder)"
* $sct#417748003  "Sickle cell-hemoglobin D disease (disorder)"
* $sct#417279003  "Sickle cell-hemoglobin E disease (disorder)"
* $sct#444751005  "Hemoglobin S-O Arab disease (disorder)"
* $sct#35434009   "Sickle cell disorder (disorder)"   // parent concept


// ==============================================================================
// SCDAcuteComplicationVS — Acute SCD Complication Diagnosis Codes
// ==============================================================================
// For use with SCDConditionEncounterDiagnosis.code
// ==============================================================================

ValueSet: SCDAcuteComplicationVS
Id: scd-acute-complication-vs
Title: "SCD Acute Complication Value Set"
Description: """
  Value set of codes representing acute complications of Sickle Cell Disease
  that may be documented as encounter diagnoses. Includes vaso-occlusive crisis,
  acute chest syndrome, splenic sequestration, stroke, and other acute events.

  TODO: Expand SNOMED CT concept coverage. Submit to VSAC.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Vaso-Occlusive Crisis / Acute Pain Episode — captured by D57 with crisis codes above
// (See SCDDiagnosisVS for D57.x with crisis modifier codes)

// SNOMED CT — Acute SCD complications
* $sct#127040003  "Sickle cell-hemoglobin SS disease (disorder)"  // root (for crisis)
* $sct#30925003   "Sickle cell crisis (disorder)"
* $sct#73290009   "Acute chest syndrome (disorder)"
* $sct#234391009  "Sickle cell splenic sequestration crisis (disorder)"
* $sct#111513000  "Priapism (disorder)"
* $sct#413441004  "Dactylitis (disorder)"
* $sct#422918003  "Avascular necrosis of bone due to sickle cell disease (disorder)"

// Stroke / Cerebrovascular
* $icd10cm#I63.9  "Cerebral infarction, unspecified"
* $sct#230690007  "Cerebrovascular accident (disorder)"

// Aplastic crisis
* $sct#127040003  "Sickle cell disease with aplastic crisis"  // TODO: find specific code
* $icd10cm#D57.09 "Hb-SS disease with crisis with other specified complication"

// Fever/Sepsis in SCD (functional asplenia)
* $icd10cm#A41.9  "Sepsis, unspecified organism"
* $sct#91302008   "Sepsis (disorder)"


// ==============================================================================
// SCDMedicationVS — SCD Disease-Related Medications
// ==============================================================================
// For use with SCDMedication.code (RxNorm)
// ==============================================================================

ValueSet: SCDMedicationVS
Id: scd-medication-vs
Title: "SCD Medication Value Set"
Description: """
  Value set of RxNorm codes for medications used in Sickle Cell Disease
  management, including disease-modifying therapies, iron chelation agents,
  and prophylactic antibiotics.

  TODO: Confirm RxNorm concept IDs (placeholders marked with comments).
  Submit to VSAC for OID assignment and curated maintenance.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^copyright = "RxNorm is in the public domain (NLM)."

// Disease-Modifying Therapies
* $rxnorm#202462  "hydroxyurea"               // Droxia, Siklos, Hydrea
* $rxnorm#1876366 "L-glutamine oral powder"   // Endari — TODO: verify RxNorm ID
* $rxnorm#2002016 "crizanlizumab"             // Adakveo — TODO: verify RxNorm ID
* $rxnorm#2200647 "voxelotor"                 // Oxbryta (withdrawn 2024; historical)
// Gene therapies — may not yet have RxNorm codes; TODO: add when available
// * $rxnorm#TBD   "exagamglogene autotemcel"   // Casgevy
// * $rxnorm#TBD   "lovotibeglogene autotemcel" // Lyfgenia

// Iron Chelation Agents
* $rxnorm#214385  "deferasirox"               // Exjade, Jadenu
* $rxnorm#3271    "deferoxamine"              // Desferal
* $rxnorm#72398   "deferiprone"               // Ferriprox

// Antibiotic Prophylaxis (asplenia)
* $rxnorm#7980    "penicillin V"
* $rxnorm#723    "amoxicillin"

// Folic acid supplementation (compensatory erythropoiesis)
* $rxnorm#4511   "folic acid"

// TODO: Add analgesic medications commonly used in SCD pain management
// (morphine, hydromorphone, oxycodone, acetaminophen, ketorolac)
// with appropriate prescribing guidance notes


// ==============================================================================
// SCDLaboratoryPanelVS — SCD Relevant Laboratory Tests
// ==============================================================================
// For use with SCDObservationLaboratoryResult.code (LOINC)
// ==============================================================================

ValueSet: SCDLaboratoryPanelVS
Id: scd-laboratory-panel-vs
Title: "SCD Laboratory Panel Value Set"
Description: """
  Value set of LOINC codes for laboratory tests routinely ordered and reported
  in the monitoring and management of Sickle Cell Disease. Covers CBC,
  hemoglobin fractionation, hemolysis markers, iron studies, renal function,
  hepatic function, and immunohematology tests.

  TODO: Expand with complete LOINC coverage. Submit to VSAC.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^copyright = "LOINC is copyright Regenstrief Institute. Free to use under the LOINC license."

// Complete Blood Count (CBC)
* $loinc#718-7    "Hemoglobin [Mass/volume] in Blood"
* $loinc#4544-3   "Hematocrit [Volume Fraction] of Blood by Automated count"
* $loinc#787-2    "MCV [Entitic volume] by Automated count"
* $loinc#6690-2   "Leukocytes [#/volume] in Blood by Automated count"
* $loinc#751-8    "Neutrophils [#/volume] in Blood by Automated count"
* $loinc#777-3    "Platelets [#/volume] in Blood by Automated count"
* $loinc#26515-7  "Platelets [#/volume] in Blood"
* $loinc#789-8    "Erythrocytes [#/volume] in Blood by Automated count"

// Reticulocyte Count
* $loinc#17849-1  "Reticulocytes/100 erythrocytes in Blood"
* $loinc#60474-4  "Reticulocytes [#/volume] in Blood"

// Hemoglobin Fractionation / Electrophoresis
* $loinc#4625-4   "Hemoglobin S/Hemoglobin.total in Blood"         // HbS %
* $loinc#4576-9   "Hemoglobin F/Hemoglobin.total in Blood"         // HbF %
* $loinc#4552-6   "Hemoglobin A/Hemoglobin.total in Blood"         // HbA %
* $loinc#4551-8   "Hemoglobin A2/Hemoglobin.total in Blood"        // HbA2 %
* $loinc#4563-3   "Hemoglobin C/Hemoglobin.total in Blood"         // HbC %
* $loinc#32682-8  "Hemoglobin pattern [Interpretation] in Blood"   // panel interpretation

// Hemolysis Markers
* $loinc#2532-0   "Lactate dehydrogenase [Enzymatic activity/volume] in Serum or Plasma"
* $loinc#1975-2   "Bilirubin.total [Mass/volume] in Serum or Plasma"
* $loinc#1968-7   "Bilirubin.direct [Mass/volume] in Serum or Plasma"
* $loinc#13969-1  "Haptoglobin [Mass/volume] in Serum or Plasma"
* $loinc#5905-5   "Reticulocytes/100 erythrocytes in Blood by Manual count"

// Iron Studies
* $loinc#2276-4   "Ferritin [Mass/volume] in Serum or Plasma"
* $loinc#2498-4   "Iron [Mass/volume] in Serum or Plasma"
* $loinc#2500-7   "Iron binding capacity [Mass/volume] in Serum or Plasma"
* $loinc#17780-8  "Iron saturation [Mass Fraction] in Serum or Plasma"

// Renal Function
* $loinc#2160-0   "Creatinine [Mass/volume] in Serum or Plasma"
* $loinc#62238-1  "Glomerular filtration rate/1.73 sq M.predicted (CKD-EPI) [Volume Rate/Area] in Serum, Plasma or Blood"
* $loinc#14959-1  "Microalbumin/Creatinine [Ratio] in Urine"
* $loinc#1754-1   "Albumin [Mass/volume] in Urine"

// Hepatic Function
* $loinc#1742-6   "Alanine aminotransferase [Enzymatic activity/volume] in Serum or Plasma"
* $loinc#1920-8   "Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma"
* $loinc#6768-6   "Alkaline phosphatase [Enzymatic activity/volume] in Serum or Plasma"

// Cardiac / Pulmonary Biomarker
* $loinc#33762-6  "NT-proBNP [Mass/volume] in Serum or Plasma"

// Immunohematology
* $loinc#883-9    "ABO group [Type] in Blood"
* $loinc#10331-7  "Rh [Type] in Blood"
* $loinc#890-4    "Blood group antibody screen [Presence] in Serum or Plasma"
* $loinc#20977-8  "Blood group antibodies identified [Identifier] in Serum or Plasma"


// ==============================================================================
// SCDProcedureVS — SCD Relevant Procedures
// ==============================================================================
// For use with SCDProcedure.code (SNOMED CT or CPT)
// ==============================================================================

ValueSet: SCDProcedureVS
Id: scd-procedure-vs
Title: "SCD Procedure Value Set"
Description: """
  Value set of codes representing procedures commonly performed in the
  management of Sickle Cell Disease, including transfusion, exchange
  transfusion, stem cell transplantation, and diagnostic monitoring procedures.

  TODO: Add complete CPT code coverage. Submit to VSAC.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Transfusion Procedures (SNOMED CT)
* $sct#116859006  "Transfusion of packed red blood cells (procedure)"
* $sct#71493000   "Automated red blood cell exchange (procedure)"
* $sct#5447007    "Transfusion (procedure)"

// Stem Cell Transplantation
* $sct#58776007   "Bone marrow transplant (procedure)"
* $sct#234336002  "Hemopoietic stem cell transplant (procedure)"
* $sct#444360002  "Allogeneic hematopoietic stem cell transplantation (procedure)"

// Phlebotomy
* $sct#396540005  "Phlebotomy (procedure)"

// Splenectomy
* $sct#173422009  "Splenectomy (procedure)"

// Monitoring Procedures
* $sct#304440008  "Transcranial Doppler ultrasound (procedure)"
* $sct#40701008   "Echocardiography (procedure)"

// Vascular Access
* $sct#36969009   "Placement of peripherally inserted central venous catheter (procedure)"
* $sct#405170002  "Implantation of implantable venous access port (procedure)"


// ==============================================================================
// SCDBloodProductTypeVS — Blood Product Types Used in SCD
// ==============================================================================
// For use with SCDBiologicallyDerivedProduct.productCode
// ==============================================================================

ValueSet: SCDBloodProductTypeVS
Id: scd-blood-product-type-vs
Title: "SCD Blood Product Type Value Set"
Description: """
  Value set of codes representing blood product types used in the care of
  patients with Sickle Cell Disease, including red blood cell products and
  hematopoietic progenitor cell products for transplantation.

  Codes sourced from SNOMED CT. ISBT 128 codes SHOULD also be included
  where available; TODO: add ISBT 128 code system and concepts.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Red Blood Cell Products
* $sct#3360007    "Packed red blood cells (product)"
* $sct#116762002  "Apheresis red blood cells (product)"
* $sct#126242007  "Irradiated packed red blood cells (product)"
* $sct#126243002  "Leukoreduced packed red blood cells (product)"

// Hematopoietic Progenitor Cell Products
* $sct#420413007  "Hematopoietic progenitor cells, apheresis (product)"
* $sct#419252003  "Hematopoietic progenitor cells, bone marrow (product)"
* $sct#767410002  "Hematopoietic progenitor cells, cord blood (product)"


// ==============================================================================
// SCDVitalSignsVS — SCD Relevant Vital Signs
// ==============================================================================
// For use with SCDObservationVitalSigns.code (LOINC)
// ==============================================================================

ValueSet: SCDVitalSignsVS
Id: scd-vital-signs-vs
Title: "SCD Vital Signs Value Set"
Description: """
  Value set of LOINC codes for vital signs especially relevant to monitoring
  patients with Sickle Cell Disease. Extends the US Core Vital Signs value set
  with the addition of pain severity score (NRS), which is critical for
  vaso-occlusive crisis assessment.
"""
* ^status = #active
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Standard Vital Signs (aligned with US Core)
* $loinc#59408-5  "Oxygen saturation in Arterial blood by Pulse oximetry"
* $loinc#8310-5   "Body temperature"
* $loinc#55284-4  "Blood pressure systolic and diastolic"
* $loinc#8480-6   "Systolic blood pressure"
* $loinc#8462-4   "Diastolic blood pressure"
* $loinc#8867-4   "Heart rate"
* $loinc#9279-1   "Respiratory rate"
* $loinc#29463-7  "Body weight"
* $loinc#8302-2   "Body height"
* $loinc#39156-5  "Body mass index (BMI)"

// SCD-Critical Vital Signs
* $loinc#38208-5  "Pain severity - 0-10 verbal numeric rating [NRS]"
* $loinc#72514-3  "Pain severity - 0-10 verbal numeric rating [NRS] - reported"
