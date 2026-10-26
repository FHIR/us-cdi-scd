{%- comment -%}
CHANGE LOG PAGE — changes.md
{%- endcomment -%}

### Version 0.1.0 (DRAFT)

**Initial draft.** This guide is being developed under the FHIR Community Process and is not intended for ballot.

- Initial profiles derived from US Core 8.0.1:
  - USCDI-SCD Patient
  - USCDI-SCD Practitioner
  - USCDI-SCD PractitionerRole
  - USCDI-SCD Organization
  - USCDI-SCD Location
  - USCDI-SCD Encounter
  - USCDI-SCD Condition Encounter Diagnosis
  - USCDI-SCD Condition Problems and Health Concerns
  - USCDI-SCD AllergyIntolerance
  - USCDI-SCD CarePlan
  - USCDI-SCD ServiceRequest
  - USCDI-SCD Medication
  - USCDI-SCD MedicationRequest
  - USCDI-SCD Procedure
  - USCDI-SCD Laboratory Result
  - USCDI-SCD Vital Signs
- Initial profile for FHIR 4.0.1 BiologicallyDerivedProduct
- Initial extensions for VOC frequency, newborn screening,
  hydroxyurea adherence, iron chelation, transfusion antigen matching and
  blood product age
- Initial value sets and code systems for SCD diagnoses, medications,
  laboratory tests, procedures, and blood products
- Initial CapabilityStatements for server and client actors, importing the
  US Core 8.0.1 Server and Client CapabilityStatements
- Narrative guidance, including the Exchange Workflow, Data Element Mapping,
  Test Data, Glossary, and Known Issues and Open Questions pages
- Mapping of ONC's Version 1 USCDI+ SCD data elements to the profiles in
  this guide (USCDI+ SCD Data Elements page)
- Developer and Business Analyst reading paths on the Home page

---

### Planned Future Versions

To be determined.
<!-- TODO: Document roadmap items for future STU or normative versions:
       - Addition of patient-reported outcome (PRO) profiles
       - Genomics profiles (the SCD subtype is currently carried in the diagnosis code)
       - Integration with Da Vinci prior authorization workflows
       - Alignment with FHIR R5 BiologicallyDerivedProduct improvements
       - International extensions (non-US SCD populations)
-->
