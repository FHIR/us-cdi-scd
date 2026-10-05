### Test Data

This page provides test data for implementers and testers, built from the fictional Maya Johnson scenario described on the [Examples](examples.html) page. All test data is fictional and contains no real patient information.

The test Bundles reuse the example records, so they always match the examples, and they are validated against the profiles every time this guide is built.

For a complete list of profile elements, cardinalities and bindings to test against, see the [Data Element Mapping](data-element-mapping.html) page and its CSV download.

---

### Loading the Test Data

The transaction Bundle contains all 19 records in the Maya Johnson scenario.

| Bundle | Download | Contents |
|---|---|---|
| [Maya Johnson Complete Record (Transaction)](Bundle-maya-johnson-test-data-transaction.html) | [JSON](Bundle-maya-johnson-test-data-transaction.json) · [XML](Bundle-maya-johnson-test-data-transaction.xml) | Every example record: patient, care team, encounter, conditions, allergy, observations, medications, transfusion order, procedure, blood product and care plan |

To load it, POST the Bundle to the base URL of a FHIR R4 server:

```
POST [base]
Content-Type: application/fhir+json

(contents of Bundle-maya-johnson-test-data-transaction.json)
```

Each entry uses `PUT` with the record's id (for example, `PUT Patient/maya-johnson-patient`), so the load can be repeated without creating duplicate records. The server must allow clients to assign resource ids.

---

### Expected Search Results

After loading the test data, a conformant USCDI-SCD server should return the results below for these searches, which are listed in the [USCDI-SCD Server CapabilityStatement](CapabilityStatement-uscdi-scd-server.html). Each searchset Bundle shows the expected response.

| Search | Expected results | Expected response |
|---|---|---|
| `GET [base]/Patient?identifier=http://example.org/metro-scd-center/mrn\|SCD-2024-00142` | 1 Patient | [Bundle](Bundle-maya-johnson-search-patient.html) ([JSON](Bundle-maya-johnson-search-patient.json)) |
| `GET [base]/Condition?patient=maya-johnson-patient` | 2 Conditions: the problem list SCD diagnosis and the ED encounter diagnosis | [Bundle](Bundle-maya-johnson-search-conditions.html) ([JSON](Bundle-maya-johnson-search-conditions.json)) |
| `GET [base]/Observation?patient=maya-johnson-patient&category=laboratory` | 1 Observation: hemoglobin fractionation | [Bundle](Bundle-maya-johnson-search-labs.html) ([JSON](Bundle-maya-johnson-search-labs.json)) |
| `GET [base]/Observation?patient=maya-johnson-patient&category=vital-signs` | 2 Observations: SpO2 and pain score | [Bundle](Bundle-maya-johnson-search-vitals.html) ([JSON](Bundle-maya-johnson-search-vitals.json)) |
| `GET [base]/MedicationRequest?patient=maya-johnson-patient&intent=order&_include=MedicationRequest:medication` | 2 MedicationRequests (hydroxyurea, deferasirox), plus 1 included Medication (hydroxyurea) | [Bundle](Bundle-maya-johnson-search-medicationrequests.html) ([JSON](Bundle-maya-johnson-search-medicationrequests.json)) |

When comparing a server's response with the expected Bundle, compare which records are returned and their search mode (`match` or `include`). Server-specific values such as `Bundle.id`, `meta.lastUpdated`, `fullUrl` and link URLs will differ.

<!-- TODO: Add test data for additional patients (for example, a pediatric
     HbS-beta-0 patient, an HbSC adult, an alloimmunized patient) and a
     missing-data patient that exercises Data Absent Reason and Must Support
     handling. -->
