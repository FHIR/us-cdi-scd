{%- comment -%}
================================================================================
CONFORMANCE REQUIREMENTS PAGE — conformance.md
================================================================================
CONTENT TO INSERT:
  - Must Support definition for this IG (referencing US Core)
  - Conformance verbs (SHALL, SHOULD, MAY)
  - Missing data handling
  - Obligations (if using FHIR R4B+ obligation extension)
  - CapabilityStatements (server and client)
  - Required vs recommended support for each profile
================================================================================
{%- endcomment -%}

### Conformance Requirements

<!-- TODO: Insert a 1–2 paragraph preamble stating that conformance to this IG
     requires conformance to US Core 8.0.1, and that all US Core conformance
     requirements apply unless explicitly overridden here. -->

---
Actors and Systems asserting conformance to this implementation guide have to implement the requirements outlined in the corresponding capability statements. The following definition of MUST SUPPORT is to be used in the implementation of the requirements.
MUST SUPPORT Definition
•	Systems SHALL be capable of populating data elements as specified by the profiles.
•	Systems SHALL be capable of processing resource instances containing the MUST SUPPORT data elements without generating an error or causing the application to fail. In other words, Systems SHOULD be capable of displaying the data elements for human use or storing it for other purposes.
•	In situations where information on a particular data element is not present and the reason for absence is unknown, Systems SHALL NOT include the data elements in the resource instance.
•	When accessing eCR data, Systems SHALL interpret missing data elements within resource instances as data not present.

### Conformance Verbs

This Implementation Guide uses the following conformance language, consistent
with [RFC 2119](https://tools.ietf.org/html/rfc2119) and US Core conventions:

| Verb | Meaning |
|---|---|
| **SHALL** | Absolute requirement; non-conformance is a conformance failure |
| **SHALL NOT** | Absolute prohibition |
| **SHOULD** | Strongly recommended; deviation requires documented reason |
| **SHOULD NOT** | Strongly discouraged |
| **MAY** | Optional; permitted but not required |

---

### Must Support

<!-- TODO: Insert definition of Must Support for this IG. Reference and quote
     the US Core 8.0.1 Must Support definition, then describe any additional
     requirements specific to USCDI-SCD, e.g.:
       - How receiving systems must handle Must Support elements
       - How Must Support applies to the BiologicallyDerivedProduct resource
         (which has no US Core parent profile)
       - Expectations for human-readable display of Must Support data
-->

As defined in [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/must-support.html),
a **Must Support** element means:

<!-- TODO: Paste or paraphrase the US Core Must Support definition here. -->

---

### Missing Data

<!-- TODO: Describe how to handle missing or unknown data, consistent with
     US Core guidance on missing data (dataAbsentReason, nullFlavor, etc.).
     Note any SCD-specific considerations, e.g., unknown transfusion history. -->

---

### Capability Statements

This IG defines the following Capability Statements:

| Capability Statement | Actor | Description |
|---|---|---|
| [USCDI-SCD Server CapabilityStatement](CapabilityStatement-uscdi-scd-server.html) | Responder / Server | Requirements for systems that expose SCD data |
| [USCDI-SCD Client CapabilityStatement](CapabilityStatement-uscdi-scd-client.html) | Requestor / Client | Requirements for systems that query for SCD data |

<!-- TODO: After authoring the CapabilityStatement FSH instances, expand this
     section with a narrative description of what each actor must support. -->

---

### Profile Conformance Summary

<!-- TODO: Table listing each profile and whether support is Required (SHALL),
     Recommended (SHOULD), or Optional (MAY) for conformant systems, e.g.:

| Profile | Server Support | Client Support |
|---|---|---|
| USCDI-SCD Patient | SHALL | SHALL |
| USCDI-SCD Encounter | SHALL | SHALL |
| USCDI-SCD Condition (Problems) | SHALL | SHALL |
| USCDI-SCD Laboratory Result | SHALL | SHOULD |
| USCDI-SCD BiologicallyDerivedProduct | SHOULD | SHOULD |
| USCDI-SCD CarePlan | SHOULD | MAY |
-->
