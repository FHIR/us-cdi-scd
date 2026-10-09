{%- comment -%}
================================================================================
HOME PAGE — index.md
================================================================================
This is the landing page of the USCDI-SCD Implementation Guide.
It should provide a brief orienting summary and quick navigation links.

{%- endcomment -%}

### Overview


The **USCDI + Sickle Cell Disease Implementation Guide (USCDI-SCD)** specifies
FHIR R4 (4.0.1) profiles and supporting artifacts to enable standardized
exchange of clinical and administrative data relevant to patients living with
Sickle Cell Disease (SCD). This guide extends and aligns with
[US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/).

---

### Quick Navigation

| Section | Description |
|---|---|
| [Introduction](introduction.html) | Purpose, goals, and relationship to other standards |
| [Background](background.html) | Clinical and policy context for Sickle Cell Disease data exchange |
| [Scope and Usage](scope_and_usage.html) | What is in and out of scope; use cases |
| [Overview](overview.html) | Architectural overview of profiles and interactions |
| [Audience](audience.html) | Intended readers and implementers |
| [Conformance Requirements](conformance.html) | Must Support, missing data, and capability statements |
| [Exchange Workflow](workflow.html) | How an exchange works, step by step, and open questions |
| [Profiles](profiles.html) | All FHIR profiles defined or constrained in this IG |
| [Extensions](extensions.html) | Custom extensions introduced by this IG |
| [Terminology](terminology.html) | Value sets and code systems |
| [Examples](examples.html) | Example records following one fictional patient |
| [Data Element Mapping](data-element-mapping.html) | Every Must Support and required element, with cardinality and bindings |
| [Test Data](testing.html) | Test Bundles and expected search results for testers |
| [Security and Privacy](security.html) | Guidance on protecting sensitive SCD data |
| [Downloads](downloads.html) | Downloadable artifacts |
| [Change Log](changes.html) | Changes in each version of this guide |

---

### Acknowledgements

This Implementation Guide was developed as part of the Office of the National Coordinator's (ONC) USCDI+ Sickle Cell Disease (SCD) initiative with funding from the HHS Office of the Secretary Patient-Centered Outcomes Research Trust Fund (OS-PCORTF), administered by the Office of the Assistant Secretary for Planning and Evaluation (ASPE), through sustained collaboration across the warrior, clinical, research, regulatory, public health, and health IT communities.

This IG references a 2026 landscape analysis compiled by the USCDI+ SCD project team and informed by a Technical Expert Panel. ONC published Version 1 of the USCDI+ SCD data element lists for the [Diagnosis](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=84d4c4a23bdd03503cb59d0864e45a2a&view=sp) and [Emergency Care](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=a7e444623bdd03503cb59d0864e45a96&view=sp) use cases in October 2026.

---

### Dependencies

This implementation guide relies on the following published FHIR packages:

{% include dependency-table.xhtml %}

---

### Intellectual Property Statements

{% include ip-statements.xhtml %}
