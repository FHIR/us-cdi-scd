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
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^copyright = "ICD-10-CM codes are in the public domain. SNOMED CT codes require a SNOMED CT affiliate license."

// ICD-10-CM — Sickle Cell Disease codes (D57 category)
// HbSS (Sickle Cell Anemia)
* $icd10cm#D57.1   "Sickle-cell disease without crisis"
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
* $icd10cm#D57.218 "Sickle-cell/Hb-C disease with crisis with other specified complication"
* $icd10cm#D57.219 "Sickle-cell/Hb-C disease with crisis, unspecified"
// HbS-Beta-thalassemia
* $icd10cm#D57.40  "Sickle-cell thalassemia without crisis"
* $icd10cm#D57.411 "Sickle-cell thalassemia, unspecified, with acute chest syndrome"
* $icd10cm#D57.412 "Sickle-cell thalassemia, unspecified, with splenic sequestration"
* $icd10cm#D57.413 "Sickle-cell thalassemia, unspecified, with cerebral vascular involvement"
* $icd10cm#D57.414 "Sickle-cell thalassemia, unspecified, with dactylitis"
* $icd10cm#D57.418 "Sickle-cell thalassemia, unspecified, with crisis with other specified complication"
* $icd10cm#D57.419 "Sickle-cell thalassemia, unspecified, with crisis"
* $icd10cm#D57.42  "Sickle-cell thalassemia beta zero without crisis"
* $icd10cm#D57.431 "Sickle-cell thalassemia beta zero with acute chest syndrome"
* $icd10cm#D57.432 "Sickle-cell thalassemia beta zero with splenic sequestration"
* $icd10cm#D57.433 "Sickle-cell thalassemia beta zero with cerebral vascular involvement"
* $icd10cm#D57.434 "Sickle-cell thalassemia beta zero with dactylitis"
* $icd10cm#D57.438 "Sickle-cell thalassemia beta zero with crisis with other specified complication"
* $icd10cm#D57.439 "Sickle-cell thalassemia beta zero with crisis, unspecified"
* $icd10cm#D57.44  "Sickle-cell thalassemia beta plus without crisis"
* $icd10cm#D57.451 "Sickle-cell thalassemia beta plus with acute chest syndrome"
* $icd10cm#D57.452 "Sickle-cell thalassemia beta plus with splenic sequestration"
* $icd10cm#D57.453 "Sickle-cell thalassemia beta plus with cerebral vascular involvement"
* $icd10cm#D57.454 "Sickle-cell thalassemia beta plus with dactylitis"
* $icd10cm#D57.458 "Sickle-cell thalassemia beta plus with crisis with other specified complication"
* $icd10cm#D57.459 "Sickle-cell thalassemia beta plus with crisis, unspecified"
// Other and unspecified SCD
* $icd10cm#D57.80  "Other sickle-cell disorders without crisis"
* $icd10cm#D57.811 "Other sickle-cell disorders with acute chest syndrome"
* $icd10cm#D57.812 "Other sickle-cell disorders with splenic sequestration"
* $icd10cm#D57.813 "Other sickle-cell disorders with cerebral vascular involvement"
* $icd10cm#D57.814 "Other sickle-cell disorders with dactylitis"
* $icd10cm#D57.818 "Other sickle-cell disorders with crisis with other specified complication"
* $icd10cm#D57.819 "Other sickle-cell disorders with crisis, unspecified"

// SNOMED CT — Sickle Cell Disease concepts
* $sct#127040003  "Sickle cell-hemoglobin SS disease (disorder)"
* $sct#35434009  "Sickle cell-hemoglobin C disease"
* $sct#127043001  "Sickle cell-beta^0^-thalassemia"
* $sct#127042006  "Sickle cell beta plus thalassemia"
* $sct#25472008  "Sickle cell-hemoglobin D disease"
* $sct#47024008  "Sickle cell-hemoglobin E disease"
* $sct#127048005  "Sickle cell-Hemoglobin O Arab disease"
* $sct#417357006   "Sickling disorder due to hemoglobin S"   // parent concept
// TODO: terminologist to confirm whether 417357006 subsumes sickle cell trait,
//       which is not a form of sickle cell disease.


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
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Vaso-Occlusive Crisis / Acute Pain Episode — captured by D57 with crisis codes above
// (See SCDDiagnosisVS for D57.x with crisis modifier codes)

// SNOMED CT — Acute SCD complications
* $sct#769167005   "Vaso-occlusive pain episode in sickle cell disease"
* $sct#372146004   "Acute chest syndrome"
* $sct#444108000  "Acute sickle cell splenic sequestration crisis"
* $sct#367061000119107  "Priapism due to sickle cell disease"
* $sct#371104006  "Hand-foot syndrome in sickle cell anemia"
// Avascular necrosis is a chronic complication and is not included here.
// TODO: define a chronic complication value set (avascular necrosis, CKD,
//       retinopathy, pulmonary hypertension) for the problem list profile.

// Stroke / Cerebrovascular
* $icd10cm#I63.9  "Cerebral infarction, unspecified"
* $sct#230690007  "Cerebrovascular accident (disorder)"

// Aplastic crisis
// TODO: add a specific SNOMED CT code for SCD aplastic crisis
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

  RxNorm ingredient codes verified against RxNav (October 2026).
  TODO: Submit to VSAC for OID assignment and curated maintenance.
"""
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^copyright = "RxNorm is in the public domain (NLM)."

// Disease-Modifying Therapies
* $rxnorm#5552  "hydroxyurea"               // Droxia, Siklos (SCD-labeled brands)
* $rxnorm#4885 "glutamine"   // Endari (L-glutamine oral powder)
* $rxnorm#2262279 "crizanlizumab"             // Adakveo
* $rxnorm#2265678 "voxelotor"                 // Oxbryta (withdrawn September 2024; historical records only)

// Gene Therapies
* $rxnorm#2671667 "exagamglogene autotemcel"   // Casgevy
* $rxnorm#2671958 "lovotibeglogene autotemcel" // Lyfgenia

// Iron Chelation Agents
* $rxnorm#614373  "deferasirox"               // Exjade, Jadenu
* $rxnorm#3131    "deferoxamine"              // Desferal
* $rxnorm#11645   "deferiprone"               // Ferriprox

// Antibiotic Prophylaxis (asplenia)
* $rxnorm#7984    "penicillin V"
* $rxnorm#723    "amoxicillin"

// Folic acid supplementation (common practice; evidence is limited)
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
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^copyright = "LOINC is copyright Regenstrief Institute. Free to use under the LOINC license."

// Complete Blood Count (CBC)
* $loinc#718-7    "Hemoglobin [Mass/volume] in Blood"
* $loinc#4544-3   "Hematocrit [Volume Fraction] of Blood by Automated count"
* $loinc#787-2    "MCV [Entitic mean volume] in Red Blood Cells by Automated count"
* $loinc#6690-2   "Leukocytes [#/volume] in Blood by Automated count"
* $loinc#751-8    "Neutrophils [#/volume] in Blood by Automated count"
* $loinc#777-3    "Platelets [#/volume] in Blood by Automated count"
* $loinc#26515-7  "Platelets [#/volume] in Blood"
* $loinc#789-8    "Erythrocytes [#/volume] in Blood by Automated count"

// Reticulocyte Count
* $loinc#17849-1  "Reticulocytes/Erythrocytes in Blood by Automated count"
* $loinc#31112-6  "Reticulocytes/Erythrocytes in Blood by Manual"
* $loinc#60474-4  "Reticulocytes [#/volume] in Blood by Automated count"

// Hemoglobin Fractionation / Electrophoresis
* $loinc#4625-0   "Hemoglobin S/Hemoglobin.total in Blood"         // HbS %
* $loinc#4576-5   "Hemoglobin F/Hemoglobin.total in Blood"         // HbF %
* $loinc#4546-8   "Hemoglobin A/Hemoglobin.total in Blood"         // HbA %
* $loinc#4551-8   "Hemoglobin A2/Hemoglobin.total in Blood"        // HbA2 %
* $loinc#4563-3   "Hemoglobin C/Hemoglobin.total in Blood"         // HbC %
* $loinc#12710-0  "Hemoglobin pattern [Interpretation] in Blood"   // panel interpretation

// Hemolysis Markers
* $loinc#14804-9  "Lactate dehydrogenase [Enzymatic activity/volume] in Serum or Plasma by Lactate to pyruvate reaction"
* $loinc#1975-2   "Bilirubin.total [Mass/volume] in Serum or Plasma"
* $loinc#1968-7   "Bilirubin.direct [Mass/volume] in Serum or Plasma"
* $loinc#4542-7   "Haptoglobin [Mass/volume] in Serum or Plasma"

// Iron Studies
* $loinc#2276-4   "Ferritin [Mass/volume] in Serum or Plasma"
* $loinc#2498-4   "Iron [Mass/volume] in Serum or Plasma"
* $loinc#2500-7   "Iron binding capacity [Mass/volume] in Serum or Plasma"
* $loinc#2502-3   "Iron saturation [Mass Fraction] in Serum or Plasma"

// Renal Function
* $loinc#2160-0   "Creatinine [Mass/volume] in Serum or Plasma"
* $loinc#62238-1  "Glomerular filtration rate [Volume Rate/Area] in Serum, Plasma or Blood by Creatinine-based formula (CKD-EPI)/1.73 sq M"
* $loinc#14959-1  "Microalbumin/Creatinine [Mass Ratio] in Urine"
* $loinc#1754-1   "Albumin [Mass/volume] in Urine"

// Hepatic Function
* $loinc#1742-6   "Alanine aminotransferase [Enzymatic activity/volume] in Serum or Plasma"
* $loinc#1920-8   "Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma"
* $loinc#6768-6   "Alkaline phosphatase [Enzymatic activity/volume] in Serum or Plasma"

// Cardiac / Pulmonary Biomarker (for patients with signs or symptoms; ASH 2019
// suggests against routine screening in asymptomatic patients)
* $loinc#33762-6  "Natriuretic peptide.B prohormone N-Terminal [Mass/volume] in Serum or Plasma"

// Immunohematology
* $loinc#883-9    "ABO group [Type] in Blood"
* $loinc#10331-7  "Rh [Type] in Blood"
* $loinc#890-4    "Blood group antibody screen [Presence] in Serum or Plasma"
* $loinc#888-8  "Blood group antibodies identified in Serum or Plasma"


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
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Transfusion Procedures (SNOMED CT)
* $sct#116863004  "Transfusion of red blood cells"                // simple transfusion
* $sct#71493000   "Transfusion of packed red blood cells"         // simple transfusion
* $sct#438839005  "Erythrocytapheresis"                           // automated red cell exchange
* $sct#225068002  "Red cell exchange transfusion"                 // manual or automated exchange
* $sct#5447007    "Transfusion (procedure)"

// Stem Cell Transplantation
* $sct#23719005   "Transplantation of bone marrow"
* $sct#234336002  "Hemopoietic stem cell transplant (procedure)"
* $sct#174241000112100  "Transplantation of allogeneic hematopoietic stem cell"

// Phlebotomy
* $sct#396540005  "Phlebotomy (procedure)"

// Splenectomy
* $sct#234319005  "Splenectomy"

// Monitoring Procedures
* $sct#431648005  "Transcranial Doppler ultrasonography"
* $sct#40701008   "Echocardiography (procedure)"   // for patients with signs or symptoms (ASH 2019)

// Vascular Access
* $sct#425196008  "Insertion of peripherally inserted central catheter"
* $sct#80402001  "Implantation of venous access port"


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
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Red Blood Cell Products
* $sct#431069006  "Packed red blood cells"
* $sct#126256009  "Red blood cells, human, irradiated"
* $sct#126251004  "Leukocyte reduced red blood cells, human"
// TODO: add a code for apheresis-collected red blood cells (no SNOMED CT
//       equivalent found; consider ISBT 128)

// Hematopoietic Progenitor Cell Products
* $sct#420413007  "Hematopoietic progenitor cells, apheresis (product)"  // TODO: code not found in SNOMED CT US Edition; terminologist to supply correct code
* $sct#419252003  "Hematopoietic progenitor cells, bone marrow (product)"  // TODO: code not found in SNOMED CT US Edition; terminologist to supply correct code
* $sct#767410002  "Hematopoietic progenitor cells, cord blood (product)"  // TODO: code not found in SNOMED CT US Edition; terminologist to supply correct code


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
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Standard Vital Signs (aligned with US Core)
* $loinc#2708-6   "Oxygen saturation in Arterial blood"   // required by US Core for SpO2
* $loinc#59408-5  "Oxygen saturation in Arterial blood by Pulse oximetry"
* $loinc#8310-5   "Body temperature"
* $loinc#85354-9  "Blood pressure panel with all children optional"
* $loinc#8480-6   "Systolic blood pressure"
* $loinc#8462-4   "Diastolic blood pressure"
* $loinc#8867-4   "Heart rate"
* $loinc#9279-1   "Respiratory rate"
* $loinc#29463-7  "Body weight"
* $loinc#8302-2   "Body height"
* $loinc#39156-5  "Body mass index (BMI) [Ratio]"

// SCD-Critical Vital Signs
* $loinc#38208-5  "Pain severity - Reported"
* $loinc#72514-3  "Pain severity - 0-10 verbal numeric rating [Score] - Reported"

// ==============================================================================
// SCDBloodProductProcessingVS — Blood Product Processing Steps and Attributes
// ==============================================================================
// For use with SCDBiologicallyDerivedProduct.processing.procedure
// ==============================================================================

ValueSet: SCDBloodProductProcessingVS
Id: scd-blood-product-processing-vs
Title: "SCD Blood Product Processing Value Set"
Description: """
  Value set of blood product processing steps and attributes relevant to
  transfusion therapy in Sickle Cell Disease, such as leukoreduction,
  irradiation, HbS-negative units and extended antigen matching. Includes all
  codes from the SCD Blood Product Processing code system.
"""
* ^status = #draft
* ^experimental = false
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* include codes from system SCDBloodProductProcessingCS
