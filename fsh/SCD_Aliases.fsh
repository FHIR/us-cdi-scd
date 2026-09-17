// ==============================================================================
// USCDI-SCD FSH Aliases
// File: input/fsh/SCD_Aliases.fsh
//
// Centralized alias definitions for all code system and terminology URIs
// used throughout the USCDI-SCD FSH source files.
//
// Using aliases ensures consistency and makes it easy to update URIs
// in one place if they change.
//
// Reference: https://fshschool.org/docs/sushi/aliases/
// ==============================================================================

// -----------------------------------------------------------------------
// Standard Terminology Systems
// -----------------------------------------------------------------------

Alias: $sct          = http://snomed.info/sct
Alias: $loinc        = http://loinc.org
Alias: $rxnorm       = http://www.nlm.nih.gov/research/umls/rxnorm
Alias: $icd10cm      = http://hl7.org/fhir/sid/icd-10-cm
Alias: $icd10pcs     = http://www.cms.gov/Medicare/Coding/ICD10
Alias: $cpt          = http://www.ama-assn.org/go/cpt
Alias: $ndc          = http://hl7.org/fhir/sid/ndc
Alias: $cvx          = http://hl7.org/fhir/sid/cvx
Alias: $ucum         = http://unitsofmeasure.org
Alias: $nucc         = http://nucc.org/provider-taxonomy

// -----------------------------------------------------------------------
// HL7 Terminology (THO)
// -----------------------------------------------------------------------

Alias: $v2-0131      = http://terminology.hl7.org/CodeSystem/v2-0131
Alias: $v2-0203      = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v3-ActCode   = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $v3-NullFlavor = http://terminology.hl7.org/CodeSystem/v3-NullFlavor
Alias: $v3-ObservationInterpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation
Alias: $v3-RoleCode  = http://terminology.hl7.org/CodeSystem/v3-RoleCode
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $allergyintolerance-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical
Alias: $allergyintolerance-verification = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification

// -----------------------------------------------------------------------
// US Core Profiles (parent profiles)
// -----------------------------------------------------------------------

Alias: $us-core-patient              = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Alias: $us-core-practitioner         = http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Alias: $us-core-practitionerrole     = http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole
Alias: $us-core-organization         = http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
Alias: $us-core-location             = http://hl7.org/fhir/us/core/StructureDefinition/us-core-location
Alias: $us-core-encounter            = http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter
Alias: $us-core-condition-encounter-diagnosis = http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-encounter-diagnosis
Alias: $us-core-condition-problems-health-concerns = http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns
Alias: $us-core-allergyintolerance   = http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance
Alias: $us-core-careplan             = http://hl7.org/fhir/us/core/StructureDefinition/us-core-careplan
Alias: $us-core-servicerequest       = http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest
Alias: $us-core-medication           = http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication
Alias: $us-core-procedure            = http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure
Alias: $us-core-observation-lab      = http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab
Alias: $us-core-vital-signs          = http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs

// -----------------------------------------------------------------------
// US Core Extensions
// -----------------------------------------------------------------------

Alias: $us-core-race          = http://hl7.org/fhir/us/core/StructureDefinition/us-core-race
Alias: $us-core-ethnicity     = http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity
Alias: $us-core-birthsex      = http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex
Alias: $us-core-sex           = http://hl7.org/fhir/us/core/StructureDefinition/us-core-sex

// -----------------------------------------------------------------------
// HL7 Core Extensions (uv.extensions.r4)
// -----------------------------------------------------------------------

Alias: $data-absent-reason    = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $event-location        = http://hl7.org/fhir/StructureDefinition/event-location

// -----------------------------------------------------------------------
// USCDI-SCD Local Code Systems
// -----------------------------------------------------------------------

Alias: $scd-observation-category = http://hl7.org/fhir/us/uscdi-scd/CodeSystem/scd-observation-category-cs
Alias: $scd-blood-product-processing = http://hl7.org/fhir/us/uscdi-scd/CodeSystem/scd-blood-product-processing-cs

// -----------------------------------------------------------------------
// ISBT 128 (Blood Product Coding)
// -----------------------------------------------------------------------

// TODO: Confirm the correct FHIR CodeSystem URI for ISBT 128.
// ISBT 128 is maintained by ICCBBA (https://www.iccbba.org/).
// The URI below is a placeholder pending official HL7 / ICCBBA registration.
Alias: $isbt128 = http://iccbba.org/isbt128

// -----------------------------------------------------------------------
// Identifier Systems
// -----------------------------------------------------------------------

Alias: $npi       = http://hl7.org/fhir/sid/us-npi
Alias: $tin       = urn:oid:2.16.840.1.113883.4.4
Alias: $ssn       = http://hl7.org/fhir/sid/us-ssn
Alias: $mrn       = urn:oid:2.16.840.1.113883.4.3   // placeholder; use system-specific OID

// -----------------------------------------------------------------------
// VSAC (Value Set Authority Center)
// -----------------------------------------------------------------------

// Base URI for VSAC-hosted value sets
// Pattern: http://cts.nlm.nih.gov/fhir/ValueSet/{OID}
// TODO: Replace local VS canonical URIs with VSAC URIs once OIDs are assigned.
Alias: $vsac = http://cts.nlm.nih.gov/fhir/ValueSet
