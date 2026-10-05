// ==============================================================================
// USCDI-SCD FSH Example Instances
// File: input/fsh/instances/SCD_Examples.fsh
//
// Example FHIR instances demonstrating correct use of USCDI-SCD profiles.
// These examples are:
//   - Used for IG Publisher rendering and automated validation
//   - Intended to guide implementers
//   - Clinically realistic but entirely fictional (no real patient data)
//
// Clinical Scenario:
//   Maya Johnson is a 28-year-old woman with HbSS sickle cell disease
//   who presents to the emergency department with an uncomplicated
//   vaso-occlusive pain crisis, which is treated without transfusion
//   (NHLBI 2014: do not transfuse for uncomplicated VOC). She is followed
//   by Dr. Sarah Chen, a hematologist at Metro Sickle Cell Center.
//   Separately, Maya receives scheduled chronic red cell exchange
//   transfusions for secondary stroke prevention (history of ischemic
//   stroke in childhood), with a pre-transfusion HbS target of <30%.
//   She takes hydroxyurea and receives deferasirox for transfusional
//   iron overload.
//   TODO: hematologist to review the scenario for clinical realism.
// ==============================================================================


// ==============================================================================
// Example: Patient — Maya Johnson (fictional)
// ==============================================================================

Instance: maya-johnson-patient
InstanceOf: SCDPatient
Title: "Example Patient — Maya Johnson (SCD HbSS)"
Description: """
  Example SCDPatient instance for Maya Johnson, a fictional 28-year-old woman
  with HbSS sickle cell disease. Demonstrates required and Must Support elements
  including US Core race and ethnicity extensions.
"""
Usage: #example

* id = "maya-johnson-patient"
* meta.profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-patient"

// US Core race extension (required for health equity reporting in SCD)
* extension[us-core-race].extension[ombCategory].valueCoding = urn:oid:2.16.840.1.113883.6.238#2054-5 "Black or African American"
* extension[us-core-race].extension[text].valueString = "Black or African American"

// US Core ethnicity extension
* extension[us-core-ethnicity].extension[ombCategory].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[us-core-ethnicity].extension[text].valueString = "Not Hispanic or Latino"

* identifier[+].use = #usual
* identifier[=].type = $v2-0203#MR "Medical Record Number"
* identifier[=].system = "http://example.org/metro-scd-center/mrn"
* identifier[=].value = "SCD-2024-00142"

* active = true
* name[+].use = #official
* name[=].family = "Johnson"
* name[=].given[+] = "Maya"
* name[=].given[+] = "Renée"

* telecom[+].system = #phone
* telecom[=].value = "555-867-5309"
* telecom[=].use = #mobile

* telecom[+].system = #email
* telecom[=].value = "maya.johnson@example.com"

* gender = #female
* birthDate = "1996-04-15"

* address[+].use = #home
* address[=].line[+] = "2847 Maple Street"
* address[=].city = "Springfield"
* address[=].state = "IL"
* address[=].postalCode = "62701"
* address[=].country = "US"

* communication[+].language = urn:ietf:bcp:47#en "English"
* communication[=].preferred = true


// ==============================================================================
// Example: Practitioner — Dr. Sarah Chen (fictional)
// ==============================================================================

Instance: dr-sarah-chen-practitioner
InstanceOf: SCDPractitioner
Title: "Example Practitioner — Dr. Sarah Chen, Hematologist"
Description: "Example SCDPractitioner instance for Dr. Sarah Chen, a fictional hematologist."
Usage: #example

* id = "dr-sarah-chen-practitioner"
* identifier[NPI].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[NPI].value = "1234567893"
* name[+].family = "Chen"
* name[=].given[+] = "Sarah"
* name[=].prefix[+] = "Dr."
* name[=].suffix[+] = "MD"


// ==============================================================================
// Example: Organization — Metro Sickle Cell Center (fictional)
// ==============================================================================

Instance: metro-scd-center-org
InstanceOf: SCDOrganization
Title: "Example Organization — Metro Sickle Cell Center"
Description: "Example SCDOrganization for a fictional comprehensive SCD treatment center."
Usage: #example

* id = "metro-scd-center-org"
* identifier[+].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[=].value = "9876543213"
* active = true
* name = "Metro Sickle Cell Center"
* telecom[+].system = #phone
* telecom[=].value = "555-200-3000"
* address[+].line[+] = "1400 Medical Drive, Suite 500"
* address[=].city = "Springfield"
* address[=].state = "IL"
* address[=].postalCode = "62702"
* address[=].country = "US"


// ==============================================================================
// Example: Condition (Problem List) — HbSS Sickle Cell Disease
// ==============================================================================

Instance: maya-johnson-scd-diagnosis
InstanceOf: SCDConditionProblemsAndHealthConcerns
Title: "Example Condition — HbSS Sickle Cell Disease (Problem List)"
Description: """
  Example SCDConditionProblemsAndHealthConcerns instance representing Maya Johnson's
  primary HbSS sickle cell disease diagnosis on her active problem list.
  Demonstrates SCD genotype extension and dual coding (SNOMED CT + ICD-10-CM).
"""
Usage: #example

* id = "maya-johnson-scd-diagnosis"

// SCD Genotype Extension
* extension[scd-genotype].valueCodeableConcept = $sct#127040003 "Sickle cell-hemoglobin SS disease (disorder)"

// Problem list category (required by US Core)
* category[+] = $condition-category#problem-list-item "Problem List Item"

// Clinical status: active chronic condition
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#confirmed "Confirmed"

// Code — dual coding SNOMED CT + ICD-10-CM
* code.coding[+] = $sct#127040003 "Sickle cell-hemoglobin SS disease (disorder)"
* code.coding[+] = $icd10cm#D57.1 "Sickle-cell disease without crisis"
* code.text = "Sickle cell disease, HbSS"

* subject = Reference(maya-johnson-patient)
* onsetString = "Diagnosed by newborn screening, April 1996"
* recordedDate = "2010-03-15"

// VOC frequency extension: episodes counted over the 12 months before the ED visit
* extension[scd-voc-frequency].extension[episodeCount].valueInteger = 3
* extension[scd-voc-frequency].extension[observationPeriod].valuePeriod.start = "2023-11-14"
* extension[scd-voc-frequency].extension[observationPeriod].valuePeriod.end = "2024-11-14"
* extension[scd-voc-frequency].extension[measurementMethod].valueCodeableConcept.text = "Chart review of ED visits and hospitalizations"

// Newborn screen reference extension (referenced by description only in this example)
* extension[scd-newborn-screen-reference].valueReference.display = "State newborn screening result, April 1996"


// ==============================================================================
// Example: Condition (Encounter Diagnosis) — Vaso-Occlusive Crisis
// ==============================================================================

Instance: maya-johnson-voc-encounter-dx
InstanceOf: SCDConditionEncounterDiagnosis
Title: "Example Condition — Acute Vaso-Occlusive Crisis (Encounter Diagnosis)"
Description: """
  Example SCDConditionEncounterDiagnosis for an acute vaso-occlusive pain crisis
  documented during Maya Johnson's emergency department visit.
"""
Usage: #example

* id = "maya-johnson-voc-encounter-dx"
* category[us-core] = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#confirmed "Confirmed"

* code.coding[+] = $sct#769167005 "Vaso-occlusive pain episode in sickle cell disease"
* code.coding[+] = $icd10cm#D57.00 "Hb-SS disease with crisis, unspecified"
* code.text = "Vaso-occlusive crisis (sickle cell pain crisis)"

* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* recordedDate = "2024-11-14"


// ==============================================================================
// Example: Encounter — Emergency Department Visit for VOC
// ==============================================================================

Instance: maya-johnson-ed-encounter
InstanceOf: SCDEncounter
Title: "Example Encounter — ED Visit for Vaso-Occlusive Crisis"
Description: """
  Example SCDEncounter for Maya Johnson's emergency department visit for
  a vaso-occlusive pain crisis. Demonstrates required elements including
  class, type, participant, period, and reason reference.
"""
Usage: #example

* id = "maya-johnson-ed-encounter"
* status = #finished
* class = $v3-ActCode#EMER "emergency"
* type[+].coding[+] = $sct#50849002 "Emergency room admission (procedure)"
* type[=].text = "Emergency department visit"
* subject = Reference(maya-johnson-patient)
* participant[+].type[+].coding[+] = $v3-ParticipationType#ATND "attender"
* participant[=].individual = Reference(dr-sarah-chen-practitioner)
* period.start = "2024-11-14T02:30:00-06:00"
* period.end = "2024-11-14T10:15:00-06:00"
* reasonCode[+].coding[+] = $sct#769167005 "Vaso-occlusive pain episode in sickle cell disease"
* reasonCode[=].text = "Acute pain crisis — vaso-occlusive"
* diagnosis[+].condition = Reference(maya-johnson-voc-encounter-dx)
* diagnosis[=].use.coding[+] = $diagnosis-role#AD "Admission diagnosis"
* serviceProvider = Reference(metro-scd-center-org)


// ==============================================================================
// Example: Observation (Lab) — Hemoglobin Fractionation
// ==============================================================================

Instance: maya-johnson-hgb-fractionation
InstanceOf: SCDObservationLaboratoryResult
Title: "Example Lab Result — Hemoglobin Fractionation (Pre-Transfusion)"
Description: """
  Example SCDObservationLaboratoryResult representing the hemoglobin
  fractionation drawn before one of Maya Johnson's scheduled chronic exchange
  transfusions. The pre-transfusion HbS of 32% is slightly above her chronic
  transfusion target of <30% for secondary stroke prevention. Most of her
  hemoglobin A comes from previously transfused donor red cells.
"""
Usage: #example

* id = "maya-johnson-hgb-fractionation"
* status = #final
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[+] = $scd-observation-category#hemoglobin-fractionation "Hemoglobin Fractionation"

// Panel code
* code.coding[+] = $loinc#12710-0 "Hemoglobin pattern [Interpretation] in Blood"
* code.text = "Hemoglobin Fractionation by HPLC"

* subject = Reference(maya-johnson-patient)
* effectiveDateTime = "2024-11-21T07:30:00-06:00"
* performer[+] = Reference(metro-scd-center-org)
* issued = "2024-11-21T08:30:00-06:00"

// Overall interpretation
* valueString = "Transfused pattern (pre-transfusion sample): HbS 32%, HbA 61%, HbF 4%, HbA2 3%"
* interpretation[+].coding[+] = $v3-ObservationInterpretation#H "High"
* interpretation[=].text = "Pre-transfusion HbS% slightly above chronic transfusion target (<30%)"

// HbS %
* component[+].code = $loinc#4625-0 "Hemoglobin S/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 32
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%
* component[=].referenceRange[+].text = "Chronic transfusion target: pre-transfusion HbS <30%"

// HbA %
* component[+].code = $loinc#4546-8 "Hemoglobin A/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 61
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%

// HbF %
* component[+].code = $loinc#4576-5 "Hemoglobin F/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 4
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%

// HbA2 %
* component[+].code = $loinc#4551-8 "Hemoglobin A2/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 3
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%


// ==============================================================================
// Example: Observation (Vital Sign) — Oxygen Saturation
// ==============================================================================

Instance: maya-johnson-spo2
InstanceOf: SCDObservationVitalSigns
Title: "Example Vital Sign — Oxygen Saturation (SpO2) on ED Arrival"
Description: """
  Example SCDObservationVitalSigns for oxygen saturation (SpO2) measured by
  pulse oximetry on ED arrival. SpO2 of 91% — below baseline, raising concern
  for early acute chest syndrome.
"""
Usage: #example

* id = "maya-johnson-spo2"
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* code.coding[+] = $loinc#2708-6 "Oxygen saturation in Arterial blood"
* code.coding[+] = $loinc#59408-5 "Oxygen saturation in Arterial blood by Pulse oximetry"
* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* effectiveDateTime = "2024-11-14T02:45:00-06:00"
* performer[+] = Reference(metro-scd-center-org)
* valueQuantity.value = 91
* valueQuantity.unit = "%"
* valueQuantity.system = $ucum
* valueQuantity.code = #%
* interpretation[+].coding[+] = $v3-ObservationInterpretation#L "Low"
* interpretation[=].text = "Below patient baseline (~96%). Monitor for ACS."
* referenceRange[+].low.value = 95
* referenceRange[=].low.unit = "%"
* referenceRange[=].text = "Patient's documented baseline SpO2: 95-97%"


// ==============================================================================
// Example: Observation (Vital Sign) — Pain Score
// ==============================================================================

Instance: maya-johnson-pain-score
InstanceOf: SCDObservationVitalSigns
Title: "Example Vital Sign — Pain Severity Score (NRS) on ED Arrival"
Description: """
  Example SCDObservationVitalSigns for pain severity on a 0-10 Numeric Rating
  Scale (NRS), reported by Maya Johnson on ED arrival during vaso-occlusive crisis.
"""
Usage: #example

* id = "maya-johnson-pain-score"
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* category[+] = $scd-observation-category#scd-pain-assessment "SCD Pain Assessment"
* code = $loinc#38208-5 "Pain severity - Reported"
* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* effectiveDateTime = "2024-11-14T02:45:00-06:00"
* performer[+] = Reference(metro-scd-center-org)
* valueInteger = 9
* interpretation[+].coding[+] = $v3-ObservationInterpretation#H "High"
* interpretation[=].text = "Severe pain — 9/10 NRS. IV opioid analgesia initiated."
* referenceRange[+].high.value = 3
* referenceRange[=].high.unit = "{score}"
* referenceRange[=].text = "Mild: 1-3; Moderate: 4-6; Severe: 7-10"


// ==============================================================================
// Example: Medication — Hydroxyurea
// ==============================================================================

Instance: hydroxyurea-medication-example
InstanceOf: SCDMedication
Title: "Example Medication — Hydroxyurea (Siklos)"
Description: "Example SCDMedication for hydroxyurea, a first-line disease-modifying therapy for HbSS SCD."
Usage: #example

* id = "hydroxyurea-medication-example"
* code.coding[+] = $rxnorm#5552 "hydroxyurea"
* code.coding[+].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[=].code = #1999316
* code.coding[=].display = "hydroxyurea 1000 MG Oral Tablet [Siklos]"
* code.text = "Hydroxyurea 1000 mg oral tablet (Siklos)"
* form.coding[+] = $sct#421026006 "Oral tablet"

// ==============================================================================
// Example: Procedure — Automated Red Cell Exchange Transfusion
// ==============================================================================

Instance: maya-johnson-exchange-transfusion
InstanceOf: SCDProcedure
Title: "Example Procedure — Automated Red Cell Exchange Transfusion"
Description: """
  Example SCDProcedure for a scheduled automated red cell exchange transfusion
  (erythrocytapheresis) performed on Maya Johnson as part of chronic
  transfusion therapy for secondary stroke prevention. Links to the
  BiologicallyDerivedProduct through the shared ServiceRequest.
"""
Usage: #example

* id = "maya-johnson-exchange-transfusion"
* status = #completed
* code.coding[+] = $sct#438839005 "Erythrocytapheresis"
* code.coding[+] = $cpt#36512 "Therapeutic apheresis; for red blood cells"
* code.text = "Automated red cell exchange transfusion (erythrocytapheresis)"
* subject = Reference(maya-johnson-patient)
* performedDateTime = "2024-11-21T09:00:00-06:00"
* performer[+].actor = Reference(dr-sarah-chen-practitioner)
* reasonCode[+].text = "Chronic transfusion therapy for secondary stroke prevention (history of ischemic stroke); pre-transfusion HbS 32%"
* reasonReference[+] = Reference(maya-johnson-scd-diagnosis)

// Link to the blood product: Procedure.basedOn -> ServiceRequest <- BiologicallyDerivedProduct.request
// (R4 Procedure.usedReference does not allow BiologicallyDerivedProduct)
* basedOn[+] = Reference(exchange-transfusion-order-example)

// ==============================================================================
// Example: BiologicallyDerivedProduct — Antigen-Matched pRBCs
// ==============================================================================

Instance: prbcs-antigen-matched-example
InstanceOf: SCDBiologicallyDerivedProduct
Title: "Example BiologicallyDerivedProduct — Antigen-Matched pRBCs"
Description: """
  Example SCDBiologicallyDerivedProduct representing Rh (C, E) and K
  antigen-matched, leukoreduced, HbS-negative packed red blood cells used in
  Maya Johnson's scheduled exchange transfusion. Demonstrates the antigen match
  extension and processing documentation.
"""
Usage: #example

* id = "prbcs-antigen-matched-example"

// Antigen match extension (ASH 2020 recommends prophylactic Rh (C, E or C/c, E/e) and K matching)
* extension[scd-transfusion-antigen-match].extension[matchedAntigen][+].valueCodeableConcept = $sct#84538003 "Blood group antigen C"
* extension[scd-transfusion-antigen-match].extension[matchedAntigen][+].valueCodeableConcept = $sct#36744004 "Blood group antigen E"
* extension[scd-transfusion-antigen-match].extension[matchedAntigen][+].valueCodeableConcept = $sct#90290005 "K antigen (Kell1) (substance)"  // TODO: code not found in SNOMED CT US Edition; terminologist to supply correct code
* extension[scd-transfusion-antigen-match].extension[matchingProtocol].valueString = "Prophylactic Rh (C, E) and K antigen matching (ASH 2020 transfusion guideline)"

// Blood product age extension (5 days from collection to transfusion)
* extension[scd-blood-product-age].valueQuantity.value = 5
* extension[scd-blood-product-age].valueQuantity.unit = "days"
* extension[scd-blood-product-age].valueQuantity.system = $ucum
* extension[scd-blood-product-age].valueQuantity.code = #d

* productCategory = #cells
* productCode.coding[+] = $sct#431069006 "Packed red blood cells"
* productCode.coding[+] = $scd-blood-product-processing#sickle-cell-negative "Sickle Cell Trait Negative (HbS Negative)"
* productCode.text = "Packed RBCs — leukoreduced, Rh (C, E) and K antigen-matched, HbS-negative"

* status = #available

// Link back to transfusion order
* request[+] = Reference(exchange-transfusion-order-example)

// Collection details
* collection.collectedDateTime = "2024-11-16T00:00:00-06:00"

// Processing steps
* processing[+].description = "Leukoreduction by filtration"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#leukoreduced "Leukoreduced"
* processing[=].timeDateTime = "2024-11-16T02:00:00-06:00"

* processing[+].description = "Antigen-negative unit selection: C-neg, E-neg, K-neg; HbS-negative unit confirmed"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#antigen-matched-C-neg "C Antigen Negative (Rh system)"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#antigen-matched-E-neg "E Antigen Negative (Rh system)"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#antigen-matched-K-neg "K Antigen Negative (Kell system)"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#sickle-cell-negative "Sickle Cell Trait Negative (HbS Negative)"

// Storage
* storage[+].duration.start = "2024-11-16T03:00:00-06:00"
* storage[=].duration.end = "2024-11-21T09:00:00-06:00"


// ==============================================================================
// Example: ServiceRequest — Exchange Transfusion Order
// ==============================================================================

Instance: exchange-transfusion-order-example
InstanceOf: SCDServiceRequest
Title: "Example ServiceRequest — Exchange Transfusion Order"
Description: "Example SCDServiceRequest for a scheduled automated red cell exchange transfusion order, part of Maya Johnson's chronic transfusion therapy for secondary stroke prevention."
Usage: #example

* id = "exchange-transfusion-order-example"
* status = #completed
* intent = #order
* code.coding[+] = $sct#438839005 "Erythrocytapheresis"
* code.text = "Automated red cell exchange transfusion with Rh (C, E) and K antigen-matched, HbS-negative, leukoreduced pRBCs. Chronic transfusion goal: pre-transfusion HbS <30%."
* subject = Reference(maya-johnson-patient)
* occurrenceDateTime = "2024-11-21T09:00:00-06:00"
* authoredOn = "2024-11-18T10:00:00-06:00"
* requester = Reference(dr-sarah-chen-practitioner)
* reasonReference[+] = Reference(maya-johnson-scd-diagnosis)


// ==============================================================================
// Example: AllergyIntolerance — NSAID Hypersensitivity
// ==============================================================================

Instance: maya-johnson-nsaid-allergy
InstanceOf: SCDAllergyIntolerance
Title: "Example AllergyIntolerance — NSAID Hypersensitivity"
Description: """
  Example SCDAllergyIntolerance documenting Maya Johnson's documented
  intolerance to NSAIDs (ibuprofen), relevant for SCD pain management.
"""
Usage: #example

* id = "maya-johnson-nsaid-allergy"
* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* type = #intolerance
* category[+] = #medication
* criticality = #high
* code.coding[+] = $rxnorm#5640 "ibuprofen"
* code.text = "Ibuprofen (NSAID) — renal toxicity risk; avoid in SCD"
* patient = Reference(maya-johnson-patient)
* onsetString = "2018"
* reaction[+].substance.coding[+] = $rxnorm#5640 "ibuprofen"
* reaction[=].manifestation[+].coding[+] = $sct#14669001 "Acute kidney injury"
* reaction[=].manifestation[=].text = "Acute kidney injury with NSAID use"
* reaction[=].severity = #severe

// ==============================================================================
// Example: MedicationRequest — Hydroxyurea (disease-modifying therapy)
// ==============================================================================

Instance: maya-johnson-hydroxyurea-request
InstanceOf: SCDMedicationRequest
Title: "Example MedicationRequest — Hydroxyurea Prescription"
Description: """
  Example SCDMedicationRequest for Maya Johnson's ongoing hydroxyurea
  prescription, her first-line disease-modifying therapy for HbSS SCD.
"""
Usage: #example

* id = "maya-johnson-hydroxyurea-request"
* status = #active
* intent = #order
* medicationReference = Reference(hydroxyurea-medication-example)
* subject = Reference(maya-johnson-patient)
* authoredOn = "2024-06-03"
* requester = Reference(dr-sarah-chen-practitioner)
* reasonReference[+] = Reference(maya-johnson-scd-diagnosis)
* dosageInstruction[+].text = "Take 1000 mg (one tablet) by mouth once daily"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].route = $sct#26643006 "Oral route"
* dosageInstruction[=].doseAndRate[+].doseQuantity = 1000 'mg' "mg"


// ==============================================================================
// Example: MedicationRequest — Deferasirox (iron chelation)
// ==============================================================================

Instance: maya-johnson-deferasirox-request
InstanceOf: SCDMedicationRequest
Title: "Example MedicationRequest — Deferasirox Iron Chelation"
Description: """
  Example SCDMedicationRequest for Maya Johnson's deferasirox prescription for
  transfusional iron overload from chronic exchange transfusions. Demonstrates
  the SCD Iron Chelation Indication extension.
"""
Usage: #example

* id = "maya-johnson-deferasirox-request"

// Iron chelation indication extension
* extension[scd-iron-chelation-indication].extension[indicationCode].valueCodeableConcept = $sct#69281008 "Transfusion hemosiderosis"
* extension[scd-iron-chelation-indication].extension[triggerMeasurement].valueCodeableConcept = $loinc#2276-4 "Ferritin [Mass/volume] in Serum or Plasma"
* extension[scd-iron-chelation-indication].extension[triggerValue].valueQuantity = 1850 'ng/mL' "ng/mL"

* status = #active
* intent = #order
* medicationCodeableConcept = $rxnorm#1607792 "deferasirox 360 MG Oral Tablet"
* subject = Reference(maya-johnson-patient)
* authoredOn = "2023-09-12"
* requester = Reference(dr-sarah-chen-practitioner)
* reasonCode[+] = $sct#69281008 "Transfusion hemosiderosis"
* dosageInstruction[+].text = "Take 1080 mg (three 360 mg tablets) by mouth once daily"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].route = $sct#26643006 "Oral route"
* dosageInstruction[=].doseAndRate[+].doseQuantity = 1080 'mg' "mg"

// ==============================================================================
// Example: PractitionerRole — Dr. Sarah Chen at Metro Sickle Cell Center
// ==============================================================================

Instance: dr-sarah-chen-hematology-role
InstanceOf: SCDPractitionerRole
Title: "Example PractitionerRole — Dr. Sarah Chen, Hematologist at Metro Sickle Cell Center"
Description: "Example SCDPractitionerRole linking Dr. Sarah Chen to Metro Sickle Cell Center as a hematologist."
Usage: #example

* id = "dr-sarah-chen-hematology-role"
* active = true
* practitioner = Reference(dr-sarah-chen-practitioner)
* organization = Reference(metro-scd-center-org)
* location[+] = Reference(metro-scd-center-hematology-clinic)
* specialty[+] = $nucc#207RH0000X "Hematology (Internal Medicine) Physician"
* telecom[+].system = #phone
* telecom[=].value = "555-200-3000"
* telecom[=].use = #work


// ==============================================================================
// Example: Location — Metro Sickle Cell Center Hematology Clinic
// ==============================================================================

Instance: metro-scd-center-hematology-clinic
InstanceOf: SCDLocation
Title: "Example Location — Metro Sickle Cell Center Hematology Clinic"
Description: "Example SCDLocation for the outpatient hematology clinic at Metro Sickle Cell Center, where Maya Johnson receives her scheduled exchange transfusions."
Usage: #example

* id = "metro-scd-center-hematology-clinic"
* status = #active
* name = "Metro Sickle Cell Center Hematology Clinic"
* type[+] = $v3-RoleCode#HEM "Hematology clinic"
* telecom[+].system = #phone
* telecom[=].value = "555-200-3000"
* address.line[+] = "1400 Medical Drive, Suite 500"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62702"
* address.country = "US"
* managingOrganization = Reference(metro-scd-center-org)


// ==============================================================================
// Example: CarePlan — Chronic Transfusion Therapy Plan
// ==============================================================================

Instance: maya-johnson-chronic-transfusion-plan
InstanceOf: SCDCarePlan
Title: "Example CarePlan — Chronic Transfusion Therapy for Secondary Stroke Prevention"
Description: """
  Example SCDCarePlan for Maya Johnson's chronic transfusion therapy for
  secondary stroke prevention, with scheduled automated red cell exchange
  transfusions and iron overload monitoring.
"""
Usage: #example

* id = "maya-johnson-chronic-transfusion-plan"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Chronic transfusion therapy for secondary stroke prevention: scheduled automated red cell exchange transfusion every 4 to 6 weeks, with a goal of pre-transfusion HbS below 30%. Rh (C, E) and K antigen-matched, HbS-negative, leukoreduced red cells. Monitor ferritin for transfusional iron overload.</p></div>"
* status = #active
* intent = #plan
* category[AssessPlan] = http://hl7.org/fhir/us/core/CodeSystem/careplan-category#assess-plan "Assessment and Plan of Treatment"
* title = "Chronic transfusion therapy plan"
* subject = Reference(maya-johnson-patient)
* period.start = "2004-06-01"
* author = Reference(dr-sarah-chen-practitioner)
* addresses[+] = Reference(maya-johnson-scd-diagnosis)

* activity[+].reference = Reference(exchange-transfusion-order-example)

* activity[+].detail.status = #in-progress
* activity[=].detail.description = "Automated red cell exchange transfusion every 4 to 6 weeks; goal pre-transfusion HbS below 30%"

* activity[+].detail.status = #in-progress
* activity[=].detail.description = "Monitor serum ferritin and liver iron concentration for transfusional iron overload"
