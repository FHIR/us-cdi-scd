{%- comment -%}
================================================================================
KNOWN ISSUES AND OPEN QUESTIONS PAGE — issues.md
================================================================================
Keep this page in sync with the TODO comments in the source. When an item is
resolved, remove it here and record the change on the Change Log page.
{%- endcomment -%}

This is a draft guide. This page lists its known limitations and the questions that are still open, so that implementers can plan around them. Comments on any item are welcome; see [Questions and feedback](audience.html#for-developers-and-implementers).

### Known Issues

#### Terminology

1. **Codes not found in SNOMED CT.** Eleven SNOMED CT codes could not be validated against the SNOMED CT US Edition and are waiting for a terminologist to supply correct codes:
   - [SCD Red Cell Antigen Value Set](ValueSet-scd-red-cell-antigen-vs.html): the c, e, K, k, M, N, S and s antigens (6411008, 35095006, 90290005, 6532007, 21974004, 21977006, 21976002, 21975003).
   - [SCD Blood Product Type Value Set](ValueSet-scd-blood-product-type-vs.html): hematopoietic progenitor cells from apheresis, bone marrow and cord blood (420413007, 419252003, 767410002).

   The [antigen-matched blood product example](BiologicallyDerivedProduct-prbcs-antigen-matched-example.html) uses one of these codes (90290005, K antigen), so it and the [test data Bundle](Bundle-maya-johnson-test-data-transaction.html) report a validation error for that code.
2. **No OIDs yet.** The nine value sets and two code systems defined in this guide do not yet have OIDs. They are intended for future submission to [VSAC](https://vsac.nlm.nih.gov/), which assigns OIDs.
3. **ISBT 128 not yet included.** Blood products and red cell antigens are coded with SNOMED CT and local codes. ISBT 128 codes are planned for a future version; the FHIR code system URI to use for ISBT 128 has not yet been confirmed.
4. **Value sets are incomplete reference lists.** The value sets list commonly used codes and do not yet claim complete coverage. For example, the [SCD Medication Value Set](ValueSet-scd-medication-vs.html) does not include analgesics, and the [SCD Procedure Value Set](ValueSet-scd-procedure-vs.html) does not include CPT codes. Because the bindings are example strength or the US Core binding applies, codes outside these lists are valid.

#### FHIR R4 BiologicallyDerivedProduct

5. **No direct link to the patient or the procedure.** In FHIR R4, BiologicallyDerivedProduct has no element that references the patient who received it, and `Procedure.usedReference` cannot reference it. This guide links products to patients and procedures through the transfusion order (ServiceRequest). See the [USCDI-SCD BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) profile.
6. **No patient search.** FHIR R4 defines no `patient` search parameter for BiologicallyDerivedProduct, so a client cannot retrieve a patient's blood products with a standard search. The [Server CapabilityStatement](CapabilityStatement-uscdi-scd-server.html) requires only `read` and type-level search for this resource. See Open Question 7.

#### Profiles and Extensions

7. **One extension is not used by any profile.** The [SCD Hydroxyurea Adherence](StructureDefinition-scd-hydroxyurea-adherence.html) extension is defined for use on Observation or MedicationStatement, but no profile in this guide includes it, and its parts have no value set bindings yet.
8. **Iron chelation indication codes.** The `indicationCode` part of the [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) extension has no value set binding yet.
9. **Several profiles add few or no constraints.** The USCDI-SCD Practitioner, PractitionerRole, Organization, Location and Medication profiles add no constraints to their US Core parents, and USCDI-SCD Vital Signs only constrains its subject to the USCDI-SCD Patient profile. They exist so that the other profiles can reference a consistent set of USCDI-SCD profiles.

#### USCDI+ SCD Coverage

10. **Data elements not fully covered.** Of the 75 data elements in ONC's Version 1 USCDI+ SCD lists, two are not represented in this guide (Variant Interpretation and Blood Transfusion Product Blood Type) and three are only partly represented (Blood Genotype, Blood Transfusion Product Antibody and Blood Transfusion Product Antigen). See [USCDI+ SCD Data Elements](uscdi-plus.html#gaps-and-partial-coverage).

#### Test Data and Publication

11. **One test patient.** The [Test Data](testing.html) covers a single fictional patient. Test data for other SCD subtypes, ages and missing-data cases is planned.
12. **HL7 Jira specification not yet registered.** The HL7 Jira specification for this guide has not yet been created, so change requests made with the **Propose a change** link may not yet be associated with this guide.
13. **Dependency versions.** This guide is built on US Core 8.0.1 and the FHIR Extensions Pack 5.1.0 (R4). Newer versions of both packages, including US Core 9.0.0, have been published.

---

### Open Questions

#### Exchange Workflow

These questions are also noted on the [Exchange Workflow](workflow.html) page, in the step they affect.

1. **Record location.** How does the client find which systems hold the patient's records, especially when more than one EHR system holds them?
2. **Patient matching.** Which matching method should be used (for example, a FHIR search, the FHIR `Patient/$match` operation or a network record locator), and which demographics?
3. **No match or multiple matches.** What should the client do when no patient, or more than one candidate patient, is found?
4. **Authorization.** Does SMART App Launch (standalone and EHR launch) fit exchange between organizations, or is system-to-system authorization also needed? Which SMART scopes must clients request?
5. **SCD-focused query.** Which resources and searches make up an "SCD-focused query" for each use case, and are results narrowed (for example, by code or date range)?
6. **"Task-based" query.** What does "task-based" mean in the description of the query (for example, whether the FHIR Task resource is used)?
7. **Blood product retrieval.** How should clients retrieve BiologicallyDerivedProduct records for a patient, given Known Issue 6?
8. **SCD-specific search requirements.** Are any search parameters needed beyond those US Core requires?
9. **Client requirements.** Are there SCD-specific requirements for clients beyond those in the [Client CapabilityStatement](CapabilityStatement-uscdi-scd-client.html)?
10. **Write-back.** In the SCD Diagnosis use case, is a shared SCD diagnosis only recorded in the receiving system, or is it also sent back to another system?

#### Terminology

11. **SCD subtype and evidence.** Should the SCD subtype continue to be carried only in the diagnosis code (`Condition.code`) rather than in a separate extension? Should supporting laboratory results be linked through `Condition.evidence.detail`, and should `evidence.detail` (rather than `evidence.id`) be Must Support?
12. **Sickle cell trait.** Does the SNOMED CT concept 417357006 (Sickling disorder due to hemoglobin S), included in the [SCD Diagnosis Value Set](ValueSet-scd-diagnosis-vs.html), also cover sickle cell trait, which is not a form of SCD?
13. **Binding strength.** Should any SCD value set be bound more strongly than example strength, or should the guide continue to rely on the US Core bindings?
14. **Observation categories.** Should the [SCD Observation Category](CodeSystem-scd-observation-category-cs.html) codes be aligned with LOINC Part codes or US Core observation categories, or submitted to HL7 Terminology (THO) or LOINC?
15. **Encounter reason.** Should `Encounter.reasonCode` be bound to an SCD encounter reason value set?

#### Content

16. **Connectathon.** The [exchange process diagram](scope_and_usage.html#in-scope) was tested at a connectathon; its name and date are still to be added. The diagram's middle link, which represents a data intermediary, is still to be labeled.
17. **Clinical review of the examples.** The fictional [example scenario](examples.html) is waiting for review by a hematologist for clinical realism.
18. **Future extensions.** Should a future version add an extension for the patient's preferred SCD treatment center?
