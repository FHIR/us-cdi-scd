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
//   who presents to the emergency department with a vaso-occlusive pain
//   crisis. She is followed by Dr. Sarah Chen, a hematologist at
//   Metro Sickle Cell Center. Maya is on hydroxyurea and receives
//   chronic exchange transfusions every 4–6 weeks for stroke prevention
//   (history of TIA). She is on deferasirox for iron overload.
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
* identifier[NPI].value = "1234567890"
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
* identifier[=].value = "9876543210"
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
* code.coding[+] = $icd10cm#D57.1 "Sickle-cell disease without crisis, Hb-SS"
* code.text = "Sickle cell disease, HbSS"

* subject = Reference(maya-johnson-patient)
* onsetString = "Diagnosed by newborn screening, April 1996"
* recordedDate = "2010-03-15"


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
* category[+].coding[+] = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#confirmed "Confirmed"

* code.coding[+] = $sct#30925003 "Sickle cell crisis (disorder)"
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
* participant[+].type[+].coding[+] = $v3-RoleCode#ATND "Attending"
* participant[=].individual = Reference(dr-sarah-chen-practitioner)
* period.start = "2024-11-14T02:30:00-06:00"
* period.end = "2024-11-14T10:15:00-06:00"
* reasonCode[+].coding[+] = $sct#30925003 "Sickle cell crisis (disorder)"
* reasonCode[=].text = "Acute pain crisis — vaso-occlusive"
* diagnosis[+].condition = Reference(maya-johnson-voc-encounter-dx)
* diagnosis[=].use.coding[+] = $v2-0131#AD "Admitting Diagnosis"
* serviceProvider = Reference(metro-scd-center-org)


// ==============================================================================
// Example: Observation (Lab) — Hemoglobin Fractionation
// ==============================================================================

Instance: maya-johnson-hgb-fractionation
InstanceOf: SCDObservationLaboratoryResult
Title: "Example Lab Result — Hemoglobin Fractionation (Pre-Transfusion)"
Description: """
  Example SCDObservationLaboratoryResult representing a pre-exchange transfusion
  hemoglobin fractionation panel for Maya Johnson. Shows HbS% = 58% (above the
  <30% target), triggering the exchange transfusion procedure.
"""
Usage: #example

* id = "maya-johnson-hgb-fractionation"
* status = #final
* category[+] = $observation-category#laboratory "Laboratory"
* category[+] = $scd-observation-category#hemoglobin-fractionation "Hemoglobin Fractionation"

// Panel code
* code.coding[+] = $loinc#32682-8 "Hemoglobin pattern [Interpretation] in Blood"
* code.text = "Hemoglobin Fractionation by HPLC"

* subject = Reference(maya-johnson-patient)
* effectiveDateTime = "2024-11-14T04:00:00-06:00"
* issued = "2024-11-14T05:30:00-06:00"

// Overall interpretation
* valueString = "HbSS pattern: HbS 58%, HbF 18%, HbA2 3.2%"
* interpretation[+].coding[+] = $v3-ObservationInterpretation#H "High"
* interpretation[=].text = "HbS% above target (<30%); exchange transfusion indicated"

// HbS %
* component[+].code = $loinc#4625-4 "Hemoglobin S/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 58
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%
* component[=].referenceRange[+].text = "Target <30% (pre-exchange)"

// HbF %
* component[+].code = $loinc#4576-9 "Hemoglobin F/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 18
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%
* component[=].referenceRange[+].text = "Target >15–20% on hydroxyurea"

// HbA2 %
* component[+].code = $loinc#4551-8 "Hemoglobin A2/Hemoglobin.total in Blood"
* component[=].valueQuantity.value = 3.2
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
* category[+] = $observation-category#vital-signs "Vital Signs"
* code = $loinc#59408-5 "Oxygen saturation in Arterial blood by Pulse oximetry"
* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* effectiveDateTime = "2024-11-14T02:45:00-06:00"
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
* category[+] = $observation-category#vital-signs "Vital Signs"
* category[+] = $scd-observation-category#scd-pain-assessment "SCD Pain Assessment"
* code = $loinc#38208-5 "Pain severity - 0-10 verbal numeric rating [NRS]"
* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* effectiveDateTime = "2024-11-14T02:45:00-06:00"
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
* code.coding[+] = $rxnorm#202462 "hydroxyurea"
* code.coding[+].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* code.coding[=].code = #1876366
* code.coding[=].display = "hydroxyurea 1000 MG Oral Tablet [Siklos]"
* code.text = "Hydroxyurea 1000 mg oral tablet (Siklos)"
* form.coding[+] = $sct#421026006 "Oral tablet (dose form)"


// ==============================================================================
// Example: Procedure — Automated Red Cell Exchange Transfusion
// ==============================================================================
/*
Instance: maya-johnson-exchange-transfusion
InstanceOf: SCDProcedure
Title: "Example Procedure — Automated Red Cell Exchange Transfusion"
Description: """
  Example SCDProcedure for an automated red cell exchange transfusion
  (erythrocytapheresis) performed on Maya Johnson. Demonstrates link to
  BiologicallyDerivedProduct and the transfusion indication.
"""
Usage: #example

* id = "maya-johnson-exchange-transfusion"
* status = #completed
* code.coding[+] = $sct#71493000 "Automated red blood cell exchange (procedure)"
* code.coding[+] = $cpt#36516 "Therapeutic apheresis; with extracorporeal immunoadsorption and reinfusion of plasma"
* code.text = "Automated red cell exchange transfusion (erythrocytapheresis)"
* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* performedDateTime = "2024-11-14T06:00:00-06:00"
* performer[+].actor = Reference(dr-sarah-chen-practitioner)
* reasonCode[+].coding[+] = $sct#30925003 "Sickle cell crisis (disorder)"
* reasonCode[=].text = "Acute VOC with HbS% 58%; exchange transfusion to reduce HbS <30%"
* reasonReference[+] = Reference(maya-johnson-voc-encounter-dx)

// Link to blood product used
* usedReference[+] = Reference(prbcs-antigen-matched-example)
*/

// ==============================================================================
// Example: BiologicallyDerivedProduct — Antigen-Matched pRBCs
// ==============================================================================

Instance: prbcs-antigen-matched-example
InstanceOf: SCDBiologicallyDerivedProduct
Title: "Example BiologicallyDerivedProduct — Antigen-Matched pRBCs"
Description: """
  Example SCDBiologicallyDerivedProduct representing extended antigen-matched,
  leukoreduced, sickle-cell-negative packed red blood cells used in Maya
  Johnson's exchange transfusion. Demonstrates antigen match extension and
  processing documentation.
"""
Usage: #example

* id = "prbcs-antigen-matched-example"

// Antigen match extension
* extension[scd-transfusion-antigen-match].extension[matchedAntigen][+].valueCodeableConcept = $sct#16951006 "C antigen (Rh2) (substance)"
* extension[scd-transfusion-antigen-match].extension[matchedAntigen][+].valueCodeableConcept = $sct#73817003 "E antigen (Rh3) (substance)"
* extension[scd-transfusion-antigen-match].extension[matchedAntigen][+].valueCodeableConcept = $sct#90290005 "K antigen (Kell1) (substance)"
* extension[scd-transfusion-antigen-match].extension[matchingProtocol].valueString = "Extended CcEeK + Fya + Jkb antigen matching per institutional SCD transfusion protocol"

// Blood product age extension (5 days old — within fresh blood preference)
* extension[scd-blood-product-age].valueQuantity.value = 5
* extension[scd-blood-product-age].valueQuantity.unit = "days"
* extension[scd-blood-product-age].valueQuantity.system = $ucum
* extension[scd-blood-product-age].valueQuantity.code = #d

* productCategory = #cells
* productCode.coding[+] = $sct#3360007 "Packed red blood cells (product)"
* productCode.coding[+] = $scd-blood-product-processing#sickle-cell-negative "Sickle Cell Trait Negative (HbS Negative)"
* productCode.text = "Packed RBCs — leukoreduced, irradiated, antigen-matched, HbS-negative"

* status = #available

// Link back to transfusion order
* request[+] = Reference(exchange-transfusion-order-example)

// Collection details
* collection.collectedDateTime = "2024-11-09T00:00:00-06:00"

// Processing steps
* processing[+].description = "Leukoreduction by filtration"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#leukoreduced "Leukoreduced"
* processing[=].timeDateTime = "2024-11-09T02:00:00-06:00"

* processing[+].description = "Gamma irradiation (25 Gy)"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#irradiated "Irradiated"
* processing[=].timeDateTime = "2024-11-09T03:00:00-06:00"

* processing[+].description = "Extended antigen matching: C-neg, E-neg, K-neg, Fya-neg, Jkb-neg; HbS-negative unit confirmed"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#extended-phenotype-matched "Extended Phenotype Matched"
* processing[=].procedure.coding[+] = $scd-blood-product-processing#sickle-cell-negative "Sickle Cell Trait Negative (HbS Negative)"

// Storage
* storage[+].duration.start = "2024-11-09T03:00:00-06:00"
* storage[=].duration.end = "2024-11-14T06:00:00-06:00"


// ==============================================================================
// Example: ServiceRequest — Exchange Transfusion Order
// ==============================================================================

Instance: exchange-transfusion-order-example
InstanceOf: SCDServiceRequest
Title: "Example ServiceRequest — Exchange Transfusion Order"
Description: "Example SCDServiceRequest for an automated red cell exchange transfusion order."
Usage: #example

* id = "exchange-transfusion-order-example"
* status = #completed
* intent = #order
* category[+].coding[+] = $sct#387713003 "Surgical procedure (procedure)"
* code.coding[+] = $sct#71493000 "Automated red blood cell exchange (procedure)"
* code.text = "Automated red cell exchange transfusion — extended antigen-matched, HbS-negative, leukoreduced, irradiated pRBCs. Target post-exchange HbS% <30%."
* subject = Reference(maya-johnson-patient)
* encounter = Reference(maya-johnson-ed-encounter)
* occurrenceDateTime = "2024-11-14T06:00:00-06:00"
* authoredOn = "2024-11-14T03:00:00-06:00"
* requester = Reference(dr-sarah-chen-practitioner)
* reasonReference[+] = Reference(maya-johnson-voc-encounter-dx)


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
* reaction[=].manifestation[+].coding[+] = $sct#68381005 "Acute renal failure syndrome (disorder)"
* reaction[=].manifestation[=].text = "Acute kidney injury with NSAID use"
* reaction[=].severity = #severe
