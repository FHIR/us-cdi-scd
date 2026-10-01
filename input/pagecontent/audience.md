{%- comment -%}
================================================================================
AUDIENCE PAGE — audience.md
================================================================================
CONTENT TO INSERT:
  - Primary audiences with tailored guidance for each
  - Prerequisites / assumed knowledge for implementers
  - Reading guide ("If you are a [role], start here")
================================================================================
{%- endcomment -%}

### Audience

This Implementation Guide is intended for multiple audiences. The table below
identifies primary reader groups and points each to the most relevant sections.
The sections below the table give more detail for four key groups.

| Audience | Relevant Sections | Prerequisites |
|---|---|---|
| **Clinical Informaticists** | Background, Scope, Overview, Profiles | Familiarity with FHIR R4 concepts; SCD clinical knowledge |
| **EHR / Health IT Developers** | Conformance, Profiles, Extensions, Terminology, Downloads | FHIR R4 implementation experience; FSH/SUSHI knowledge helpful |
| **Healthcare Organizations / Implementers** | Conformance, Security, Scope | Understanding of US Core and SMART on FHIR |
| **Hematologists / Clinical SMEs** | Background, Scope, Overview | Basic health IT literacy; FHIR knowledge not required |
| **Payers / Care Management Programs** | Scope, Profiles, CarePlan, ServiceRequest | FHIR R4 data model familiarity |
| **Public Health / Registry Programs** | Background, Scope, Laboratory, Condition | FHIR R4 familiarity; epidemiology background |
| **Policy Makers / Program Officers** | Introduction, Background, Scope, Audience | General health IT policy awareness |
| **Patients and Advocates** | Introduction, Background, Security | None |

---

### For Clinical Informaticists

Clinical informaticists bridge clinical practice and health IT, so this guide's design choices matter most to them. The most useful parts are:

- **The use cases** in [Scope and Usage](scope_and_usage.html): transfer of care and emergency department care for people living with SCD.
- **The information model** in [Overview](overview.html): how the clinical concepts (diagnosis, genotype, labs, transfusions, medications) relate to each other and to FHIR resources.
- **The profiles** in [Profiles](profiles.html): which data elements are required or Must Support, and how SCD-specific information such as genotype and transfusion antigen matching is captured.
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

### For Hematologists and Clinical Subject Matter Experts

You don't need technical knowledge to help make this guide clinically accurate. In plain terms, this guide defines a set of standard electronic "forms" (called **profiles**) for SCD information, such as a patient's diagnosis and genotype, a vaso-occlusive crisis visit, lab results like hemoglobin S percentage, and blood transfusions. It also defines the standard **codes** used to fill in those forms, so that every computer system means the same thing by "HbSS disease" or "acute chest syndrome".

How you can help:

- **Review the clinical content.** The [Profiles](profiles.html) page describes each form in plain language, and the [Examples](examples.html) page shows a complete fictional patient story. Check whether the information captured is what you would need when caring for a patient with SCD.
- **Check the codes.** The [Terminology](terminology.html) page lists the diagnoses, complications, lab tests and medications included. Tell us if something important is missing or incorrect.
- **Share your feedback.** Use the **Propose a change** link at the bottom of any page, or contact the HL7 Public Health Work Group at pher@lists.HL7.org.

Clinical input shapes future versions of this guide, including which data elements are required and how they are coded.

---

### For Patients and Advocates

This guide is a technical rulebook that helps different health care computer systems share medical information about people living with sickle cell disease, accurately and securely.

Today, when a person with SCD sees a new doctor or goes to an emergency department, important information such as their genotype, past pain crises, transfusion history and medications may not be available. This guide aims to make that information available to the care team when it's needed. That can mean:

- **Faster, better-informed care in the emergency department,** because the care team can see the patient's SCD history right away.
- **Smoother transitions** when changing doctors or care settings.
- **Fewer repeated tests,** because earlier results can be shared.
- **Safer transfusions,** because blood matching information (antigen matching) can travel with the patient's records.

Protecting your information is a core part of this guide. Data is shared only between authorized systems, using the security requirements described in [Security and Privacy](security.html).

Patients and advocates are welcome to share feedback on this guide by contacting the HL7 Public Health Work Group at pher@lists.HL7.org.

<!-- TODO: Confirm the Public Health Work Group list address with the work group co-chairs. -->
