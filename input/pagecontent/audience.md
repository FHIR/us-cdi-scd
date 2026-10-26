{%- comment -%}
================================================================================
AUDIENCE PAGE — audience.md
================================================================================
{%- endcomment -%}

This Implementation Guide is intended for multiple audiences. The table below
identifies primary reader groups and points each to the most relevant sections.
The sections below the table give more detail for five key groups. The [Home](index.html#who-this-guide-is-for) page gives a step-by-step reading path for developers and business analysts.

| Audience | Relevant Sections | Prerequisites |
|---|---|---|
| **Clinical Informaticists** | [Background](background.html), [Scope](scope_and_usage.html), [Overview](overview.html), [Profiles](profiles.html) | Familiarity with FHIR R4 concepts; SCD clinical knowledge |
| **EHR / Health IT Developers** | [Conformance](conformance.html), [Profiles](profiles.html), [Extensions](extensions.html), [Terminology](terminology.html), [Downloads](downloads.html) | FHIR R4 implementation experience; FSH/SUSHI knowledge helpful |
| **Business Analysts** | [Scope and Usage](scope_and_usage.html), [Exchange Workflow](workflow.html), [USCDI+ SCD Data Elements](uscdi-plus.html), [Data Element Mapping](data-element-mapping.html), [Terminology](terminology.html), [Known Issues and Open Questions](issues.html) | Knowledge of the organization's clinical data sources and workflows; FHIR knowledge helpful but not required |
| **Healthcare Organizations / Implementers** | [Conformance](conformance.html), [Security](security.html), [Scope](scope_and_usage.html) | Understanding of US Core and SMART on FHIR |
| **Hematologists / Clinical SMEs** | [Background](background.html), [Scope](scope_and_usage.html), [Overview](overview.html) | Basic health IT literacy; FHIR knowledge not required |
| **Payers / Care Management Programs** | [Scope](scope_and_usage.html), [Profiles](profiles.html), [CarePlan](StructureDefinition-uscdi-scd-careplan.html), [ServiceRequest](StructureDefinition-uscdi-scd-servicerequest.html) | FHIR R4 data model familiarity |
| **Public Health / Registry Programs** | [Background](background.html), [Scope](scope_and_usage.html), [Laboratory](StructureDefinition-uscdi-scd-laboratory-result.html), [Condition](StructureDefinition-uscdi-scd-condition-problems.html) | FHIR R4 familiarity; epidemiology background |
| **Policy Makers / Program Officers** | [Introduction](introduction.html), [Background](background.html), [Scope](scope_and_usage.html), [Audience](audience.html) | General health IT policy awareness |
| **Patients and Advocates** | [Introduction](introduction.html), [Background](background.html), [Security](security.html) | None |

---

### For Clinical Informaticists

Clinical informaticists bridge clinical practice and health IT, so this guide's design choices matter most to them. The most useful parts are:

- **The use cases** in [Scope and Usage](scope_and_usage.html): SCD Diagnosis and SCD Emergency Care, the two USCDI+ SCD use cases.
- **The information model** in [Overview](overview.html): how the clinical concepts (diagnosis and subtype, labs, transfusions, medications) relate to each other and to FHIR resources.
- **The profiles** in [Profiles](profiles.html): which data elements are required or Must Support, and how SCD-specific information such as the SCD subtype and transfusion antigen matching is captured.
- **The value sets** in [Terminology](terminology.html): the SNOMED CT, LOINC, RxNorm and ICD-10-CM codes chosen to represent SCD diagnoses, complications, lab tests and treatments.

Feedback on whether the profiles and value sets reflect real clinical workflows is especially valuable. See [For Developers and Implementers](#for-developers-and-implementers) for how to submit comments.

---

### For Developers and Implementers

Developers building systems that send or receive SCD data should start with [Conformance Requirements](conformance.html), which explains what servers and clients must support, then review the [Profiles](profiles.html) and [Examples](examples.html).

**Getting the artifacts**

- The FHIR package (NPM), definitions and examples are on the [Downloads](downloads.html) page.
- The FHIR Shorthand (FSH) source for this guide is maintained on GitHub at [github.com/FHIR/us-cdi-scd](https://github.com/FHIR/us-cdi-scd).

**Validating an implementation**

- Use the [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) with this guide's package to check that your resources conform to the USCDI-SCD profiles.
- Because USCDI-SCD builds on US Core, your system should also pass US Core validation and testing.

**Recommended tools**

- [SUSHI](https://fshschool.org) compiles the FSH source into FHIR resources.
- The [HL7 IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation) builds this guide from source.
- The [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) checks resources against the profiles.

**Questions and feedback**

- To propose a change to this guide, use the **Propose a change** link at the bottom of any page, which opens an HL7 Jira ticket.
- For implementation questions, use the [chat.fhir.org](https://chat.fhir.org) community forum.
- Issues with the source files can be reported on the [GitHub repository](https://github.com/FHIR/us-cdi-scd/issues).

---

### For Business Analysts

Business analysts help an organization decide what it takes to implement this guide: which source systems hold the data, how the data is coded today, and which workflows change. No FHIR programming knowledge is needed.

- **Confirm the scope.** [Scope and Usage](scope_and_usage.html) describes the two use cases and the profiles each one needs. Start with the use case your organization is implementing.
- **Start from the USCDI+ data elements.** The [USCDI+ SCD Data Elements](uscdi-plus.html) page shows where each of ONC's USCDI+ SCD data elements is represented, and which are not yet covered.
- **Map the data.** The [Data Element Mapping](data-element-mapping.html) page lists every required and Must Support element. Its CSV download can be used as a gap analysis worksheet: for each element, record the source system, the field, and whether the data is available.
- **Check the codes.** [Terminology](terminology.html) lists the code systems the data must use. Diagnoses use SNOMED CT (ICD-10-CM may also be sent), laboratory results and vital signs use LOINC, and medications use RxNorm. Locally coded data needs to be mapped to these code systems.
- **Understand the workflow.** [Exchange Workflow](workflow.html) describes who requests data from whom, and at which step.
- **Review privacy requirements.** [Security and Privacy](security.html) covers rules, such as 42 CFR Part 2 and minors' records, that can affect what data may be shared.
- **Plan for open items.** [Known Issues and Open Questions](issues.html) lists limitations and undecided questions that may affect scope or timelines.

The [Glossary](glossary.html) defines the FHIR and clinical terms used in this guide.

---

### For Hematologists and Clinical Subject Matter Experts

You don't need technical knowledge to help make this guide clinically accurate. In plain terms, this guide defines a set of standard electronic "forms" (called **profiles**) for SCD information, such as a patient's diagnosis and SCD type, a vaso-occlusive crisis visit, lab results like hemoglobin S percentage, and blood transfusions. It also defines the standard **codes** used to fill in those forms, so that every computer system means the same thing by "HbSS disease" or "acute chest syndrome".

How you can help:

- **Review the clinical content.** The [Profiles](profiles.html) page describes each form in plain language, and the [Examples](examples.html) page shows a complete fictional patient story. Check whether the information captured is what you would need when caring for a patient with SCD.
- **Check the codes.** The [Terminology](terminology.html) page lists the diagnoses, complications, lab tests and medications included. Tell us if something important is missing or incorrect.
- **Share your feedback.** Use the **Propose a change** link at the bottom of any page, or contact the HL7 Public Health Work Group at PHER@HL7.org.

Clinical input shapes future versions of this guide, including which data elements are required and how they are coded.

---

### For Patients and Advocates

This guide is a technical rulebook that helps different health care computer systems share medical information about people living with sickle cell disease, accurately and securely.

Today, when a person with SCD sees a new doctor or goes to an emergency department, important information such as their type of SCD, past pain crises, transfusion history and medications may not be available. This guide aims to make that information available to the care team when it's needed. That can mean:

- **Faster, better-informed care in the emergency department,** because the care team can see the patient's SCD history right away.
- **Smoother transitions** when changing doctors or care settings.
- **Fewer repeated tests,** because earlier results can be shared.
- **Safer transfusions,** because blood matching information (antigen matching) can travel with the patient's records.

Protecting your information is a core part of this guide. Data is shared only between authorized systems, using the security requirements described in [Security and Privacy](security.html).

Patients and advocates are welcome to share feedback on this guide by contacting the HL7 Public Health Work Group at PHER@HL7.org.
