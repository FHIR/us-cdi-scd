{%- comment -%}
================================================================================
INTRODUCTION PAGE — introduction.md
================================================================================

{%- endcomment -%}

### Introduction

Responding to interoperability challenges expressed by federal and non-federal partners, the Assistant Secretary for Technology Policy/Office of the National Coordinator for Health Information Technology (ASTP/ONC) is leveraging the United States Core Data for Interoperability Plus (USCDI+) service to develop a minimum core dataset for SCD data exchange. USCDI+ extends core data elements in USCDI to meet specific use cases that will benefit from harmonized data elements and help align many related but disparate efforts to collect and exchange SCD-relevant data. By publishing and maintaining a minimum core dataset informed by stakeholder needs, ASTP/ONC envisions greater data exchange to improve care coordination, research comparability, and national surveillance, maximizing health outcomes for SCD warriors.

### Relationship to Other Standards and Guides

This guide is based on [FHIR R4 (4.0.1)](http://hl7.org/fhir/R4/) and builds on [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/). For details on how it relates to US Core, USCDI, SMART App Launch and other specifications, see [Relationship to Other Implementation Guides](scope_and_usage.html#relationship-to-other-implementation-guides).

---



### How to Read This Guide

This guide is organized into four parts. You don't need to read it front to back. Start with the part that fits your role.

#### What's in this guide

| Part | Pages | What you'll find |
|---|---|---|
| **Introduction** | [Introduction](introduction.html), [Background](background.html), [Scope and Usage](scope_and_usage.html), [Overview](overview.html), [Audience](audience.html) | Why this guide exists, the use cases it supports, and the big picture of how the pieces fit together |
| **Guidance** | [Conformance Requirements](conformance.html), [Exchange Workflow](workflow.html), [Security and Privacy](security.html) | The rules systems must follow to conform, how an exchange works, and how to protect SCD data |
| **Artifacts** | [Profiles](profiles.html), [Extensions](extensions.html), [Terminology](terminology.html), [Examples](examples.html), [Data Element Mapping](data-element-mapping.html), [Test Data](testing.html), [Artifacts Summary](artifacts.html) | The technical definitions: what data is exchanged, how it is coded, sample records, and test data |
| **Reference** | [Downloads](downloads.html), [Change Log](changes.html) | Files for developers and tools, and the history of changes |

#### Where to start

| If you are… | Start with | Then read |
|---|---|---|
| **A clinician or clinical informaticist** | [Background](background.html) and [Scope and Usage](scope_and_usage.html) | [Overview](overview.html) for the information model, then [Profiles](profiles.html) and [Examples](examples.html) |
| **A developer or implementer** | [Conformance Requirements](conformance.html) and [Exchange Workflow](workflow.html) | [Profiles](profiles.html), [Data Element Mapping](data-element-mapping.html), [Examples](examples.html) and [Downloads](downloads.html) |
| **A tester** | [Test Data](testing.html) | [Exchange Workflow](workflow.html), [Data Element Mapping](data-element-mapping.html) and the [Server CapabilityStatement](CapabilityStatement-uscdi-scd-server.html) |
| **A terminologist** | [Terminology](terminology.html) | The value sets listed on the [Artifacts Summary](artifacts.html) page |
| **Policy or program staff** | [Background](background.html) and [Scope and Usage](scope_and_usage.html) | [Audience](audience.html) and [Security and Privacy](security.html) |

#### Reading a profile page

Each profile page describes one type of record, such as a patient, a diagnosis or a lab result. The most useful parts are:

- **Description:** a plain-language summary of what the profile is for.
- **Key Elements table:** the elements that matter most. This is the best place to start.
- **Must Support (S):** elements marked with an **S** must be supported by conforming systems. See [Must Support](conformance.html#must-support).
- **Cardinality** (for example, `1..1` or `0..*`): how many times an element can appear. A `1` on the left means the element is required.
- **Bindings:** the code sets (value sets) an element's codes come from.
- **Examples:** sample records showing the profile in use.

The **Differential** view shows only what this guide changes compared to the parent US Core profile. The **Snapshot** view shows the complete definition.

#### Conformance language

The words **SHALL**, **SHOULD** and **MAY** have specific meanings in this guide. See [Conformance Verbs](conformance.html#conformance-verbs).
