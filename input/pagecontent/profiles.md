### Profiles

This page describes the profiles defined in this Implementation Guide. Each heading links to the formal profile definition, which lists every element, its cardinality, Must Support flags and terminology bindings. For help reading a profile page, see [How to Read This Guide](introduction.html#how-to-read-this-guide).

All profiles except one extend a [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/) profile and inherit its requirements. The exception is the USCDI-SCD BiologicallyDerivedProduct profile, which is based directly on the FHIR R4 resource because US Core has no equivalent profile. Across the guide, references between resources are constrained to the USCDI-SCD profiles, so that a diagnosis, encounter or lab result always points to a USCDI-SCD Patient.

Both use cases require similar query and response patterns to obtain the clinical information needed. An initial query will be executed to locate the appropriate patient record(s) (this may result in multiple EHR systems being identified as containing relevant information). When the target EHR system(s) is/are identified, a task-based, SCD-focused query will be executed for retrieval of the SCD-relevant resources.

Example instances for each profile are listed on the [Examples](examples.html) page.

---

### Administrative and Demographic Profiles

These profiles identify the patient, providers, organizations and care locations involved in SCD care. Most add no constraints beyond US Core. They exist so that every other profile in this guide can reference a consistent USCDI-SCD version.

#### [USCDI-SCD Patient](StructureDefinition-uscdi-scd-patient.html)
Represents a person with, or at risk for, Sickle Cell Disease. It inherits US Core's race and ethnicity extensions, which are particularly important for SCD, where health equity reporting is a priority. Telecom and preferred language (`communication`) are Must Support, so that care teams can reach patients and their caregivers.

#### [USCDI-SCD Practitioner](StructureDefinition-uscdi-scd-practitioner.html)
Represents a provider involved in SCD care, such as a hematologist, emergency physician, primary care provider, pain specialist or transfusion medicine physician. It adds no constraints to US Core Practitioner.

#### [USCDI-SCD PractitionerRole](StructureDefinition-uscdi-scd-practitionerrole.html)
Represents a provider's role at a specific organization and location. SCD care teams often span specialties and organizations, including hematology, primary care, emergency medicine, social work, pain management and care coordination.

#### [USCDI-SCD Organization](StructureDefinition-uscdi-scd-organization.html)
Represents an organization providing SCD care, such as a comprehensive SCD treatment center, hematology practice, Federally Qualified Health Center or hospital. It adds no constraints to US Core Organization.

#### [USCDI-SCD Location](StructureDefinition-uscdi-scd-location.html)
Represents a place where SCD care is delivered, such as an emergency department, outpatient hematology clinic, day hospital or infusion center (for chronic transfusion), or inpatient unit. It adds no constraints to US Core Location.

---

### Encounter Profile

#### [USCDI-SCD Encounter](StructureDefinition-uscdi-scd-encounter.html)
Represents a visit, such as an emergency visit for a vaso-occlusive crisis, a scheduled transfusion, an outpatient hematology visit or an admission for stem cell transplantation. The encounter's diagnoses (`diagnosis.condition` and `diagnosis.use`) are Must Support, so the reason for the visit is clearly linked. The reason for the encounter can reference an SCD diagnosis, procedure or lab result.

---

### Clinical Condition Profiles

SCD diagnoses are split into two profiles, following the US Core pattern: one for the long-term problem list and one for diagnoses made during a specific visit.

#### [USCDI-SCD Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html)
Represents entries on the patient's problem list, most importantly the primary SCD diagnosis and genotype (for example HbSS, HbSC or HbS-β⁰-thalassemia), along with chronic complications. Who recorded and who asserted the condition, and the supporting evidence, are Must Support. The SCD genotype can be recorded with the [SCD Genotype](StructureDefinition-scd-genotype.html) extension, using codes from the [SCD Genotype Value Set](ValueSet-scd-genotype-vs.html).

#### [USCDI-SCD Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html)
Represents an acute diagnosis made during a visit, such as a vaso-occlusive crisis, acute chest syndrome, splenic sequestration or stroke. Clinical and verification status, onset, resolution (`abatement`) and evidence are Must Support. Codes for acute complications are listed in the [SCD Acute Complication Value Set](ValueSet-scd-acute-complication-vs.html).

---

### Medication Profiles

#### [USCDI-SCD Medication](StructureDefinition-uscdi-scd-medication.html)
Represents a medication used in SCD care, coded with RxNorm. This includes disease-modifying therapies (hydroxyurea, L-glutamine, crizanlizumab), gene therapies (exagamglogene autotemcel, lovotibeglogene autotemcel), iron chelation (deferasirox, deferoxamine, deferiprone) and infection prophylaxis (penicillin). Commonly used codes are listed in the [SCD Medication Value Set](ValueSet-scd-medication-vs.html).

#### [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html)
Represents a prescription or medication order, linking a medication to the patient, prescriber, dosage and reason. For iron chelation prescriptions, the [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) extension documents the indication and the ferritin or liver iron value that triggered therapy.

---

### Allergy and Intolerance Profile

#### [USCDI-SCD AllergyIntolerance](StructureDefinition-uscdi-scd-allergyintolerance.html)
Represents drug allergies, intolerances and adverse reactions, including transfusion reactions. These are especially important in SCD: NSAIDs can harm the kidneys, opioid reactions affect pain management, and patients who receive many transfusions are at risk of hemolytic and other transfusion reactions. Type, category, criticality, onset and reaction details are Must Support.

---

### Care Planning and Coordination Profiles

#### [USCDI-SCD CarePlan](StructureDefinition-uscdi-scd-careplan.html)
Represents a structured care plan, such as a chronic transfusion plan, a medication adherence plan, an individualized pain management plan or a transition-of-care plan. The plan's period, author, care team, goals, activities and the conditions it addresses are Must Support.

#### [USCDI-SCD ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html)
Represents a referral or order, such as a referral to hematology, pain management or a stem cell transplant program, or an order for a transfusion, lab test or imaging. Performer and reason are Must Support. A transfusion order is the link between the transfusion procedure and the blood product used (see below).

---

### Procedure Profile

#### [USCDI-SCD Procedure](StructureDefinition-uscdi-scd-procedure.html)
Represents procedures performed for SCD, including simple and exchange transfusions, stem cell transplantation, splenectomy, venous access port placement and monitoring procedures such as transcranial Doppler screening. Performer and reason are Must Support.

For transfusions, the procedure SHOULD reference the transfusion order in `basedOn`. The blood product(s) used reference the same order, which links the procedure to the specific products. FHIR R4 does not allow `Procedure.usedReference` to point to a BiologicallyDerivedProduct directly.

---

### Observation Profiles

#### [USCDI-SCD Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html)
Represents laboratory results used to monitor SCD, including:

- Complete blood count and reticulocyte count
- Hemoglobin fractionation (HbS %, HbF %, HbA2 %), used to guide hydroxyurea and transfusion therapy
- Hemolysis markers (LDH, bilirubin)
- Iron studies (ferritin), for iron overload monitoring
- Kidney and liver function
- Red cell antigen typing and antibody screening before transfusion

Reference ranges and components are Must Support, so that panels like hemoglobin fractionation can report each value. Common LOINC codes are listed in the [SCD Laboratory Panel Value Set](ValueSet-scd-laboratory-panel-vs.html).

#### [USCDI-SCD Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html)
Represents vital signs, with emphasis on measurements that matter most in SCD:

- Oxygen saturation (SpO2), which is critical for detecting acute chest syndrome
- Pain severity score (0–10), used to assess vaso-occlusive crises
- Blood pressure, temperature and respiratory rate, used to detect kidney, vascular and infectious complications

Codes are listed in the [SCD Vital Signs Value Set](ValueSet-scd-vital-signs-vs.html).

---

### Biologically Derived Product Profile

#### [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html)
Represents a blood product, such as packed red blood cells or hematopoietic progenitor cells for transplantation. This is the only profile in this guide with no US Core parent; it is based directly on the FHIR R4 BiologicallyDerivedProduct resource.

Transfusion is a cornerstone of SCD care, and people with SCD who receive transfusions are at high risk of developing antibodies to donor blood; ASH 2020 recommends Rh (C, E or C/c, E/e) and K antigen-matched blood. This profile records the product type, the order it fulfills (`request`), collection, processing steps (such as leukoreduction and antigen matching) and storage, all as Must Support. Two extensions add SCD-specific detail: [SCD Transfusion Red Cell Antigen Match Profile](StructureDefinition-scd-transfusion-antigen-match.html) and [SCD Blood Product Age at Transfusion](StructureDefinition-scd-blood-product-age.html).

The FHIR R4 version of this resource is limited. It has no direct link to the patient who received the product, and transfusion procedures cannot reference it directly. This guide links products to patients and procedures through the transfusion order (ServiceRequest). Later FHIR versions (R5 and later) improve this resource.
