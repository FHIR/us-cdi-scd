### Extensions

This guide defines seven extensions for SCD-specific information that neither FHIR R4 nor US Core can represent. Each heading links to the formal extension definition. All extensions are included in the FHIR package on the [Downloads](downloads.html) page.

#### Summary

| Extension | Part of profile | Type | Purpose |
|---|---|---|---|
| [SCD Genotype](StructureDefinition-scd-genotype.html) | [Condition Problems](StructureDefinition-uscdi-scd-condition-problems.html) (MS) | CodeableConcept | The patient's confirmed SCD genotype |
| [SCD Vaso-Occlusive Crisis Frequency](StructureDefinition-scd-voc-frequency.html) | [Condition Problems](StructureDefinition-uscdi-scd-condition-problems.html) (MS) | Complex | How often VOC episodes occur |
| [SCD Newborn Screen Reference](StructureDefinition-scd-newborn-screen-reference.html) | [Condition Problems](StructureDefinition-uscdi-scd-condition-problems.html), [Patient](StructureDefinition-uscdi-scd-patient.html) | Reference | The newborn screening result that identified SCD |
| [SCD Hydroxyurea Adherence](StructureDefinition-scd-hydroxyurea-adherence.html) | None yet (may be used on an Observation) | Complex | How consistently the patient takes hydroxyurea |
| [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html) | [MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html) (MS) | Complex | Why iron chelation therapy was started |
| [SCD Transfusion Red Cell Antigen Match Profile](StructureDefinition-scd-transfusion-antigen-match.html) | [BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) (MS), [Procedure](StructureDefinition-uscdi-scd-procedure.html) | Complex | Which red cell antigens were matched for a transfusion |
| [SCD Blood Product Age at Transfusion](StructureDefinition-scd-blood-product-age.html) | [BiologicallyDerivedProduct](StructureDefinition-uscdi-scd-biologicallyderivedproduct.html) (MS) | Quantity (days) | How old the blood product was when transfused |

"Complex" extensions are made up of several named parts, described below. (MS) means the extension is Must Support in that profile.

---

### Diagnosis and Disease History

#### [SCD Genotype](StructureDefinition-scd-genotype.html)
Records the patient's confirmed SCD genotype, such as HbSS, HbSC, HbS-β⁰-thalassemia or HbS-β⁺-thalassemia, on the Condition representing the primary SCD diagnosis. The genotype is coded from the [SCD Genotype Value Set](ValueSet-scd-genotype-vs.html) (extensible binding).

Genotype matters because it affects treatment and transfusion decisions. For example, genotype determines which patients NHLBI 2014 recommends for hydroxyurea (HbSS and HbS-β⁰), and patients with HbSC have higher baseline hemoglobin, which affects the choice between simple and exchange transfusion. It also supports quality measurement and population health reporting. Genotype is confirmed by hemoglobin fractionation or genetic testing, and the Condition's `verificationStatus` should reflect whether it has been confirmed.

*Example:* [Condition — HbSS Sickle Cell Disease](Condition-maya-johnson-scd-diagnosis.html)

#### [SCD Vaso-Occlusive Crisis Frequency](StructureDefinition-scd-voc-frequency.html)
Records how many vaso-occlusive crisis (VOC) episodes the patient had over a period of time. It is used on the Condition for the primary SCD diagnosis. VOC frequency is a key measure of disease severity and informs treatment decisions. For example, NHLBI 2014 recommends hydroxyurea for adults with sickle cell anemia who have 3 or more moderate to severe pain crises in 12 months, and ASH 2021 conditionally suggests stem cell transplant evaluation for patients with frequent pain episodes.

| Part | Type | Description |
|---|---|---|
| `episodeCount` (required) | integer | Number of VOC episodes in the period |
| `observationPeriod` (required) | Period | The period over which episodes were counted |
| `measurementMethod` | CodeableConcept | How episodes were counted, such as self-report, chart review or hospitalization records |

#### [SCD Newborn Screen Reference](StructureDefinition-scd-newborn-screen-reference.html)
Links a patient, or their SCD diagnosis, to the newborn screening result that first identified SCD. The value references an Observation (such as a hemoglobin fractionation result) or a DiagnosticReport (the complete newborn screening report). It supports care coordination between state newborn screening programs, follow-up programs and ongoing clinical care.

---

### Medications

#### [SCD Hydroxyurea Adherence](StructureDefinition-scd-hydroxyurea-adherence.html)
Records how consistently the patient takes hydroxyurea, a main disease-modifying therapy for SCD. Hydroxyurea reduces VOC, acute chest syndrome and mortality, but its benefit depends on consistent use; poor adherence is associated with more VOC episodes and hospitalizations. It can be used on an Observation that documents an adherence assessment.

| Part | Type | Description |
|---|---|---|
| `adherenceLevel` | CodeableConcept | The adherence level, such as high, moderate, low or non-adherent |
| `adherenceMethod` | CodeableConcept | How adherence was assessed, such as self-report, pharmacy refill records, lab markers or pill count |
| `assessmentDate` | date | When adherence was assessed |

#### [SCD Iron Chelation Indication](StructureDefinition-scd-iron-chelation-indication.html)
Records why iron chelation therapy was started for a patient with iron overload from chronic transfusion. Chelation is usually started when serum ferritin or liver iron concentration (measured by MRI) exceeds a threshold. This extension records the indication, the measure that triggered therapy and the value at which it was started. It is part of the [USCDI-SCD MedicationRequest](StructureDefinition-uscdi-scd-medicationrequest.html) profile.

| Part | Type | Description |
|---|---|---|
| `indicationCode` | CodeableConcept | The reason for starting chelation, such as transfusion hemosiderosis |
| `triggerMeasurement` | CodeableConcept | The lab or imaging measure, such as serum ferritin or liver iron concentration |
| `triggerValue` | Quantity | The value at which chelation was started |

*Example:* [MedicationRequest — Deferasirox Iron Chelation](MedicationRequest-maya-johnson-deferasirox-request.html)

---

### Transfusion

#### [SCD Transfusion Red Cell Antigen Match Profile](StructureDefinition-scd-transfusion-antigen-match.html)
Records which red cell antigens were matched when selecting blood for a transfusion. Many people with SCD receive frequent transfusions and are at high risk of developing antibodies to donor blood (alloimmunization). ASH 2020 recommends prophylactic matching for Rh (C, E or C/c, E/e) and K antigens, which reduces this risk. Matching for additional antigens, such as Fy<sup>a</sup>/Fy<sup>b</sup> (Duffy), Jk<sup>a</sup>/Jk<sup>b</sup> (Kidd) and S, is generally reserved for patients who have already formed antibodies.

This extension SHALL be used on the blood product when extended antigen matching was performed. It MAY also be used on the transfusion Procedure to document the matching that was ordered.

| Part | Type | Description |
|---|---|---|
| `matchedAntigen` (repeating) | CodeableConcept | Each antigen that was matched, from the [SCD Red Cell Antigen Value Set](ValueSet-scd-red-cell-antigen-vs.html) |
| `matchingProtocol` | string | The matching protocol used, such as "Extended 5-antigen match" |

*Example:* [BiologicallyDerivedProduct — Antigen-Matched pRBCs](BiologicallyDerivedProduct-prbcs-antigen-matched-example.html)

#### [SCD Blood Product Age at Transfusion](StructureDefinition-scd-blood-product-age.html)
Records the age of a blood product, in days from collection to transfusion. Some institutional protocols prefer fresher units for SCD exchange transfusion; national guidelines (NHLBI 2014, ASH 2020) do not set a storage-age requirement. The value is a quantity in days (UCUM unit `d`).

*Example:* [BiologicallyDerivedProduct — Antigen-Matched pRBCs](BiologicallyDerivedProduct-prbcs-antigen-matched-example.html)

---

### Extensions from Other Guides

USCDI-SCD profiles also inherit extensions from US Core, such as the US Core Race and Ethnicity extensions on Patient. See the [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/) guide for details.
