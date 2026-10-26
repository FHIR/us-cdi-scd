{%- comment -%}
================================================================================
INTRODUCTION PAGE — introduction.md
================================================================================

{%- endcomment -%}

Responding to interoperability challenges expressed by federal and non-federal partners, the Office of the National Coordinator for Health Information Technology (ONC) is leveraging the United States Core Data for Interoperability Plus (USCDI+) service to develop a minimum core dataset for SCD data exchange. USCDI+ extends core data elements in USCDI to meet specific use cases that will benefit from harmonized data elements and help align many related but disparate efforts to collect and exchange SCD-relevant data. By publishing and maintaining a minimum core dataset informed by stakeholder needs, ONC envisions greater data exchange to improve care coordination, research comparability, and national surveillance, maximizing health outcomes for SCD warriors.

### Relationship to Other Standards and Guides

This guide is based on [FHIR R4 (4.0.1)](http://hl7.org/fhir/R4/) and builds on [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/). For details on how it relates to US Core, USCDI, SMART App Launch and other specifications, see [Relationship to Other Implementation Guides](scope_and_usage.html#relationship-to-other-implementation-guides).

---

### How to Read This Guide

You don't need to read this guide front to back. The [Home](index.html) page lists where each type of reader should start ([Who This Guide Is For](index.html#who-this-guide-is-for)) and what each page contains ([Guide Contents](index.html#guide-contents)).

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
