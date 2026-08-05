//
// USCDI-SCD FSH Profiles — Procedure, Observations, and Biologically Derived Product
// File: input/fsh/profiles/SCD_ClinicalData.fsh
//
// Profiles:
//   - SCDProcedure
//   - SCDObservationLaboratoryResult
//   - SCDObservationVitalSigns
//   - SCDBiologicallyDerivedProduct
//


//
// SCDProcedure
//
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
//

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
  - Simple red blood cell transfusion (SNOMED: 116859006 / CPT: 36430)
  - Automated red cell exchange transfusion / erythrocytapheresis
    (SNOMED: 71493000 / CPT: 36516)

  **Definitive/Surgical Procedures:**
  - Hematopoietic stem cell transplantation (HSCT) / bone marrow transplant
  - Splenectomy (acute sequestration or elective)
  - Central venous catheter / implantable port placement

  **Monitoring/Diagnostic Procedures:**
  - Transcranial Doppler (TCD) ultrasound (stroke risk screening)
  - Echocardiogram (pulmonary hypertension screening)
  - Liver MRI (iron quantification — R2*/T2* technique)

  When `procedure.code` indicates a transfusion, the procedure SHALL link to
  one or more SCDBiologicallyDerivedProduct instances via
  `procedure.usedReference` to document the specific blood product(s) used.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Procedure
* status MS
* code MS
* code ^short = "SCD procedure code (SNOMED CT or CPT)"
* code ^comment = """
  For transfusion procedures, code SHOULD use SNOMED CT 116859006 (simple
  transfusion) or 71493000 (exchange transfusion). CPT codes MAY be included.
  TODO: Bind to SCDProcedureVS (value set to be defined).
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
* usedReference ^short = "Blood product(s) administered (SCDBiologicallyDerivedProduct)"
* usedReference ^comment = """
  When this Procedure represents a transfusion (simple or exchange), this
  element SHALL reference the SCDBiologicallyDerivedProduct instance(s)
  documenting the specific blood product(s) administered.
"""
* usedReference only Reference(SCDMedication or Device)
// SCDBiologicallyDerivedProduct or
// SCDObservationLaboratoryResult
//
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
//     - NT-proBNP (pulmonary hypertension screening)
//     - Tricuspid regurgitant jet velocity (TRV) — by echo (if coded as Obs)
//   Transfusion / Immunohematology:
//     - ABO and Rh type
//     - Extended red cell antigen phenotype (Rh, Kell, Duffy, Kidd, MNS)
//     - Red cell antibody screen and identification (alloantibodies)
//     - Pre-transfusion crossmatch result
//

Profile: SCDObservationLaboratoryResult
Parent: us-core-observation-lab
Id: uscdi-scd-laboratory-result
Title: "USCDI-SCD Laboratory Result"
Description: """
  The USCDI-SCD Laboratory Result profile represents laboratory test results
  relevant to Sickle Cell Disease monitoring and management. This profile
  extends the [US Core Laboratory Result Observation Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-lab.html).

  SCD requires extensive laboratory monitoring across multiple domains:

  **Complete Blood Count (CBC):** Hemoglobin (baseline ~7-8 g/dL in HbSS),
  reticulocyte count, MCV, WBC, ANC, platelet count — monitored regularly
  and during acute events.

  **Hemoglobin Fractionation:** HPLC or electrophoresis measuring HbS%,
  HbF%, HbA%, HbA2%, HbC% — essential for diagnosis confirmation, monitoring
  hydroxyurea response (HbF target), and pre/post-transfusion assessment.
  The target pre-exchange transfusion HbS% is typically <30% for stroke
  prevention and <50% for general VOC management.

  **Hemolysis Markers:** LDH, total/direct bilirubin, haptoglobin, reticulocyte
  count — elevated in SCD due to chronic hemolysis; useful for monitoring
  disease activity and response to therapy.

  **Iron Studies and Ferritin:** Critical for patients on chronic transfusion
  therapy to detect and monitor transfusional hemosiderosis. Ferritin >1000 ng/mL
  typically triggers iron chelation therapy.

  **Renal Function:** Serum creatinine, eGFR, and UACR — SCD nephropathy
  is a common chronic complication; annual screening is recommended.

  **Immunohematology:** Extended red cell antigen phenotyping (Rh, Kell, Duffy,
  Kidd, MNS) before initiating chronic transfusion to enable antigen-matched
  transfusions and reduce alloimmunization risk. Red cell antibody screening
  for alloantibodies that develop over time.

  Laboratory results SHALL use LOINC codes for `observation.code`. Results
  SHOULD include reference ranges where applicable.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Lab Result
* status MS
* category MS
* code MS
* code ^short = "LOINC code for SCD laboratory test"
* code ^comment = """
  SCD laboratory tests SHALL be coded using LOINC. Common SCD LOINC codes:
  - Hemoglobin: 718-7
  - Hemoglobin S %: 4625-4
  - Hemoglobin F %: 4576-9
  - LDH: 2532-0
  - Ferritin: 2276-4
  - Serum creatinine: 2160-0
  - Urine albumin/creatinine ratio: 14959-1
  - Reticulocyte count: 17849-1
  - See SCDLaboratoryPanelVS for the full recommended value set.
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

// SCDObservationVitalSigns
//
// Extends: US Core Vital Signs Profile
// Purpose: Represents vital signs relevant to SCD monitoring.
//
// Key SCD vital signs:
//   - Oxygen saturation (SpO2): critical for ACS diagnosis and monitoring;
//     SCD patients have chronically lower baseline SpO2 (baseline ~95-97%)
//   - Pain severity score: numeric rating scale (0-10) — primary measure
//     of VOC severity and treatment response
//   - Blood pressure: hypertension complicates renal disease; hypotension
//     may indicate sepsis or severe anemia
//   - Temperature: fever is a medical emergency in asplenic SCD patients
//   - Respiratory rate: elevated in ACS; used for sepsis screening
//   - Heart rate: tachycardia in anemia, infection, or pain
//   - Body weight: important for hydroxyurea and crizanlizumab dosing
//

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
  (ACS), the leading cause of death in SCD. SCD patients have a characteristically
  lower baseline SpO2 than the general population (~95-97%) due to chronic anemia
  and abnormal hemoglobin oxygen affinity. A drop of >3% from baseline or SpO2
  <92% is clinically significant. Systems SHALL support SpO2 measurement.
  LOINC: 59408-5 (Oxygen saturation by pulse oximetry).

  **Pain Severity Score:**
  Quantified pain intensity is the primary metric for VOC severity assessment
  and treatment titration. The Numeric Rating Scale (NRS, 0-10) is most
  commonly used. Pain scores SHOULD be recorded at each clinical assessment
  during an acute pain episode.
  LOINC: 38208-5 (Pain severity — 0-10 numeric rating [NRS]).

  **Temperature:**
  Fever (≥38.5°C / ≥101.3°F) in a patient with SCD is a medical emergency
  due to functional asplenia and risk of overwhelming post-splenectomy infection
  (OPSI). Temperature SHALL be recorded for all ED and urgent care encounters.

  **Blood Pressure:**
  Hypertension is a common complication of SCD nephropathy. SCD patients
  often have lower baseline blood pressure; relative hypertension can be
  clinically significant even within the "normal" range.

  **Respiratory Rate and Heart Rate:**
  Tachycardia and tachypnea are early indicators of ACS, sepsis, and severe
  anemia. Respiratory rate ≥20/min with chest pain or hypoxia is a trigger
  for ACS workup.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
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
  - SpO2: LOINC 59408-5 (required for ACS detection)
  - Pain score (NRS 0-10): LOINC 38208-5 (required for VOC assessment)
  - Body temperature: LOINC 8310-5
  - Blood pressure: LOINC 55284-4
  - Heart rate: LOINC 8867-4
  - Respiratory rate: LOINC 9279-1
  - Body weight: LOINC 29463-7
"""


//
// SCDBiologicallyDerivedProduct
//
// Base: FHIR R4 BiologicallyDerivedProduct (NO US Core parent profile)
// Purpose: Represents blood products used in SCD care, primarily:
//   - Packed red blood cells (pRBCs) — simple transfusion
//   - Apheresis red blood cells — exchange transfusion (erythrocytapheresis)
//   - Hematopoietic progenitor cells (HPC) — for HSCT
//
// FHIR 4.0.1 BiologicallyDerivedProduct maturity: Normative (N)
// Note: FHIR R5 significantly enhanced this resource. This profile is
//       constrained to the capabilities of FHIR R4.0.1.
//
// Key elements for SCD:
//   - productCode: ISBT 128 or SNOMED CT product type code
//   - collection.source: donor or autologous
//   - processing: irradiation, leukoreduction, CMV-negative selection,
//     antigen-matched (extended phenotype matching)
//   - storage: ABO/Rh-compatible, antigen-matched unit
//   - request: links back to the ServiceRequest (transfusion order)
//

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
    for primary and secondary stroke prevention, and refractory VOC management
  - **Automated red cell exchange (erythrocytapheresis):** Replaces patient
    red cells with donor cells; achieves HbS% <30% more effectively than
    simple transfusion with less iron loading
  - **Hematopoietic stem cell transplantation (HSCT):** Allogeneic hematopoietic
    progenitor cell products (HPC-A or HPC-M) used in curative HSCT

  **Extended Antigen Matching:**

  SCD patients on chronic transfusion are at high risk for red cell
  alloimmunization due to antigen differences between Black donors and
  predominantly African American SCD patients. Extended phenotype-matched
  transfusion — matching for C, E, K (Kell), Fya (Duffy a), and Jkb (Kidd b)
  antigens at minimum — significantly reduces alloimmunization rates.
  This profile supports documentation of antigen matching requirements and
  product antigen phenotype via extension or processing element.

  **ISBT 128 Coding:**

  Blood products SHOULD be coded using ISBT 128, the international standard
  for blood product labeling. SNOMED CT codes MAY also be included.

  **Limitations in FHIR R4:**

  The FHIR R4 BiologicallyDerivedProduct resource has limited granularity
  compared to FHIR R5. Key information about antigen matching, irradiation
  status, and leukoreduction may require extension elements in R4.
  This profile defines extensions for SCD-specific blood product attributes.
  See [Extensions](extensions.html) for the list of extensions applied here.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Product identification
* productCode MS
* productCode ^short = "Blood product type code (ISBT 128 or SNOMED CT)"
* productCode ^comment = """
  SHALL use ISBT 128 product codes where available. SNOMED CT codes MAY
  be included as an additional coding.

  Common SCD blood product codes (SNOMED CT):
  - 3360007  — Packed red blood cells (pRBCs)
  - 116762002 — Apheresis red blood cells
  - 420413007 — Hematopoietic progenitor cells, apheresis (HPC-A)
  - 419252003 — Hematopoietic progenitor cells, bone marrow (HPC-M)

  TODO: Bind to SCDBloodProductTypeVS (value set to be defined using ISBT 128
  and SNOMED CT codes for blood products used in SCD care).
"""

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
  - Irradiation: Required if patient is immunocompromised (e.g., post-HSCT)
  - CMV-negative: For CMV-seronegative immunocompromised patients
  - Antigen-matched units: Extended Rh (C, c, E, e), Kell, Duffy, Kidd, MNS
    — document matched antigens in processing description or via extension

  TODO: Bind processing.procedure to SCDBloodProductProcessingVS.
"""
* processing.description MS
* processing.procedure MS
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
