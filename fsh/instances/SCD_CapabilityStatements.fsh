// ==============================================================================
// USCDI-SCD CapabilityStatements
// File: input/fsh/instances/SCD_CapabilityStatements.fsh
//
// Defines the CapabilityStatement instances for:
//   - USCDI-SCD Server (Responder) — systems that expose SCD data
//   - USCDI-SCD Client (Requestor) — systems that consume SCD data
//
// These CapabilityStatements define conformance expectations for FHIR
// servers and clients implementing the USCDI-SCD IG.
//
// TODO: Expand each CapabilityStatement with:
//   - Full resource interaction lists (read, search, create, update)
//   - Search parameter definitions
//   - Supported _include and _revinclude parameters
//   - SMART on FHIR scope requirements
//   - Security requirements
// ==============================================================================


// ==============================================================================
// USCDI-SCD Server CapabilityStatement
// ==============================================================================
// Applies to: EHR systems, health information exchanges, and specialty
//             systems that expose SCD patient data via FHIR API
// ==============================================================================

Instance: uscdi-scd-server-capabilitystatement
InstanceOf: CapabilityStatement
Title: "USCDI-SCD Server CapabilityStatement"
Description: """
  Defines the minimum FHIR API capabilities required for a system acting as
  a FHIR server (data responder) conformant with the USCDI-SCD Implementation
  Guide. Servers SHALL support read and search operations for all required
  USCDI-SCD profiles.
"""
Usage: #definition

* id = "uscdi-scd-server"
* url = "http://hl7.org/fhir/us/uscdi-scd/CapabilityStatement/uscdi-scd-server"
* version = "1.0.0"
* name = "USCDISCDServerCapabilityStatement"
* title = "USCDI-SCD Server CapabilityStatement"
* status = #active
* experimental = false
* date = "2025-01-01"
* publisher = "HL7 International / Patient Care"
* description = """
  Minimum server capabilities for systems conformant with the USCDI + Sickle
  Cell Disease Implementation Guide. Servers SHALL implement US Core Server
  requirements and additionally support USCDI-SCD profiles.

  TODO: Complete interaction lists, search parameters, and _include support.
"""
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* implementationGuide[+] = "http://hl7.org/fhir/us/core/ImplementationGuide/hl7.fhir.us.core"
* implementationGuide[+] = "http://hl7.org/fhir/us/uscdi-scd/ImplementationGuide/hl7.fhir.us.uscdi-scd"

* rest[+].mode = #server
* rest[=].documentation = """
  USCDI-SCD Server SHALL:
  1. Support all US Core Server requirements (US Core 8.0.1 CapabilityStatement)
  2. Support the USCDI-SCD profiles listed below
  3. Support SMART on FHIR (standalone launch, EHR launch)
  4. Support TLS 1.2 or higher for all connections
  5. Support FHIR AuditEvent for access logging

  TODO: Add specific search parameter requirements for SCD use cases:
    - Patient: search by identifier, name, birthdate, gender
    - Condition: search by patient, code (SCD D57.x codes), category
    - Observation: search by patient, code (HbS%, ferritin, SpO2), date
    - Procedure: search by patient, code (transfusion), date
    - BiologicallyDerivedProduct: search by patient, request, status
"""

// Patient
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-patient"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "name"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[+].name = "birthdate"
* rest[=].resource[=].searchParam[=].type = #date

// Practitioner
* rest[=].resource[+].type = #Practitioner
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-practitioner"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token

// PractitionerRole
* rest[=].resource[+].type = #PractitionerRole
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-practitionerrole"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// Organization
* rest[=].resource[+].type = #Organization
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-organization"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// Location
* rest[=].resource[+].type = #Location
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-location"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// Encounter
* rest[=].resource[+].type = #Encounter
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-encounter"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[+].name = "class"
* rest[=].resource[=].searchParam[=].type = #token

// Condition
* rest[=].resource[+].type = #Condition
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-condition-encounter-diagnosis"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-condition-problems"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "category"
* rest[=].resource[=].searchParam[=].type = #token

// AllergyIntolerance
* rest[=].resource[+].type = #AllergyIntolerance
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-allergyintolerance"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// CarePlan
* rest[=].resource[+].type = #CarePlan
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-careplan"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// ServiceRequest
* rest[=].resource[+].type = #ServiceRequest
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-servicerequest"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// Medication
* rest[=].resource[+].type = #Medication
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-medication"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

// Procedure
* rest[=].resource[+].type = #Procedure
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-procedure"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date

// Observation (Laboratory Result and Vital Signs)
* rest[=].resource[+].type = #Observation
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-laboratory-result"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-vital-signs"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[+].name = "category"
* rest[=].resource[=].searchParam[=].type = #token

// BiologicallyDerivedProduct
* rest[=].resource[+].type = #BiologicallyDerivedProduct
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-biologicallyderivedproduct"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].documentation = """
  BiologicallyDerivedProduct support is RECOMMENDED (SHOULD) for systems that
  manage blood product transfusion records for SCD patients. Systems that do
  not manage transfusion records MAY omit this resource.
  TODO: Define search parameters for BiologicallyDerivedProduct.
"""


// ==============================================================================
// USCDI-SCD Client CapabilityStatement
// ==============================================================================
// Applies to: Clinical applications, patient portals, care management
//             systems, and analytics platforms that consume SCD data
// ==============================================================================

Instance: uscdi-scd-client-capabilitystatement
InstanceOf: CapabilityStatement
Title: "USCDI-SCD Client CapabilityStatement"
Description: """
  Defines the minimum FHIR API capabilities required for a system acting as
  a FHIR client (data requestor) conformant with the USCDI-SCD Implementation
  Guide. Clients SHALL be capable of processing all Must Support elements
  in USCDI-SCD profiles.
"""
Usage: #definition

* id = "uscdi-scd-client"
* url = "http://hl7.org/fhir/us/uscdi-scd/CapabilityStatement/uscdi-scd-client"
* version = "1.0.0"
* name = "USCDISCDClientCapabilityStatement"
* title = "USCDI-SCD Client CapabilityStatement"
* status = #active
* experimental = false
* date = "2025-01-01"
* publisher = "HL7 International / Patient Care"
* description = """
  Minimum client capabilities for systems conformant with the USCDI + Sickle
  Cell Disease Implementation Guide. Clients SHALL implement US Core Client
  requirements and additionally be capable of consuming USCDI-SCD profile data.

  TODO: Complete interaction lists and document client processing requirements.
"""
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* implementationGuide[+] = "http://hl7.org/fhir/us/core/ImplementationGuide/hl7.fhir.us.core"
* implementationGuide[+] = "http://hl7.org/fhir/us/uscdi-scd/ImplementationGuide/hl7.fhir.us.uscdi-scd"

* rest[+].mode = #client
* rest[=].documentation = """
  USCDI-SCD Clients SHALL:
  1. Support all US Core Client requirements
  2. Be capable of requesting and processing all USCDI-SCD profiles
  3. Process all Must Support elements in USCDI-SCD profiles without error
  4. Handle missing data using dataAbsentReason where applicable
  5. Display SCD-relevant clinical data in human-readable form

  TODO: Add specific client requirements for SCD workflows.
"""

* rest[=].resource[+].type = #Patient
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-patient"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

* rest[=].resource[+].type = #Observation
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-laboratory-result"
* rest[=].resource[=].supportedProfile[+] = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-vital-signs"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type

* rest[=].resource[+].type = #BiologicallyDerivedProduct
* rest[=].resource[=].profile = "http://hl7.org/fhir/us/uscdi-scd/StructureDefinition/uscdi-scd-biologicallyderivedproduct"
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].documentation = "Client SHOULD support retrieval and display of blood product information for SCD transfusion history review."
