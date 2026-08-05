// ==============================================================================
// USCDI-SCD FSH Code Systems
// File: input/fsh/codesystems/SCD_CodeSystems.fsh
//
// Code systems defined locally by this IG for SCD-specific concepts not
// adequately covered by standard terminologies (SNOMED CT, LOINC, RxNorm,
// ICD-10-CM).
//
// NOTE: Before finalizing this IG, each local code system SHOULD be reviewed
// against SNOMED CT and LOINC to determine whether a request for a new concept
// should be submitted to the relevant SDO rather than creating a local code.
// Local codes should be a last resort.
// ==============================================================================


// ==============================================================================
// SCDObservationCategoryCS
// ==============================================================================
// Local codes for SCD-specific observation categories not present in the
// standard HL7 observation-category code system.
// ==============================================================================

CodeSystem: SCDObservationCategoryCS
Id: scd-observation-category-cs
Title: "SCD Observation Category Code System"
Description: """
  Local code system defining observation category codes specific to Sickle
  Cell Disease clinical data exchange. These categories supplement the
  standard HL7 observation-category codes (laboratory, vital-signs, etc.)
  with SCD-specific sub-categories.

  TODO: Review against LOINC Part codes and US Core observation categories
  before finalizing. Consider submitting concepts to HL7 THO or LOINC.
"""
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* #hemoglobin-fractionation
    "Hemoglobin Fractionation"
    "Observation category for hemoglobin fractionation or electrophoresis results,
     including HbS%, HbF%, HbA%, HbA2%, and HbC% as measured by HPLC or
     capillary electrophoresis."

* #iron-overload-assessment
    "Iron Overload Assessment"
    "Observation category for measurements used to assess transfusional iron
     overload in SCD patients on chronic transfusion therapy, including serum
     ferritin, liver iron concentration (LIC), and transferrin saturation."

* #transfusion-medicine
    "Transfusion Medicine"
    "Observation category for immunohematology and transfusion medicine
     results, including ABO/Rh typing, extended red cell antigen phenotyping,
     antibody identification, and crossmatch results."

* #scd-pain-assessment
    "SCD Pain Assessment"
    "Observation category for pain severity assessments in the context of
     Sickle Cell Disease, including numeric rating scale (NRS) scores for
     vaso-occlusive crisis monitoring."

* #scd-disease-monitoring
    "SCD Disease Monitoring"
    "Observation category for disease-specific monitoring observations in
     SCD that do not fit other standard categories, including functional
     asplenia markers, organ function screening, and complication surveillance."


// ==============================================================================
// SCDBloodProductProcessingCS
// ==============================================================================
// Local codes for blood product processing modifiers important in SCD
// transfusion therapy. These supplement ISBT 128 and SNOMED CT.
// ==============================================================================

CodeSystem: SCDBloodProductProcessingCS
Id: scd-blood-product-processing-cs
Title: "SCD Blood Product Processing Code System"
Description: """
  Local code system for blood product processing steps and attributes
  relevant to transfusion therapy in Sickle Cell Disease. Covers extended
  antigen matching criteria, processing modifiers, and product selection
  requirements specific to SCD care.

  TODO: Map to ISBT 128 processing codes and SNOMED CT where equivalents
  exist. Consider ISBT 128 as the primary coding system and use this only
  for concepts not yet covered.
"""
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Processing Modifiers
* #leukoreduced
    "Leukoreduced"
    "Blood product from which the majority of leukocytes have been removed
     by filtration (leukoreduction). Standard of care for SCD patients to
     reduce febrile non-hemolytic transfusion reactions, CMV transmission
     risk, and HLA alloimmunization."

* #irradiated
    "Irradiated"
    "Blood product that has been exposed to gamma radiation or X-ray irradiation
     to inactivate T-lymphocytes, preventing transfusion-associated graft-vs-host
     disease (TA-GvHD). Required for immunocompromised SCD patients and those
     post-HSCT."

* #cmv-negative
    "CMV Seronegative"
    "Blood product collected from a donor who tested negative for cytomegalovirus
     (CMV) antibodies. Required for CMV-seronegative immunocompromised patients."

* #sickle-cell-negative
    "Sickle Cell Trait Negative (HbS Negative)"
    "Blood product confirmed to be from a donor who does not carry the sickle
     hemoglobin trait (HbAS) or disease (HbSS). Required for exchange transfusion
     in SCD patients to ensure post-transfusion HbS reduction is effective."

// Extended Antigen Matching
* #antigen-matched-C-neg
    "C Antigen Negative (Rh system)"
    "Blood product confirmed negative for the C antigen (Rh2) in the Rhesus
     blood group system. Used in antigen-matched transfusion for SCD patients
     who are C antigen negative."

* #antigen-matched-E-neg
    "E Antigen Negative (Rh system)"
    "Blood product confirmed negative for the E antigen (Rh3) in the Rhesus
     blood group system. Used in antigen-matched transfusion for SCD patients
     who are E antigen negative."

* #antigen-matched-K-neg
    "K Antigen Negative (Kell system)"
    "Blood product confirmed negative for the K antigen (KEL1) in the Kell
     blood group system. Used in antigen-matched transfusion for SCD patients
     who are K antigen negative (the majority of Black donors are K-negative)."

* #antigen-matched-Fya-neg
    "Fya Antigen Negative (Duffy system)"
    "Blood product confirmed negative for the Fya antigen (FY1) in the Duffy
     blood group system. Used in antigen-matched transfusion for SCD patients
     who are Fya antigen negative."

* #antigen-matched-Jkb-neg
    "Jkb Antigen Negative (Kidd system)"
    "Blood product confirmed negative for the Jkb antigen (JK2) in the Kidd
     blood group system. Used in antigen-matched transfusion for SCD patients
     who are Jkb antigen negative."

* #extended-phenotype-matched
    "Extended Phenotype Matched"
    "Blood product matched for an extended panel of red cell antigens beyond
     ABO/Rh D, typically including C, E, K, Fya, and Jkb at minimum,
     per the prescribing institution's SCD transfusion protocol."

* #fresh-blood
    "Fresh Blood (≤7 days)"
    "Blood product collected within 7 days of planned transfusion date.
     Preferred for automated red cell exchange in SCD to optimize post-exchange
     HbS% reduction and 2,3-DPG levels."
