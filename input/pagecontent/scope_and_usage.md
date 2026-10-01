{%- comment -%}
================================================================================
SCOPE AND USAGE PAGE — scope_and_usage.md
{%- endcomment -%}

### Scope and Usage


### In Scope

The following use cases are **in scope** for this Implementation Guide:

- **Transfer of Care:** An SCD patient transitions their care from one provider to another. The new provider creates or updates the SCD diagnosis of the patient.
- **Emergency Department:** An SCD patient presents at an Emergency Department (ED) for immediate, critical care. The new provider retrieves the clinical information needed in order to provide appropriate care to the patient.

| # | Use Case | Key Profiles |
|---|---|---|
| 1 | Transfer of Care | Patient, Condition (Problems), Laboratory Result, Practitioner, PractitionerRole, Organization |
| 2 | Emergency Department | Encounter, Condition (Encounter Diagnosis), Laboratory Result, Vital Signs, MedicationRequest, CarePlan |

This diagram illustrates the data exchange process flow for these use cases, as tested at a connectathon.
<!-- TODO: Name the connectathon and its date. --> When the SCD patient presents to a new provider for care, a query is initiated to locate the patient's EMR.  Once located, the necessary medical record data is queried for and returned by the identified EHR.


<figure>
  <img src="uscdi-scd-exchange-process.jpg" alt="USCDI-SCD Exchange Process Data Flow" style="max-width:100%"/>
  <figcaption><b>Figure 1: USCDI-SCD Exchange Process Data Flow</b></figcaption>
</figure>

The [Exchange Workflow](workflow.html) page describes each step of this flow in more detail.

---
 
### Out of Scope

The following items are explicitly **out of scope** for this first version of the
USCDI-SCD IG: All registry and research use cases.  


---

### Clinical Use Cases
Both Use Cases supported by this guide are Clinical Use Cases.

---

### Relationship to Other Implementation Guides

USCDI-SCD builds on existing HL7 specifications instead of redefining them. Implementers should be familiar with the following guides and packages.

#### US Core 8.0.1

[US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/) is the foundation of this guide. With one exception, every USCDI-SCD profile is derived from a US Core profile and inherits its constraints, Must Support elements, terminology bindings and search requirements. USCDI-SCD adds Sickle Cell Disease–specific constraints, extensions and value sets on top of them.

The exception is the USCDI-SCD BiologicallyDerivedProduct profile, which is based directly on the FHIR R4 BiologicallyDerivedProduct resource because US Core has no equivalent profile.

Systems conforming to USCDI-SCD SHALL also conform to US Core 8.0.1, and the USCDI-SCD Capability Statements require support for the corresponding US Core Capability Statements. See [Conformance Requirements](conformance.html).

#### USCDI and USCDI+

US Core implements the [United States Core Data for Interoperability (USCDI)](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi). USCDI+ extends USCDI with data elements for specific domains and programs. This guide represents the USCDI+ Sickle Cell Disease data elements in FHIR, using US Core profiles wherever a USCDI data element already covers the need.

#### SMART App Launch

The USCDI-SCD Server Capability Statement requires support for [SMART App Launch](http://hl7.org/fhir/smart-app-launch/) (standalone launch and EHR launch) for authorization, consistent with US Core. See [Security and Privacy](security.html).

#### FHIR Extensions Pack

This guide uses the [FHIR Extensions Pack](http://hl7.org/fhir/extensions/) (`hl7.fhir.uv.extensions.r4` 5.1.0) for standard extensions that are not part of the FHIR R4 core specification.

#### Value Set Authority Center (VSAC)

This guide references value sets published by the National Library of Medicine's [Value Set Authority Center](https://vsac.nlm.nih.gov/) through the `us.nlm.vsac` package (version 0.19.0). Value sets defined in this guide are intended for future submission to VSAC.

#### Summary of Dependencies

| Package | Version | Relationship |
|---|---|---|
| hl7.fhir.us.core | 8.0.1 | Parent profiles; conformance foundation |
| hl7.fhir.uv.extensions.r4 | 5.1.0 | Standard extensions |
| us.nlm.vsac | 0.19.0 | Published value sets |

The complete list of package dependencies is shown on the [Home](index.html#dependencies) page.
