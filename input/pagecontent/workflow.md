### Exchange Workflow

This page describes how a USCDI-SCD exchange works, based on what this guide currently defines. The workflow shown in the [exchange process diagram](scope_and_usage.html#in-scope) was tested at a connectathon, where several query patterns were tried. Parts of the workflow that have not yet been defined are marked as open items within each step; a future project pilot or workshop may help resolve them. Comments on them are especially welcome.

---

### Actors

| Actor | Role | Requirements |
|---|---|---|
| **USCDI-SCD Server** (Responder) | A system that holds SCD patient data and returns it in response to queries, such as an EHR or health information exchange | [USCDI-SCD Server CapabilityStatement](CapabilityStatement-uscdi-scd-server.html) |
| **USCDI-SCD Client** (Requestor) | A system used by the provider who needs the patient's SCD information, such as a provider seeing the patient for the first time or an emergency department | [USCDI-SCD Client CapabilityStatement](CapabilityStatement-uscdi-scd-client.html) |

---

### Workflow Overview

Both [use cases](scope_and_usage.html#in-scope), SCD Diagnosis and SCD Emergency Care, follow the same pattern, shown in the [exchange process diagram](scope_and_usage.html#in-scope):

1. **Locate the patient.** When the patient presents to a new provider, a query is initiated to locate the patient's record. This may identify more than one EHR system that holds relevant information.
2. **Authorize access.** The client connects to the server using the security requirements in the CapabilityStatements.
3. **Retrieve SCD-relevant data.** Once the target system or systems are identified, an SCD-focused query retrieves the SCD-relevant resources.
4. **Use the data.** The client processes and displays the returned data, including Must Support elements and missing data.

Each step is described below.

---

### Step 1: Locate the Patient

The server CapabilityStatement requires servers to support the US Core 8.0.1 Server requirements, which include these Patient searches:

| Search | US Core expectation |
|---|---|
| `GET [base]/Patient?_id=[id]` | SHALL |
| `GET [base]/Patient?identifier=[system]\|[value]` | SHALL |
| `GET [base]/Patient?name=[name]&birthdate=[date]` | SHALL |

The [Test Data](testing.html) page includes an example search by identifier and its expected response.

<!-- TODO: Define how the client finds which systems hold the patient's records
     (record location), especially when the patient's records may be held by
     more than one EHR system. -->
<!-- TODO: Define the patient matching method (for example, a FHIR search,
     the FHIR Patient/$match operation, or a network record locator) and the
     demographics to use. -->
<!-- TODO: Define what the client does when no patient, or more than one
     candidate patient, is found. -->

**Open items:** how records are located across systems, the patient matching method, and how to handle no match or multiple matches.

---

### Step 2: Authorize Access

The server CapabilityStatement requires servers to:

- Support SMART on FHIR (standalone launch and EHR launch)
- Support TLS 1.2 or higher for all connections
- Support FHIR AuditEvent for access logging

See [Security and Privacy](security.html) for guidance on protecting SCD data.

<!-- TODO: Confirm whether SMART App Launch (standalone and EHR launch) fits
     the exchange pattern in the use cases, or whether system-to-system
     authorization between organizations is also needed. Define the SMART
     scopes clients must request. -->

**Open items:** whether the current authorization requirements fit exchange between organizations, and which SMART scopes clients need.

---

### Step 3: Retrieve SCD-Relevant Data

After locating the patient, the client retrieves the resources needed for its use case. The [Scope and Usage](scope_and_usage.html#in-scope) page identifies the key profiles for each use case:

| Use Case | Key profiles |
|---|---|
| A: SCD Diagnosis | Patient, Condition (Problems), Laboratory Result, Practitioner, PractitionerRole, Organization |
| B: SCD Emergency Care | Encounter, Condition (Encounter Diagnosis), Laboratory Result, Vital Signs, MedicationRequest, CarePlan |

The table below lists searches a client can use to retrieve these resources by patient. These are the searches that the US Core 8.0.1 Server CapabilityStatement requires servers to support (SHALL), which the USCDI-SCD Server CapabilityStatement adopts, plus the additional `_include` declared in the USCDI-SCD Server CapabilityStatement.

| Resource | Searches servers SHALL support | Notes |
|---|---|---|
| Condition | `patient`; `patient` + `category` | Category `problem-list-item` or `encounter-diagnosis` distinguishes the two Condition profiles |
| Observation | `patient` + `category`; `patient` + `category` + `date`; `patient` + `code` | Category `laboratory` for Laboratory Result; `vital-signs` for Vital Signs |
| Encounter | `patient`; `patient` + `date`; `_id` | |
| MedicationRequest | `patient` + `intent`; `patient` + `intent` + `status` | The USCDI-SCD Server CapabilityStatement also declares `_include=MedicationRequest:medication` |
| AllergyIntolerance | `patient` | |
| CarePlan | `patient` + `category` | |
| Procedure | `patient`; `patient` + `date` | |
| ServiceRequest | `patient`; `patient` + `category`; `patient` + `code`; `patient` + `category` + `authored` | |
| Practitioner | `identifier`; `name` | Referenced from the clinical resources above |
| PractitionerRole | `practitioner`; `specialty` | |
| Organization | `name`; `address` | |
| Location | `name`; `address` | |

Worked examples of these searches and their expected responses, using the fictional Maya Johnson test patient, are on the [Test Data](testing.html) page.

<!-- TODO: Define what an "SCD-focused query" is: which resources and searches
     are retrieved for each use case, and whether results are narrowed (for
     example, by code or date range). -->
<!-- TODO: Clarify what "task-based" means in the description of the query
     (for example, whether the FHIR Task resource is used). -->
<!-- TODO: Define how BiologicallyDerivedProduct (blood product) records are
     retrieved; FHIR R4 does not define a patient search parameter for this
     resource. -->
<!-- TODO: Add SCD-specific search parameter requirements to the server
     CapabilityStatement (its documentation lists candidates). -->

**Open items:** the definition of an "SCD-focused query" and of "task-based", how blood product records are retrieved, and any SCD-specific search requirements beyond US Core.

---

### Step 4: Use the Data

The client CapabilityStatement requires clients to:

- Process all Must Support elements in USCDI-SCD profiles without error
- Handle missing data using Data Absent Reason where applicable
- Display SCD-relevant clinical data in human-readable form

See [Must Support](conformance.html#must-support) and [Missing Data](conformance.html#missing-data) for the detailed rules.

In the SCD Diagnosis use case, documented SCD diagnoses and SCD subtype are shared between systems, so that the patient's record includes an SCD diagnosis with subtype.

<!-- TODO: Define whether, in the SCD Diagnosis use case, a shared SCD diagnosis
     is only recorded in the receiving system, or is also sent back to
     (written to) another system. -->

**Open item:** whether the SCD Diagnosis use case includes writing data back to another system.
