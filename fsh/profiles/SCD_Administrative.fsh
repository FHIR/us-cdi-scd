// ==============================================================================
// USCDI-SCD FSH Profiles — Administrative / Demographic
// File: input/fsh/profiles/SCD_Administrative.fsh
//
// Profiles:
//   - SCDPatient
//   - SCDPractitioner
//   - SCDPractitionerRole
//   - SCDOrganization
//   - SCDLocation
//
// All profiles in this file extend their respective US Core 8.0.1 parents.
// US Core parent profiles are reused without modification where possible.
// Additional constraints reflect SCD-specific requirements.
// ==============================================================================


// ==============================================================================
// SCDPatient
// ==============================================================================
// Extends: US Core Patient Profile
// Purpose: Represents patients with Sickle Cell Disease.
//          Inherits all US Core Patient Must Support elements.
//          Race and ethnicity are surfaced as Must Support to support
//          health equity reporting requirements (USCDI+ SCD initiative).
// ==============================================================================

Profile: SCDPatient
Parent: us-core-patient
Id: uscdi-scd-patient
Title: "USCDI-SCD Patient"
Description: """
  The USCDI-SCD Patient profile represents a patient with Sickle Cell Disease (SCD)
  or at risk for SCD. This profile extends the [US Core Patient Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-patient.html)
  and imposes no additional constraints beyond those defined in US Core, but
  establishes this as the canonical patient profile for the USCDI-SCD IG,
  enabling consistent referencing across all other profiles in this guide.

  Race and ethnicity extensions (inherited from US Core) are surfaced here as
  Must Support elements given their importance in SCD health equity reporting.
"""

// ----------------------------------------------------------------------------
// No additional constraints beyond US Core Patient at this time.
// The profile is defined to serve as a canonical reference point for the
// USCDI-SCD IG and to enable future SCD-specific extensions.
//
// TODO: Consider adding these extensions in a future version:
//   - SCD newborn screening result reference
//   - Preferred SCD treatment center (reference to Organization)
// ----------------------------------------------------------------------------

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Race and ethnicity from US Core — surfaced as Must Support for SCD equity
* extension[us-core-race] MS
* extension[us-core-ethnicity] MS

// Core demographics — inherited Must Support from US Core, stated explicitly
* identifier MS
* name MS
* telecom MS
* birthDate MS
* address MS
* communication MS


// ==============================================================================
// SCDPractitioner
// ==============================================================================
// Extends: US Core Practitioner Profile
// Purpose: Represents providers involved in SCD care (hematologists, emergency
//          physicians, primary care providers, pain specialists, etc.)
// ==============================================================================

Profile: SCDPractitioner
Parent: us-core-practitioner
Id: uscdi-scd-practitioner
Title: "USCDI-SCD Practitioner"
Description: """
  The USCDI-SCD Practitioner profile represents a healthcare provider involved
  in the care of patients with Sickle Cell Disease. This profile extends the
  [US Core Practitioner Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-practitioner.html)
  without additional constraints, establishing it as the canonical practitioner
  reference for the USCDI-SCD IG.

  Common practitioner types in SCD care include hematologists, emergency medicine
  physicians, primary care providers, pain management specialists, social workers,
  and patient care coordinators.
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Practitioner
* identifier MS
* identifier[NPI] MS
* name MS


// ==============================================================================
// SCDPractitionerRole
// ==============================================================================
// Extends: US Core PractitionerRole Profile
// Purpose: Represents the role a provider plays within an SCD care team.
//          Specialty codes relevant to SCD care are noted.
// ==============================================================================

Profile: SCDPractitionerRole
Parent: us-core-practitionerrole
Id: uscdi-scd-practitionerrole
Title: "USCDI-SCD PractitionerRole"
Description: """
  The USCDI-SCD PractitionerRole profile represents the role, organization,
  and location associations of a provider involved in SCD care. This profile
  extends the [US Core PractitionerRole Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-practitionerrole.html).

  SCD care teams frequently include providers across multiple specialties and
  organizations. This profile enables systems to represent care team composition,
  including hematology specialists, primary care, emergency, and care management
  roles, supporting care coordination across settings.

  Relevant NUCC specialty codes include:
  - 207RH0000X — Hematology (Internal Medicine)
  - 207RH0003X — Hematology & Oncology
  - 208D00000X — General Practice
  - 261QF0400X — Federally Qualified Health Center
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core PractitionerRole
* practitioner MS
* organization MS
* code MS
* specialty MS
* location MS
* telecom MS
* endpoint MS


// ==============================================================================
// SCDOrganization
// ==============================================================================
// Extends: US Core Organization Profile
// Purpose: Represents organizations providing SCD care (hematology practices,
//          hospitals, FQHCs, SCD treatment centers, blood banks).
// ==============================================================================

Profile: SCDOrganization
Parent: us-core-organization
Id: uscdi-scd-organization
Title: "USCDI-SCD Organization"
Description: """
  The USCDI-SCD Organization profile represents a healthcare organization
  involved in providing care to patients with Sickle Cell Disease. This
  profile extends the [US Core Organization Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-organization.html)
  without additional constraints.

  Relevant organization types in SCD care include:
  - Comprehensive Sickle Cell Disease Treatment Centers (HRSA-funded)
  - Hematology and Oncology practices
  - Federally Qualified Health Centers (FQHCs)
  - Academic Medical Centers with SCD programs
  - Hospital Blood Banks and Transfusion Services
  - Community health organizations and patient advocacy groups
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Organization
* identifier MS
* active MS
* name MS
* telecom MS
* address MS


// ==============================================================================
// SCDLocation
// ==============================================================================
// Extends: US Core Location Profile
// Purpose: Represents care delivery locations relevant to SCD
//          (ED, infusion center, day hospital, outpatient clinic, HSCT unit).
// ==============================================================================

Profile: SCDLocation
Parent: us-core-location
Id: uscdi-scd-location
Title: "USCDI-SCD Location"
Description: """
  The USCDI-SCD Location profile represents a physical location where SCD
  care is delivered. This profile extends the [US Core Location Profile](http://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-location.html)
  without additional constraints.

  SCD patients receive care across a broad range of locations, including
  emergency departments (often for vaso-occlusive crisis), outpatient
  hematology clinics, day hospitals and infusion centers (for chronic
  transfusion therapy), and inpatient units (for acute chest syndrome,
  stroke, and hematopoietic stem cell transplantation).
"""

* ^status = #active
* ^experimental = false
* ^date = "2025-01-01"
* ^publisher = "HL7 International / Patient Care"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

// Inherited Must Support from US Core Location
* status MS
* name MS
* telecom MS
* address MS
* managingOrganization MS
