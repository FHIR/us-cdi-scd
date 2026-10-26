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

### Who This Guide Is For

You don't need to read this guide front to back. Most hospitals implementing it involve two roles: a **developer**, who builds the interface, and a **business analyst**, who confirms that the hospital's data and workflows can meet the requirements. Each role has a reading path below. The [Audience](audience.html) page has more detail for each group, and the [Glossary](glossary.html) defines the terms used.

#### Developer

*You build or configure the FHIR interface: an EHR or health information exchange that returns SCD data (Server), or an application that requests and displays it (Client).*

| Step | Read | To learn |
|---|---|---|
| 1 | [Conformance Requirements](conformance.html) | Which actor you are implementing, what Must Support means, and how to handle missing data |
| 2 | [Server](CapabilityStatement-uscdi-scd-server.html) or [Client](CapabilityStatement-uscdi-scd-client.html) CapabilityStatement | The profiles, interactions and searches you must support, including the US Core requirements they import |
| 3 | [Exchange Workflow](workflow.html) | The steps of an exchange and the searches used at each step |
| 4 | [Profiles](profiles.html) and [Data Element Mapping](data-element-mapping.html) | Every required and Must Support element, with cardinality and bindings (also as a CSV checklist) |
| 5 | [Examples](examples.html) and [Test Data](testing.html) | Sample records, a test Bundle to load into your server, and the expected search results |
| 6 | [Downloads](downloads.html) | The FHIR package for validating your resources with the HL7 FHIR Validator |
| 7 | [Known Issues and Open Questions](issues.html) | Gaps to plan around, such as blood product retrieval and authorization between organizations |

#### Business Analyst

*You gather requirements, map the hospital's source data and workflows to this guide, and identify gaps before development starts.*

| Step | Read | To learn |
|---|---|---|
| 1 | [Scope and Usage](scope_and_usage.html) | The two use cases (SCD Diagnosis and SCD Emergency Care) and the profiles each one needs |
| 2 | [Overview](overview.html) | The information model and a summary of every profile |
| 3 | [Exchange Workflow](workflow.html) | Who exchanges data with whom, at which step, and what is still undecided |
| 4 | [USCDI+ SCD Data Elements](uscdi-plus.html) | Where each of ONC's USCDI+ SCD data elements is represented in this guide, and which are not yet covered |
| 5 | [Data Element Mapping](data-element-mapping.html) | Every profile element to map to your source systems; download the CSV to use as a gap analysis worksheet |
| 6 | [Terminology](terminology.html) | The code systems your data must use (SNOMED CT, LOINC, RxNorm, ICD-10-CM) and the SCD reference value sets |
| 7 | [Security and Privacy](security.html) | Privacy rules that affect what can be shared, such as 42 CFR Part 2 and minors' records |
| 8 | [Known Issues and Open Questions](issues.html) | Items that may affect scope, timelines or decisions |

#### Other Readers

| If you are… | Start with | Then read |
|---|---|---|
| **A clinician or clinical informaticist** | [Background](background.html) and [Scope and Usage](scope_and_usage.html) | [Overview](overview.html) for the information model, then [Profiles](profiles.html) and [Examples](examples.html) |
| **A tester** | [Test Data](testing.html) | [Exchange Workflow](workflow.html), [Data Element Mapping](data-element-mapping.html) and the [Server CapabilityStatement](CapabilityStatement-uscdi-scd-server.html) |
| **A terminologist** | [Terminology](terminology.html) | The value sets listed on the [Artifacts Summary](artifacts.html) page |
| **Policy or program staff** | [Background](background.html) and [Scope and Usage](scope_and_usage.html) | [Audience](audience.html) and [Security and Privacy](security.html) |
| **A patient or advocate** | [For Patients and Advocates](audience.html#for-patients-and-advocates) | [Security and Privacy](security.html) |

---

### Guide Contents

The guide is organized in the same order as the menu bar.

| Part | Page | Description |
|---|---|---|
| **Introduction** | [Introduction](introduction.html) | Purpose, relationship to other standards, and how to read this guide |
| | [Background](background.html) | Clinical and policy context for Sickle Cell Disease data exchange |
| | [Scope and Usage](scope_and_usage.html) | The use cases, what is in and out of scope, and related guides |
| | [Overview](overview.html) | The information model, profile summary and conventions |
| | [Audience](audience.html) | Intended readers and how each can use this guide |
| | [Glossary](glossary.html) | Definitions of technical, standards and clinical terms |
| **Guidance** | [Conformance Requirements](conformance.html) | Must Support, missing data, and CapabilityStatements |
| | [Exchange Workflow](workflow.html) | How an exchange works, step by step, and open questions |
| | [Security and Privacy](security.html) | Guidance on protecting sensitive SCD data |
| | [Known Issues and Open Questions](issues.html) | Known limitations and unresolved questions in this draft |
| **Artifacts** | [Profiles](profiles.html) | All FHIR profiles defined in this guide |
| | [Extensions](extensions.html) | Extensions defined in this guide |
| | [Terminology](terminology.html) | Value sets and code systems |
| | [Examples](examples.html) | Example records following one fictional patient |
| | [Data Element Mapping](data-element-mapping.html) | Every Must Support and required element, with cardinality and bindings |
| | [USCDI+ SCD Data Elements](uscdi-plus.html) | Where each USCDI+ SCD data element is represented, and the gaps |
| | [Test Data](testing.html) | Test Bundles and expected search results for testers |
| | [Artifacts Summary](artifacts.html) | A list of every artifact in this guide |
| **Downloads** | [Downloads](downloads.html) | The FHIR package, definitions, examples and test data |
| **Change Log** | [Change Log](changes.html) | Changes in each version of this guide |

---

### Acknowledgements

This Implementation Guide was developed as part of the Office of the National Coordinator's (ONC) USCDI+ Sickle Cell Disease (SCD) initiative with funding from the HHS Office of the Secretary Patient-Centered Outcomes Research Trust Fund (OS-PCORTF), administered by the Office of the Assistant Secretary for Planning and Evaluation (ASPE), through sustained collaboration across the warrior, clinical, research, regulatory, public health, and health IT communities.

This IG references a 2026 landscape analysis compiled by the USCDI+ SCD project team and informed by a Technical Expert Panel. ONC published Version 1 of the USCDI+ SCD data element lists for the [Diagnosis](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=84d4c4a23bdd03503cb59d0864e45a2a&view=sp) and [Emergency Care](https://uscdiplus.healthit.gov/uscdiplus?id=uscdi_record&table=x_g_sshh_uscdi_sub_domain&sys_id=a7e444623bdd03503cb59d0864e45a96&view=sp) use cases in October 2026.

---

### Dependencies

This implementation guide relies on the following published FHIR packages:

{% include dependency-table.xhtml %}

---

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

---

### Global Profiles

{% include globals-table.xhtml %}

---

### Intellectual Property Statements

{% include ip-statements.xhtml %}
