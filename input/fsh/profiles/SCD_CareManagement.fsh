// ==============================================================================
// USCDI-SCD FSH Profiles — Allergy, Care Planning, and Medications
// File: input/fsh/profiles/SCD_CareManagement.fsh
//
// Profiles:
//   - SCDAllergyIntolerance
//   - SCDCarePlan
//   - SCDServiceRequest
//   - SCDMedication
// ==============================================================================


// ==============================================================================
// SCDAllergyIntolerance
// ==============================================================================
// Extends: US Core Allergy Intolerance Profile
// Purpose: Represents drug allergies and transfusion reactions in SCD patients.
//
// SCD-specific allergy context:
//   - Drug allergies: NSAIDs (ibuprofen, ketorolac), opioids, penicillin,
//     hydroxyurea (hypersensitivity), iron chelation agents
//   - Transfusion reactions: hemolytic transfusion reactions (immediate and
//     delayed), febrile non-hemolytic reactions, allergic/urticarial reactions,
//     anaphylaxis to blood products
//   - Note: Alloimmunization (red cell antibody formation) is a critical
//     complication of chronic transfusion therapy in SCD. While alloantibodies
//     are technically not "allergies," clinically relevant alloantibodies
//     SHOULD be documented and may be represented here or as a separate
//     Observation profile. See also: SCDObservationLaboratoryResult.
// ==============================================================================

Profile: SCDAllergyIntolerance
Parent: us-core-allergyintolerance
Id: uscdi-scd-allergyintolerance
Title: "USCDI-SCD AllergyIntolerance"
Description: """
  The USCDI-SCD AllergyIntolerance profile represents drug allergies, food
  allergies, and adverse reactions — including transfusion reactions — for
  patients with Sickle Cell Disease. This profile extends the
  [US Core AllergyIntolerance Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-allergyintolerance.html).

  SCD patients are at elevated risk for:
  - **Drug allergies/reactions:** NSAIDs (commonly prescribed for pain but may
    cause renal toxicity in SCD), opioids, penicillin (prophylaxis for
    asplenic patients), hydroxyurea, iron chelation agents
  - **Transfusion reactions:** Including hemolytic transfusion reactions (a
    life-threatening complication), febrile non-hemolytic transfusion reactions,
    allergic reactions, and transfusion-related acute lung injury (TRALI)

  Clinically significant red cell alloantibodies (e.g., anti-E, anti-C,
  anti-Kell, anti-Jka) that arise from chronic transfusion SHOULD be documented.
  Systems SHOULD provide a mechanism to link AllergyIntolerance entries for
  transfusion reactions to the causative BiologicallyDerivedProduct encounter.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core AllergyIntolerance
* clinicalStatus MS
* verificationStatus MS
* type MS
* category MS
* criticality MS
* code MS
* code ^short = "Allergen or substance causing reaction (drug, blood product)"
* code ^comment = """
  For SCD drug allergies, code SHOULD use RxNorm. For transfusion reactions,
  code MAY reference the blood product type using ISBT 128 or SNOMED CT.
"""
* patient MS
* patient only Reference(SCDPatient)
* onset[x] MS
* reaction MS
* reaction.substance MS
* reaction.manifestation MS
* reaction.severity MS


// ==============================================================================
// SCDCarePlan
// ==============================================================================
// Extends: US Core CarePlan Profile
// Purpose: Represents disease management care plans for SCD patients.
//
// SCD care plans may include:
//   - Chronic transfusion therapy schedule (frequency, target HbS %)
//   - Hydroxyurea dosing plan and escalation schedule
//   - Pain management plan (crisis protocol, home management)
//   - Preventive care (vaccinations, penicillin prophylaxis, ophthalmology)
//   - Transition-of-care plan (pediatric to adult SCD care)
//   - Psychosocial support plan (counseling, school/work accommodations)
//   - Emergency care instructions (emergency department care plan)
// ==============================================================================

Profile: SCDCarePlan
Parent: us-core-careplan
Id: uscdi-scd-careplan
Title: "USCDI-SCD CarePlan"
Description: """
  The USCDI-SCD CarePlan profile represents a structured care plan for a patient
  with Sickle Cell Disease. This profile extends the
  [US Core CarePlan Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-careplan.html).

  SCD care plans support coordinated, longitudinal management across hematology,
  primary care, emergency care, and specialty services. Common care plan types
  in SCD include:

  - **Chronic Transfusion Therapy Plan:** Defines transfusion schedule,
    target pre-transfusion HbS percentage (typically <30% for stroke
    prevention), extended antigen matching requirements, and iron chelation
    monitoring triggers.
  - **Hydroxyurea Management Plan:** Documents starting dose, escalation
    schedule, target HbF or ANC, monitoring intervals, and adherence goals.
  - **Pain Management Plan:** Specifies individualized home pain management
    regimen, crisis protocol, opioid prescribing agreements, and ED care
    instructions.
  - **Transition-of-Care Plan:** Documents the plan for transferring a
    pediatric SCD patient to adult care, including care team changes and
    patient education goals.
  - **Emergency Department Care Plan:** Provides ED providers with
    patient-specific SCD management instructions (analgesic regimen,
    transfusion thresholds, care escalation criteria).

  The `CarePlan.text` narrative SHALL contain a human-readable summary of the
  care plan. Structured `activity` entries SHOULD reference ServiceRequest,
  MedicationRequest, and other resources where available.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core CarePlan
* text MS
* text ^short = "Human-readable SCD care plan narrative (SHALL be present)"
* status MS
* intent MS
* category MS
* subject MS
* subject only Reference(SCDPatient)

// Additional SCD-specific Must Support elements
* period MS
* period ^short = "Plan effective period"
* author MS
* author only Reference(SCDPractitioner or SCDPractitionerRole or SCDOrganization)
* careTeam MS
* addresses MS
* addresses only Reference(SCDConditionProblemsAndHealthConcerns)
* goal MS
* activity MS
* activity.reference MS
* activity.detail MS
* activity.detail.status MS
* activity.detail.description MS


// ==============================================================================
// SCDServiceRequest
// ==============================================================================
// Extends: US Core ServiceRequest Profile
// Purpose: Represents referrals and orders in the context of SCD care.
//
// SCD-specific service requests include:
//   - Referral to hematology specialty
//   - Referral to pain management service
//   - Referral to social work / care coordination
//   - Referral to ophthalmology (retinopathy screening)
//   - Referral to nephrology (CKD monitoring)
//   - Referral to HSCT program
//   - Transfusion order (links to BiologicallyDerivedProduct)
//   - Laboratory order (links to SCDObservationLaboratoryResult)
//   - Imaging order (TCD ultrasound, MRI brain for stroke surveillance)
// ==============================================================================

Profile: SCDServiceRequest
Parent: us-core-servicerequest
Id: uscdi-scd-servicerequest
Title: "USCDI-SCD ServiceRequest"
Description: """
  The USCDI-SCD ServiceRequest profile represents a referral, order, or
  care coordination request for a patient with Sickle Cell Disease. This
  profile extends the
  [US Core ServiceRequest Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-servicerequest.html).

  SCD-specific service requests include:
  - **Specialty referrals:** Hematology, pain management, nephrology,
    ophthalmology, neurology (stroke program), hepatology, pulmonology,
    and hematopoietic stem cell transplantation (HSCT) programs
  - **Transfusion orders:** Simple transfusion and automated red cell
    exchange (erythrocytapheresis) — these requests link to the
    SCDProcedure and SCDBiologicallyDerivedProduct profiles
  - **Laboratory orders:** Hemoglobin fractionation, CBC, ferritin,
    red cell antigen phenotyping, cross-match for transfusion
  - **Imaging orders:** Transcranial Doppler (TCD) ultrasound for stroke
    risk assessment, MRI brain, echocardiogram, liver MRI for iron quantification
  - **Preventive care orders:** Vaccination schedules, newborn screening
    follow-up, genetic counseling referrals
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core ServiceRequest
* status MS
* intent MS
* category MS
* code MS
* code ^short = "SCD referral, procedure, or order code (SNOMED CT, CPT, LOINC)"
* subject MS
* subject only Reference(SCDPatient)
* encounter MS
* encounter only Reference(SCDEncounter)
* occurrence[x] MS
* authoredOn MS
* requester MS
* requester only Reference(SCDPractitioner or SCDPractitionerRole)
* performer MS
* performer only Reference(SCDPractitioner or SCDPractitionerRole or SCDOrganization)
* reasonCode MS
* reasonReference MS
* reasonReference only Reference(SCDConditionEncounterDiagnosis or SCDConditionProblemsAndHealthConcerns)


// ==============================================================================
// SCDMedication
// ==============================================================================
// Extends: US Core Medication Profile
// Purpose: Represents medications used in SCD treatment.
//
// Key SCD medications:
//   - Disease-modifying: Hydroxyurea (Droxia, Siklos), L-glutamine (Endari),
//     Crizanlizumab (Adakveo), Voxelotor (Oxbryta/discontinued)
//   - Gene therapies: Exagamglogene autotemcel (Casgevy),
//     Lovotibeglogene autotemcel (Lyfgenia)
//   - Iron chelation: Deferasirox (Exjade, Jadenu), Deferoxamine (Desferal),
//     Deferiprone (Ferriprox)
//   - Prophylaxis: Penicillin V, amoxicillin (asplenia prophylaxis)
//   - Pain management: Acetaminophen, NSAIDs (with caution), opioids
//   - Anticoagulation: (if indicated for specific complications)
// ==============================================================================

Profile: SCDMedication
Parent: us-core-medication
Id: uscdi-scd-medication
Title: "USCDI-SCD Medication"
Description: """
  The USCDI-SCD Medication profile represents medications prescribed or
  administered to patients with Sickle Cell Disease. This profile extends the
  [US Core Medication Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-medication.html).

  SCD pharmacotherapy includes a spectrum of agents:

  **Disease-Modifying Therapies:**
  - Hydroxyurea (Droxia®, Siklos®) — increases fetal hemoglobin (HbF),
    reduces sickling frequency and VOC rate; first-line therapy for HbSS/HbS-Beta0
  - L-glutamine (Endari®) — reduces oxidative stress; FDA-approved for SCD ≥5y
  - Crizanlizumab (Adakveo®) — anti-P-selectin antibody; reduces VOC frequency
  - Voxelotor (Oxbryta®) — increases Hgb oxygen affinity (NOTE: withdrawn from
    US market September 2024; include for historical medication records)
  - Exagamglogene autotemcel (Casgevy®) — gene editing therapy (CTX001)
  - Lovotibeglogene autotemcel (Lyfgenia®) — gene addition therapy (bb1111)

  **Iron Chelation Therapy:**
  - Deferasirox (Exjade®, Jadenu®) — oral; for transfusional iron overload
  - Deferoxamine (Desferal®) — parenteral (subcutaneous/IV infusion)
  - Deferiprone (Ferriprox®) — oral; used in combination or intolerance

  **Prophylaxis:**
  - Penicillin V or amoxicillin — for asplenia-related infection prophylaxis
    (standard of care for children with SCD)

  All medications SHALL use RxNorm codes where available. NDC codes MAY be
  included as an additional coding for dispensed medications.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Medication
* code MS
* code ^short = "SCD medication code (RxNorm preferred)"
* code ^comment = """
  Use RxNorm clinical drug codes (ingredient + strength + form) where available.
  NDC codes MAY be provided as additional coding.
  TODO: Bind code to SCDMedicationVS (value set to be defined) with extensible
  binding to include SCD disease-modifying medications, iron chelation agents,
  and prophylactic antibiotics.
"""

// TODO: Add value set binding:
// * code from SCDMedicationVS (extensible)
