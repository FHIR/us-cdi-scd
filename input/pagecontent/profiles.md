{%- comment -%}
PROFILES PAGE — profiles.md
CONTENT TO INSERT: Narrative intro, profile groupings, notes on BiologicallyDerivedProduct
{%- endcomment -%}
Both use cases require similar query and response patterns to obtain the clinical information needed. An initial query will be executed to locate the appropriate patient record(s) (this may result in multiple eHR systems being identified as containing relevant information). When the target EHR system(s) is/are identified, a task-based, SCD-focused query will be executed for retrieval of the SCD-relevant resources.
### Profiles

This page provides a narrative description of the profiles defined in this
Implementation Guide. The formal profile definitions (StructureDefinitions)
are generated from FSH source and linked below.

<!-- TODO: Insert a 1–2 paragraph introduction explaining that all profiles
     in this IG either extend US Core profiles or (in the case of
     BiologicallyDerivedProduct) define a new profile on the base FHIR
     resource where no US Core profile exists. -->

---

### Administrative / Demographic Profiles

These profiles support the identification of patients, providers, organizations,
and care locations involved in SCD care delivery.

<!-- TODO: For each profile below, insert a 2–4 sentence narrative explaining:
       - Clinical rationale (why this profile is needed for SCD)
       - Key constraints or extensions added beyond the US Core parent
       - Any SCD-specific value set bindings
-->

#### [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html)
<!-- TODO: Narrative for Patient profile. Note any SCD-specific demographic
     extensions (e.g., race, ethnicity required for health equity reporting). -->

#### [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html)
<!-- TODO: Narrative. Note relevance of hematologist specialty coding. -->

#### [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html)
<!-- TODO: Narrative. Note care team roles in SCD (hematologist, social worker,
     pain specialist, care coordinator, pharmacist). -->

#### [USCDI-SCD Organization](StructureDefinition-uscdi-scd-organization.html)
<!-- TODO: Narrative. Note SCD treatment centers, federally qualified health
     centers (FQHCs), and specialty centers. -->

#### [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html)
<!-- TODO: Narrative. Note relevance of infusion center, day hospital, and
     emergency department location types. -->

---

### Encounter Profile

#### [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html)
<!-- TODO: Narrative. Explain SCD-specific encounter types (ED visit for VOC,
     scheduled transfusion, hematology outpatient, HSCT admission). Note
     how encounter links to conditions, procedures, and observations. -->

---

### Clinical Condition Profiles

#### [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html)
<!-- TODO: Narrative. Explain how this captures acute diagnoses during an
     encounter (VOC, ACS, splenic sequestration, stroke). Note value set
     binding to SCD acute complication codes. -->

#### [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html)
<!-- TODO: Narrative. Explain how this captures the chronic SCD problem list
     (SCD genotype, chronic organ damage, psychosocial concerns). Note
     the SCD genotype value set and chronic complication codes. -->

---

### Medication Profiles

#### [USCDI-SCD Medication](StructureDefinition-uscdi-scd-medication.html)
<!-- TODO: Narrative. Note SCD-specific medications: hydroxyurea, L-glutamine,
     crizanlizumab, voxelotor, exagamglogene autotemcel, lovotibeglogene
     autotemcel, deferasirox (iron chelation), penicillin prophylaxis. -->

---

### Allergy and Intolerance Profile

#### [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html)
<!-- TODO: Narrative. Note relevance of drug allergies (NSAIDs, opioids,
     penicillin) and transfusion reactions (hemolytic, febrile, allergic)
     in SCD patients. -->

---

### Care Planning and Coordination Profiles

#### [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html)
<!-- TODO: Narrative. Explain use for SCD disease management plans including
     transfusion schedules, medication adherence, pain management plans,
     and transition-of-care plans. -->

#### [USCDI-SCD ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html)
<!-- TODO: Narrative. Note use for referrals (hematology, pain management,
     social work) and orders (transfusion, labs, imaging). -->

---

### Procedure Profile

#### [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html)
<!-- TODO: Narrative. Note SCD-specific procedures: simple transfusion,
     automated exchange transfusion (erythrocytapheresis), phlebotomy,
     bone marrow/stem cell transplantation, port placement, hydroxyurea
     dose escalation. Note the link to BiologicallyDerivedProduct. -->

---

### Observation Profiles

#### [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html)
<!-- TODO: Narrative. Note SCD-relevant lab tests:
       - CBC with differential (Hgb, Hct, MCV, WBC, platelets, retic count)
       - Hemoglobin fractionation / electrophoresis (HbS %, HbF %)
       - LDH, bilirubin (hemolysis markers)
       - Ferritin, iron studies (iron overload monitoring)
       - Serum creatinine, urine albumin (renal function)
       - Tricuspid regurgitant velocity / NT-proBNP (pulmonary HTN screening)
       - Red cell antigen phenotype (pre-transfusion)
       - Newborn screening results
-->

#### [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html)
<!-- TODO: Narrative. Note relevance of:
       - Oxygen saturation (SpO2) — critical for ACS monitoring
       - Pain severity score (LOINC 38208-5) — VOC severity
       - Blood pressure — renal/vascular complications
       - Temperature — infection/fever detection
       - Respiratory rate — ACS monitoring
-->

---

### Biologically Derived Product Profile

#### [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html)
<!-- TODO: Narrative. This profile is unique in this IG as it has no US Core
     parent — it profiles the base FHIR 4.0.1 BiologicallyDerivedProduct
     resource. Explain:
       - What BiologicallyDerivedProduct represents in FHIR
       - SCD-specific use: pRBCs, apheresis RBCs, HPC (for HSCT)
       - Key elements: productCode, collection, processing, storage, request
       - Importance of extended antigen matching metadata
       - How it links to Procedure (the transfusion) and Patient
       - Limitations of the R4 resource vs FHIR R5 improvements
-->
