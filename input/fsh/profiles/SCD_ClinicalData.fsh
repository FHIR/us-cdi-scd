// ==============================================================================
// USCDI-SCD FSH Profiles — Procedure, Observations, and Biologically Derived Product
// File: input/fsh/profiles/SCD_ClinicalData.fsh
//
// Profiles:
//   - SCDProcedure
//   - SCDObservationLaboratoryResult
//   - SCDObservationVitalSigns
//   - SCDBiologicallyDerivedProduct
// ==============================================================================


// ==============================================================================
// SCDProcedure
// ==============================================================================
// Extends: US Core Procedure Profile
// Purpose: Represents procedures performed in the context of SCD care.
//
// Key SCD procedures:
//   - Simple red blood cell transfusion
//   - Automated red cell exchange (erythrocytapheresis) — exchange transfusion
//   - Phlebotomy (for iron overload management)
//   - Hematopoietic stem cell transplantation (HSCT) — bone marrow transplant
//   - Splenectomy (surgical or historical)
//   - Central venous access / implantable port placement
//   - Transcranial Doppler (TCD) ultrasound
//   - Hydroxyurea dose escalation (clinical act, not procedure per se)
// ==============================================================================

Profile: SCDProcedure
Parent: us-core-procedure
Id: uscdi-scd-procedure
Title: "USCDI-SCD Procedure"
Description: """
  The USCDI-SCD Procedure profile represents procedures performed on or for
  patients with Sickle Cell Disease. This profile extends the
  [US Core Procedure Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-procedure.html).

  SCD-specific procedures represented by this profile include:

  **Transfusion Procedures:**
  - Simple red blood cell transfusion (SNOMED: 116863004 or 71493000 / CPT: 36430)
  - Automated red cell exchange transfusion / erythrocytapheresis
    (SNOMED: 438839005 / CPT: 36512)

  **Definitive/Surgical Procedures:**
  - Hematopoietic stem cell transplantation (HSCT) / bone marrow transplant
  - Splenectomy (typically elective, after recurrent splenic sequestration)
  - Central venous catheter / implantable port placement

  **Monitoring/Diagnostic Procedures:**
  - Transcranial Doppler (TCD) ultrasound (stroke risk screening)
  - Echocardiogram (for patients with signs or symptoms of pulmonary
    hypertension; ASH 2019 suggests against routine screening in
    asymptomatic patients)
  - Liver MRI (iron quantification — R2*/T2* technique)

  When `procedure.code` indicates a transfusion, the procedure SHOULD
  reference the transfusion order in `procedure.basedOn`. The
  SCDBiologicallyDerivedProduct instance(s) for the blood product(s) used
  reference the same order in `BiologicallyDerivedProduct.request`. (In FHIR R4,
  `procedure.usedReference` cannot reference BiologicallyDerivedProduct.)
"""

* ^status = #draft
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Public Health"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Procedure
* status MS
* code MS
* code ^short = "SCD procedure code (SNOMED CT or CPT)"
* code ^comment = """
  For transfusion procedures, code SHOULD use SNOMED CT 116863004 or 71493000
  (simple transfusion) or 438839005 (automated red cell exchange). CPT codes
  MAY be included.
  US Core's preferred binding applies. The SCD Procedure value set lists
  common SCD procedures, for reference.
"""
* subject MS
* subject only Reference(SCDPatient)
* encounter MS
* encounter only Reference(SCDEncounter)
* performed[x] MS
* performer MS
* performer.actor MS
* performer.actor only Reference(SCDPractitioner or SCDPractitionerRole or SCDOrganization)
* reasonCode MS
* reasonReference MS
* reasonReference only Reference(SCDConditionEncounterDiagnosis or SCDConditionProblemsAndHealthConcerns)

// SCD-specific: link transfusion procedure to blood product(s) used
* usedReference MS
* usedReference ^short = "Medications or devices used during the procedure"
* usedReference ^comment = """
  FHIR R4 does not allow this element to reference BiologicallyDerivedProduct.
  For transfusions, link the blood product through the transfusion order
  instead (see the profile description).
"""
* usedReference only Reference (SCDMedication or Device )
// or SCDBiologicallyDerivedProduct

// SCD-specific: antigen matching requested for a transfusion
* extension contains SCDTransfusionAntigenMatchExtension named scd-transfusion-antigen-match 0..1
* extension[scd-transfusion-antigen-match] ^short = "Red cell antigen matching requested for the transfusion"

// ============================================================================== 
// SCDObservationLaboratoryResult
// ==============================================================================
// Extends: US Core Laboratory Result Observation Profile
// Purpose: Represents laboratory results relevant to SCD monitoring.
//
// Key SCD laboratory tests:
//   Hematology:
//     - CBC with differential: Hgb, Hct, MCV, WBC, ANC, platelets
//     - Reticulocyte count and percent
//   Hemoglobin Studies:
//     - Hemoglobin fractionation (HPLC/electrophoresis):
//       HbA %, HbS %, HbF %, HbA2 %, HbC %
//     - Newborn screening result
//   Hemolysis Markers:
//     - LDH (lactate dehydrogenase)
//     - Total and direct bilirubin
//     - Haptoglobin
//     - Peripheral blood smear (sickle cells, target cells, Howell-Jolly bodies)
//   Iron Status:
//     - Serum ferritin (iron overload monitoring)
//     - Serum iron, TIBC, transferrin saturation
//     - Liver iron concentration (MRI T2*/R2* — Observation not Imaging)
//   Renal / Hepatic:
//     - Serum creatinine, BUN, eGFR
//     - Urine albumin, urine albumin-to-creatinine ratio (UACR)
//     - AST, ALT, ALP (hepatic sequestration, iron chelation monitoring)
//   Cardiac / Pulmonary:
//     - NT-proBNP (pulmonary hypertension evaluation in symptomatic patients)
//     - Tricuspid regurgitant jet velocity (TRV) — by echo (if coded as Obs)
//   Transfusion / Immunohematology:
//     - ABO and Rh type
//     - Extended red cell antigen phenotype (Rh, Kell, Duffy, Kidd, MNS)
//     - Red cell antibody screen and identification (alloantibodies)
//     - Pre-transfusion crossmatch result
// ==============================================================================

Profile: SCDObservationLaboratoryResult
Parent: us-core-observation-lab
Id: uscdi-scd-laboratory-result
Title: "USCDI-SCD Laboratory Result"
Description: """
  The USCDI-SCD Laboratory Result profile represents laboratory test results
  relevant to Sickle Cell Disease monitoring and management. This profile
  extends the [US Core Laboratory Result Observation Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-lab.html).

  SCD requires extensive laboratory monitoring across multiple domains:

  **Complete Blood Count (CBC):** Hemoglobin (steady-state values in HbSS are
  typically about 6–9 g/dL and vary by patient and therapy), reticulocyte
  count, MCV, WBC, ANC, platelet count — monitored regularly and during acute
  events. ANC and platelet counts guide hydroxyurea dose escalation.

  **Hemoglobin Fractionation:** HPLC or electrophoresis measuring HbS%,
  HbF%, HbA%, HbA2%, HbC% — used for diagnosis confirmation, monitoring
  hydroxyurea response (rise in HbF), and pre/post-transfusion assessment.
  For chronic transfusion therapy for stroke prevention, the usual goal is a
  pre-transfusion HbS below 30%. Transfusion is not indicated for
  uncomplicated vaso-occlusive crisis (NHLBI 2014).

  **Hemolysis Markers:** LDH, total/direct bilirubin, haptoglobin, reticulocyte
  count — elevated in SCD due to chronic hemolysis; useful for monitoring
  disease activity and response to therapy.

  **Iron Studies and Ferritin:** Used for patients on chronic transfusion
  therapy to detect and monitor transfusional iron overload. Iron chelation is
  generally started when serum ferritin is consistently above 1000 mcg/L after
  substantial transfusion exposure (deferasirox labeling); MRI liver iron
  concentration is the preferred measure because ferritin rises with
  inflammation.

  **Renal Function:** Serum creatinine, eGFR, and urine albumin — kidney
  disease is a common chronic complication of SCD. NHLBI 2014 recommends
  screening for proteinuria starting by age 10, repeated annually if normal.

  **Immunohematology:** An extended red cell antigen profile (Rh, Kell, Duffy,
  Kidd, MNS), preferably by genotyping, is recommended for all patients with
  SCD at the earliest opportunity, ideally before the first transfusion
  (ASH 2020). Red cell antibody screening detects alloantibodies that may
  develop over time.

  Laboratory results SHALL use LOINC codes for `observation.code`. Results
  SHOULD include reference ranges where applicable.
"""

* ^status = #draft
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Public Health"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Lab Result
* status MS
* category MS
* code MS
* code ^short = "LOINC code for SCD laboratory test"
* code ^comment = """
  SCD laboratory tests SHALL be coded using LOINC. Common SCD LOINC codes:
  - Hemoglobin: 718-7
  - Hemoglobin S %: 4625-0
  - Hemoglobin F %: 4576-5
  - LDH: 14804-9
  - Ferritin: 2276-4
  - Serum creatinine: 2160-0
  - Urine albumin/creatinine ratio: 14959-1
  - Reticulocyte count: 17849-1
  - See SCDLaboratoryPanelVS for a reference list of SCD laboratory tests.
  US Core requires LOINC codes here (extensible binding). The SCD Laboratory
  Panel value set lists tests commonly used in SCD care, for reference.
"""
* subject MS
* subject only Reference(SCDPatient)
* effective[x] MS
* value[x] MS
* dataAbsentReason MS
* interpretation MS
* specimen MS
* referenceRange MS
* referenceRange.low MS
* referenceRange.high MS

// Component for panel results (e.g., hemoglobin fractionation panel)
* component MS
* component ^short = "Individual result components (e.g., Hgb fractionation panel)"
* component.code MS
* component.value[x] MS

// ============================================================================== 
// SCDObservationVitalSigns
// ==============================================================================
// Extends: US Core Vital Signs Profile
// Purpose: Represents vital signs relevant to SCD monitoring.
//
// Key SCD vital signs:
//   - Oxygen saturation (SpO2): important for ACS diagnosis and monitoring;
//     mean baseline SpO2 is lower in SCD than in the general population
//   - Pain severity score: numeric rating scale (0-10) — primary measure
//     of VOC severity and treatment response
//   - Blood pressure: hypertension complicates renal disease; hypotension
//     may indicate sepsis or severe anemia
//   - Temperature: fever is a medical emergency in asplenic SCD patients
//   - Respiratory rate: elevated in ACS; used for sepsis screening
//   - Heart rate: tachycardia in anemia, infection, or pain
//   - Body weight: important for hydroxyurea and crizanlizumab dosing
// ==============================================================================

Profile: SCDObservationVitalSigns
Parent: us-core-vital-signs
Id: uscdi-scd-vital-signs
Title: "USCDI-SCD Vital Signs"
Description: """
  The USCDI-SCD Vital Signs profile represents vital sign measurements
  relevant to monitoring patients with Sickle Cell Disease. This profile
  extends the [US Core Vital Signs Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-vital-signs.html).

  Vital signs are particularly important in SCD for:

  **Oxygen Saturation (SpO2):**
  Pulse oximetry is essential for detecting and monitoring Acute Chest Syndrome
  (ACS), a leading cause of death in SCD. Mean baseline SpO2 is lower in people
  with SCD than in the general population. NHLBI 2014 recommends supplemental
  oxygen when SpO2 is below 95% on room air in patients with suspected ACS.
  Systems SHALL support SpO2 measurement.
  LOINC: 2708-6 and 59408-5 (Oxygen saturation by pulse oximetry), as required
  by US Core.

  **Pain Severity Score:**
  Quantified pain intensity is the primary metric for VOC severity assessment
  and treatment titration. The Numeric Rating Scale (NRS, 0-10) is most
  commonly used. Pain scores SHOULD be recorded at each clinical assessment
  during an acute pain episode.
  LOINC: 38208-5 (Pain severity - Reported).

  **Temperature:**
  Fever (≥38.5°C / ≥101.3°F) in a patient with SCD is a medical emergency
  (NHLBI 2014) because functional asplenia increases the risk of invasive
  bacterial infection and sepsis (for example, Streptococcus pneumoniae).
  Temperature SHALL be recorded for all ED and urgent care encounters.

  **Blood Pressure:**
  Kidney disease and hypertension are complications of SCD. SCD patients
  often have lower baseline blood pressure; relative hypertension can be
  clinically significant even within the "normal" range. ASH 2019 suggests a
  blood pressure goal of 130/80 mmHg or lower for adults with SCD.

  **Respiratory Rate and Heart Rate:**
  Tachycardia and tachypnea can be early signs of ACS, sepsis, and severe
  anemia.
"""

* ^status = #draft
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Public Health"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Vital Signs
* status MS
* category MS
* code MS
* code ^short = "Vital sign LOINC code (SpO2, pain score, BP, temp, RR, HR, weight)"
* subject MS
* subject only Reference(SCDPatient)
* effective[x] MS
* value[x] MS
* dataAbsentReason MS
* component MS
* component.code MS
* component.value[x] MS
* component.dataAbsentReason MS

// SpO2 and Pain Score are Must Support for SCD-specific monitoring
* code ^comment = """
  SCD-critical vital signs (SHALL be supported):
  - SpO2: LOINC 2708-6 and 59408-5 (ACS detection)
  - Pain score (NRS 0-10): LOINC 38208-5 (VOC assessment)
  - Body temperature: LOINC 8310-5
  - Blood pressure: LOINC 85354-9 (panel), 8480-6 (systolic), 8462-4 (diastolic)
  - Heart rate: LOINC 8867-4
  - Respiratory rate: LOINC 9279-1
  - Body weight: LOINC 29463-7
  US Core's vital signs binding applies. The SCD Vital Signs value set lists
  vital signs especially relevant to SCD, for reference.
"""


// ==============================================================================
// SCDBiologicallyDerivedProduct
// ==============================================================================
// Base: FHIR R4 BiologicallyDerivedProduct (NO US Core parent profile)
// Purpose: Represents blood products used in SCD care, primarily:
//   - Packed red blood cells (pRBCs) — simple or exchange transfusion
//   - Hematopoietic progenitor cells (HPC) — for HSCT
//
// FHIR 4.0.1 BiologicallyDerivedProduct maturity: Trial Use (FMM 0)
// Note: FHIR R5 significantly enhanced this resource. This profile is
//       constrained to the capabilities of FHIR R4.0.1.
//
// Key elements for SCD:
//   - productCode: ISBT 128 or SNOMED CT product type code
//   - collection.source: donor or autologous
//   - processing: leukoreduction, irradiation (when indicated), antigen-negative
//     unit selection, HbS-negative units
//   - storage: ABO/Rh-compatible, antigen-matched unit
//   - request: links back to the ServiceRequest (transfusion order)
// ==============================================================================

Profile: SCDBiologicallyDerivedProduct
Parent: BiologicallyDerivedProduct
Id: uscdi-scd-biologicallyderivedproduct
Title: "USCDI-SCD BiologicallyDerivedProduct"
Description: """
  The USCDI-SCD BiologicallyDerivedProduct profile represents a blood product
  or other biologically derived product used in the care of patients with
  Sickle Cell Disease. This profile is based directly on the
  [FHIR R4 BiologicallyDerivedProduct resource](http://hl7.org/fhir/R4/biologicallyderivedproduct.html)
  as there is no US Core parent profile for this resource.

  **Role in SCD Care:**

  Transfusion therapy is a cornerstone of SCD management. Blood products are
  used for:
  - **Acute transfusion:** Rapid correction of severe anemia (aplastic crisis,
    splenic sequestration), preparation for surgery, or stroke treatment
  - **Chronic transfusion therapy:** Regular simple or exchange transfusions
    for primary and secondary stroke prevention, and to prevent recurrent
    acute chest syndrome when hydroxyurea is not effective (NHLBI 2014).
    Transfusion is not indicated for uncomplicated vaso-occlusive crisis.
  - **Automated red cell exchange (erythrocytapheresis):** Replaces patient
    red cells with donor cells; lowers HbS% more effectively than simple
    transfusion with less iron loading
  - **Hematopoietic stem cell transplantation (HSCT):** Allogeneic hematopoietic
    progenitor cell products (HPC-A or HPC-M) used in curative HSCT

  **Antigen Matching:**

  People with SCD who receive transfusions are at high risk for red cell
  alloimmunization, in part because of antigen differences between a donor
  pool that is predominantly of European ancestry and recipients who are
  predominantly of African ancestry. ASH 2020 recommends prophylactic
  matching for Rh (C, E or C/c, E/e) and K antigens. Additional matching
  (for example, Fy, Jk and S) is generally reserved for patients who have
  already formed alloantibodies. This profile supports documentation of
  antigen matching via extension or the processing element.

  **ISBT 128 Coding:**

  Blood products SHOULD be coded using ISBT 128, the international standard
  for blood product labeling. SNOMED CT codes MAY also be included.
  TODO: add ISBT 128 codes to the SCD Blood Product Type value set.

  **Limitations in FHIR R4:**

  The FHIR R4 BiologicallyDerivedProduct resource has limited granularity
  compared to FHIR R5. Key information about antigen matching, irradiation
  status, and leukoreduction may require extension elements in R4.
  This profile defines extensions for SCD-specific blood product attributes.
  See [Extensions](extensions.html) for the list of extensions applied here.
"""

* ^status = #draft
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Public Health"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// SCD-specific extensions
* extension contains
    SCDTransfusionAntigenMatchExtension named scd-transfusion-antigen-match 0..1 MS and
    SCDBloodProductAgeExtension named scd-blood-product-age 0..1 MS
* extension[scd-transfusion-antigen-match] ^short = "Red cell antigens matched for this product"
* extension[scd-blood-product-age] ^short = "Age of the product in days at transfusion"

// Product identification
* productCode MS
* productCode ^short = "Blood product type code (ISBT 128 or SNOMED CT)"
* productCode ^comment = """
  SHOULD use ISBT 128 product codes where available. SNOMED CT codes MAY
  be included as an additional coding.

  Common SCD blood product codes (SNOMED CT):
  - 431069006 — Packed red blood cells
  - 126251004 — Leukocyte reduced red blood cells, human
  - 126256009 — Red blood cells, human, irradiated
  TODO: add codes for hematopoietic progenitor cell products (HPC-A, HPC-M,
  cord blood); no SNOMED CT equivalents were found.

  The SCD Blood Product Type value set lists common products (example binding).
  TODO: Add ISBT 128 codes to SCDBloodProductTypeVS.
"""
* productCode from SCDBloodProductTypeVS (example)

// Status of the product
* status MS
* status ^short = "available | unavailable | unsatisfactory | entered-in-error"

// Product category
* productCategory MS
* productCategory ^short = "biologicalAgent | cells | fluid | tissue | organ"
* productCategory ^comment = """
  For red blood cell products: #cells
  For HPC products: #cells
"""

// Request linkage — back to the transfusion ServiceRequest
* request MS
* request ^short = "Reference to the transfusion order (SCDServiceRequest)"
* request only Reference(SCDServiceRequest)

// Collection information
* collection MS
* collection ^short = "Collection details (donor vs autologous, collection time)"
* collection.source MS
* collection.source ^short = "Donor (allogeneic) or patient (autologous)"
* collection.collected[x] MS

// Processing (irradiation, leukoreduction, antigen matching)
* processing MS
* processing ^short = "Product processing steps (irradiation, leukoreduction, CMV-neg)"
* processing ^comment = """
  Document processing modifiers applied to the blood product. SCD-specific
  processing considerations:
  - Leukoreduction: Standard for SCD patients (reduces febrile reactions,
    CMV transmission, and HLA alloimmunization)
  - Irradiation: Indicated for specific groups, such as HSCT candidates and
    recipients and patients with congenital cellular immunodeficiency
    (AABB/BSH guidance); not routinely required for SCD
  - CMV-seronegative units: An institutional choice for selected patients;
    leukoreduced units are widely accepted as CMV-safe
  - Antigen-negative units: Rh (C, E or C/c, E/e) and K at minimum (ASH 2020);
    additional antigens for alloimmunized patients — document matched
    antigens in the processing description or via extension

  processing.procedure has an example binding to the SCD Blood Product
  Processing value set.
"""
* processing.description MS
* processing.procedure MS
* processing.procedure from SCDBloodProductProcessingVS (example)
* processing.time[x] MS

// Storage
* storage MS
* storage ^short = "Storage conditions and duration"
* storage.duration MS

// Extension placeholders for SCD-specific blood product attributes
// TODO: Define and add these extensions to the extensions FSH file:
//   - scd-antigen-match-profile: documents which red cell antigens were matched
//     (e.g., C-neg, E-neg, K-neg, Fya-neg, Jkb-neg)
//   - scd-leukoreduced: boolean indicating leukoreduction status
//   - scd-irradiated: boolean indicating gamma/X-ray irradiation
//   - scd-cmv-negative: boolean indicating CMV-negative selection
//   - scd-age-of-blood: days from collection to transfusion (fresh blood
//     preferred for SCD exchange transfusion)
