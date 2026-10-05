// ==============================================================================
// USCDI-SCD Test Bundles
// File: input/fsh/instances/SCD_TestBundles.fsh
//
// Test data for implementers and testers, built from the Maya Johnson example
// scenario (see SCD_Examples.fsh). Two kinds of Bundle are provided:
//   - A transaction Bundle that loads every example record into a test server
//   - Searchset Bundles showing what a conformant server returns for the key
//     searches in the USCDI-SCD Server CapabilityStatement
//
// The Bundles reuse the example instances, so they always match the examples
// and are validated by the IG Publisher on every build.
// ==============================================================================


// Entry for a transaction Bundle (PUT so the load is repeatable)
RuleSet: TransactionEntry(type, id)
* entry[+].fullUrl = "http://example.org/fhir/{type}/{id}"
* entry[=].resource = {id}
* entry[=].request.method = #PUT
* entry[=].request.url = "{type}/{id}"

// Entry for a searchset Bundle: a resource that matched the search
RuleSet: MatchEntry(type, id)
* entry[+].fullUrl = "http://example.org/fhir/{type}/{id}"
* entry[=].resource = {id}
* entry[=].search.mode = #match

// Entry for a searchset Bundle: a resource added by _include
RuleSet: IncludeEntry(type, id)
* entry[+].fullUrl = "http://example.org/fhir/{type}/{id}"
* entry[=].resource = {id}
* entry[=].search.mode = #include


// ==============================================================================
// Transaction Bundle — load all Maya Johnson records
// ==============================================================================

Instance: maya-johnson-test-data-transaction
InstanceOf: Bundle
Title: "Test Bundle — Maya Johnson Complete Record (Transaction)"
Description: """
  Transaction Bundle containing every record in the Maya Johnson example
  scenario. POST this Bundle to a FHIR server's base URL to load the test data.
  Each entry uses PUT with the resource's id, so the load can be repeated
  without creating duplicates.
"""
Usage: #example

* id = "maya-johnson-test-data-transaction"
* type = #transaction

// Administrative
* insert TransactionEntry(Organization, metro-scd-center-org)
* insert TransactionEntry(Location, metro-scd-center-hematology-clinic)
* insert TransactionEntry(Practitioner, dr-sarah-chen-practitioner)
* insert TransactionEntry(PractitionerRole, dr-sarah-chen-hematology-role)
* insert TransactionEntry(Patient, maya-johnson-patient)

// Encounter and conditions
* insert TransactionEntry(Encounter, maya-johnson-ed-encounter)
* insert TransactionEntry(Condition, maya-johnson-scd-diagnosis)
* insert TransactionEntry(Condition, maya-johnson-voc-encounter-dx)
* insert TransactionEntry(AllergyIntolerance, maya-johnson-nsaid-allergy)

// Observations
* insert TransactionEntry(Observation, maya-johnson-hgb-fractionation)
* insert TransactionEntry(Observation, maya-johnson-spo2)
* insert TransactionEntry(Observation, maya-johnson-pain-score)

// Medications
* insert TransactionEntry(Medication, hydroxyurea-medication-example)
* insert TransactionEntry(MedicationRequest, maya-johnson-hydroxyurea-request)
* insert TransactionEntry(MedicationRequest, maya-johnson-deferasirox-request)

// Transfusion and care planning
* insert TransactionEntry(ServiceRequest, exchange-transfusion-order-example)
* insert TransactionEntry(Procedure, maya-johnson-exchange-transfusion)
* insert TransactionEntry(BiologicallyDerivedProduct, prbcs-antigen-matched-example)
* insert TransactionEntry(CarePlan, maya-johnson-chronic-transfusion-plan)


// ==============================================================================
// Searchset — Patient by identifier
// ==============================================================================

Instance: maya-johnson-search-patient
InstanceOf: Bundle
Title: "Test Bundle — Search Result: Patient by Identifier"
Description: """
  Expected server response to `GET [base]/Patient?identifier=http://example.org/metro-scd-center/mrn|SCD-2024-00142`,
  the search used to locate the patient's record.
"""
Usage: #example

* id = "maya-johnson-search-patient"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "http://example.org/fhir/Patient?identifier=http://example.org/metro-scd-center/mrn|SCD-2024-00142"
* insert MatchEntry(Patient, maya-johnson-patient)


// ==============================================================================
// Searchset — Conditions for the patient
// ==============================================================================

Instance: maya-johnson-search-conditions
InstanceOf: Bundle
Title: "Test Bundle — Search Result: Conditions for Patient"
Description: """
  Expected server response to `GET [base]/Condition?patient=maya-johnson-patient`.
  Returns both the problem list SCD diagnosis and the ED encounter diagnosis.
"""
Usage: #example

* id = "maya-johnson-search-conditions"
* type = #searchset
* total = 2
* link[+].relation = "self"
* link[=].url = "http://example.org/fhir/Condition?patient=maya-johnson-patient"
* insert MatchEntry(Condition, maya-johnson-scd-diagnosis)
* insert MatchEntry(Condition, maya-johnson-voc-encounter-dx)


// ==============================================================================
// Searchset — Laboratory results for the patient
// ==============================================================================

Instance: maya-johnson-search-labs
InstanceOf: Bundle
Title: "Test Bundle — Search Result: Laboratory Results for Patient"
Description: """
  Expected server response to `GET [base]/Observation?patient=maya-johnson-patient&category=laboratory`.
"""
Usage: #example

* id = "maya-johnson-search-labs"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "http://example.org/fhir/Observation?patient=maya-johnson-patient&category=laboratory"
* insert MatchEntry(Observation, maya-johnson-hgb-fractionation)


// ==============================================================================
// Searchset — Vital signs for the patient
// ==============================================================================

Instance: maya-johnson-search-vitals
InstanceOf: Bundle
Title: "Test Bundle — Search Result: Vital Signs for Patient"
Description: """
  Expected server response to `GET [base]/Observation?patient=maya-johnson-patient&category=vital-signs`.
  Returns the SpO2 and pain score recorded on ED arrival.
"""
Usage: #example

* id = "maya-johnson-search-vitals"
* type = #searchset
* total = 2
* link[+].relation = "self"
* link[=].url = "http://example.org/fhir/Observation?patient=maya-johnson-patient&category=vital-signs"
* insert MatchEntry(Observation, maya-johnson-spo2)
* insert MatchEntry(Observation, maya-johnson-pain-score)


// ==============================================================================
// Searchset — Medication orders for the patient, including the Medication
// ==============================================================================

Instance: maya-johnson-search-medicationrequests
InstanceOf: Bundle
Title: "Test Bundle — Search Result: Medication Orders for Patient"
Description: """
  Expected server response to `GET [base]/MedicationRequest?patient=maya-johnson-patient&intent=order&_include=MedicationRequest:medication`.
  Returns both active prescriptions, plus the referenced Medication resource
  added by `_include` (search mode `include`).
"""
Usage: #example

* id = "maya-johnson-search-medicationrequests"
* type = #searchset
* total = 2
* link[+].relation = "self"
* link[=].url = "http://example.org/fhir/MedicationRequest?patient=maya-johnson-patient&intent=order&_include=MedicationRequest:medication"
* insert MatchEntry(MedicationRequest, maya-johnson-hydroxyurea-request)
* insert MatchEntry(MedicationRequest, maya-johnson-deferasirox-request)
* insert IncludeEntry(Medication, hydroxyurea-medication-example)
