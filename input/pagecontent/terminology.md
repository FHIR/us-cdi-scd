### Terminology

This page describes the code systems, value sets and local codes used in this guide. Using standard codes lets every system interpret SCD information the same way. For example, "HbSS disease" or "hemoglobin S percentage" means the same thing in every system.

All terminology requirements of [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/terminology.html) apply. The value sets below add SCD-specific codes on top of them.

---

### Value Sets

This guide defines nine value sets. Each name links to the full list of codes.

In line with the project's approach of not constraining the exchanged data, these value sets do not add any requirement beyond US Core. Most are **reference lists** of the codes commonly used in SCD care, which can help with tasks such as prioritizing what to display. Where a profile element already has a US Core binding (for example, LOINC for laboratory tests or RxNorm for medications), the US Core binding applies. Where this guide binds a value set, the binding strength is **example**: it shows the kinds of codes expected without requiring them.

| Value Set | Code systems | Used with | Binding |
|---|---|---|---|
| [SCD Diagnosis](ValueSet-scd-diagnosis-vs.html) | ICD-10-CM, SNOMED CT | `Condition.code` in [Condition Problems and Health Concerns](StructureDefinition-uscdi-scd-condition-problems.html): SCD diagnoses, covering all major SCD subtypes | Reference list (US Core preferred binding applies) |
| [SCD Acute Complication](ValueSet-scd-acute-complication-vs.html) | SNOMED CT, ICD-10-CM | `Condition.code` in [Condition Encounter Diagnosis](StructureDefinition-uscdi-scd-condition-encounter-diagnosis.html): acute complications such as VOC, acute chest syndrome, splenic sequestration and aplastic crisis | Reference list (US Core preferred binding applies) |
| [SCD Laboratory Panel](ValueSet-scd-laboratory-panel-vs.html) | LOINC | `Observation.code` in [Laboratory Result](StructureDefinition-uscdi-scd-laboratory-result.html): CBC, hemoglobin fractionation, hemolysis markers, iron studies, kidney and liver function, immunohematology | Reference list (US Core extensible binding applies) |
| [SCD Vital Signs](ValueSet-scd-vital-signs-vs.html) | LOINC | `Observation.code` in [Vital Signs](StructureDefinition-uscdi-scd-vital-signs.html): US Core vital signs plus the pain severity score used to assess VOC | Reference list (US Core extensible binding applies) |
| [SCD Medication](ValueSet-scd-medication-vs.html) | RxNorm | `Medication.code` in [Medication](StructureDefinition-uscdi-scd-medication.html) and `medication[x]` in [MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html): disease-modifying therapies, gene therapies, iron chelation agents and preventive antibiotics | Reference list (US Core extensible binding applies) |
| [SCD Procedure](ValueSet-scd-procedure-vs.html) | SNOMED CT | `Procedure.code` in [Procedure](StructureDefinition-uscdi-scd-procedure.html): transfusion, exchange transfusion, stem cell transplantation and monitoring procedures | Reference list (US Core preferred binding applies) |
| [SCD Blood Product Type](ValueSet-scd-blood-product-type-vs.html) | SNOMED CT | `productCode` in [BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html): red blood cell and hematopoietic progenitor cell products | Example |
| [SCD Blood Product Processing](ValueSet-scd-blood-product-processing-vs.html) | SCD Blood Product Processing (local) | `processing.procedure` in [BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html): processing steps such as leukoreduction, irradiation and antigen matching | Example |
| [SCD Red Cell Antigen](ValueSet-scd-red-cell-antigen-vs.html) | SNOMED CT | The [SCD Transfusion Red Cell Antigen Match Profile](StructureDefinition-scd-transfusion-antigen-match.html) extension: Rh, Kell, Duffy, Kidd and MNS antigens used for matching | Example |

These value sets are drafts. Some codes are still under terminology review. The value sets are intended for future submission to the [Value Set Authority Center (VSAC)](https://vsac.nlm.nih.gov/).

---

### Local Code Systems

This guide defines two local code systems for SCD concepts that standard terminologies do not cover.

#### [SCD Observation Category](CodeSystem-scd-observation-category-cs.html)
Categories that group SCD observations. They supplement, and do not replace, the standard HL7 observation categories (such as `laboratory` and `vital-signs`), so an observation can carry both.

| Code | Meaning |
|---|---|
| `hemoglobin-fractionation` | Hemoglobin fractionation or electrophoresis results (HbS %, HbF %, HbA %, HbA2 %, HbC %) |
| `iron-overload-assessment` | Iron overload assessment for patients on chronic transfusion (serum ferritin, liver iron concentration, transferrin saturation) |
| `transfusion-medicine` | Immunohematology and transfusion results (ABO/Rh typing, extended antigen phenotyping, antibody identification, crossmatch) |
| `scd-pain-assessment` | Pain severity assessments, such as numeric rating scale scores during a VOC |
| `scd-disease-monitoring` | Other SCD monitoring, such as functional asplenia markers, organ function screening and complication surveillance |

#### [SCD Blood Product Processing](CodeSystem-scd-blood-product-processing-cs.html)
Processing steps and attributes of blood products used for SCD transfusion, such as leukoreduction, irradiation, CMV-negative and HbS-negative (sickle cell trait negative) units, specific antigen-negative units, extended phenotype matching and fresh blood. These codes are used in `BiologicallyDerivedProduct.processing.procedure` (through the [SCD Blood Product Processing](ValueSet-scd-blood-product-processing-vs.html) value set) and may also appear in `productCode`.

---

### External Code Systems

| Code System | URI | Used for |
|---|---|---|
| SNOMED CT (US Edition) | `http://snomed.info/sct` | Diagnoses, procedures, blood products, antigens, findings |
| LOINC | `http://loinc.org` | Laboratory tests, vital signs, assessments |
| RxNorm | `http://www.nlm.nih.gov/research/umls/rxnorm` | Medications |
| ICD-10-CM | `http://hl7.org/fhir/sid/icd-10-cm` | Diagnoses (alongside SNOMED CT, for billing and reporting) |
| CPT | `http://www.ama-assn.org/go/cpt` | Procedures (alongside SNOMED CT) |
| UCUM | `http://unitsofmeasure.org` | Units of measure |
| HL7 Terminology | `http://terminology.hl7.org` | Encounter class, condition and observation categories, status codes |

[ISBT 128](https://www.isbt128.org/), the international standard for blood product coding, is planned for future versions of this guide, for blood product types and red cell antigens.

#### Coding guidance

- **Diagnoses:** the examples in this guide include both a SNOMED CT code and an ICD-10-CM code for SCD diagnoses (see the [SCD diagnosis example](Condition-maya-johnson-scd-diagnosis.html)), following US Core's Condition guidance.
- **Medications:** the USCDI-SCD Medication profile requires RxNorm codes where available. NDC codes may be added as an additional coding.
- **Laboratory results:** use LOINC codes, as US Core requires for laboratory observations.

---

### Terminology Licensing

SNOMED CT, LOINC, CPT and other code systems are subject to their own license terms. See the Intellectual Property Statements on the [Home](index.html) page.
