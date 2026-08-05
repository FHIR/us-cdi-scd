# USCDI+ Sickle Cell Disease (SCD) Implementation Guide

This repository contains the source for a FHIR R4 Implementation Guide (IG) supporting the United States Core Data for Interoperability Plus (USCDI+) Sickle Cell Disease (SCD) data use cases. The IG is modeled on other USCDI+ projects, including USCDI+ Behavioral Health (USCDI+ BH), and builds on existing US Core FHIR resources and profiles.

The IG supports two use cases:

1. **SCD Diagnosis** — ensuring that all individuals living with SCD are consistently and accurately identified across various care settings using structured data.
2. **SCD Emergency Care** — ensuring the treatment or interventions received by individuals living with SCD during an acute episode are consistent with care previously received and are adequately captured.

This draft IG is intended for Connectathon testing and piloting.

This repository contains the FHIR Shorthand (FSH) source for the
**USCDI + Sickle Cell Disease (USCDI-SCD) Implementation Guide**, an HL7
FHIR Implementation Guide for structured clinical data exchange for patients
with Sickle Cell Disease (SCD).

The USCDI-SCD IG defines FHIR R4 profiles, extensions, value sets, code systems,
and example instances that extend [US Core 8.0.1](http://hl7.org/fhir/us/core/STU8.0.1/)
to address SCD-specific data exchange needs.



## FHIR Foundation Project Statement

* **Maintainers:** Kahuina Consulting, LLC on contract with the Office of the National Coordinator for Health IT (ONC).
* **Issues / Discussion:** There are no anticipated issues at this time. The draft IG is intended for Connectathon testing and piloting and uses existing US Core FHIR resources and profiles. Issues and suggestions may be submitted via [GitHub Issues](https://github.com/FHIR/us-cdi-scd/issues).
* **License:** [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).
* **Contribution Policy:** This initial draft was developed with input from patients, clinicians, researchers, and the FHIR community. Contributions are welcome from any community that may benefit or be affected by this work. The testing team will collect issues and suggestions via GitHub Issues, and from the testing partners during the Connectathon. All contributions will be reviewed by the maintainers for alignment with project goals and ONC requirements and triaged appropriately.
* **Security Information:** This repository contains code to build an IG for proof-of-concept testing and piloting. Piloting will not include production systems or live patient data. Any identified security concerns will be reported to the testing team. In production implementations, the IG will be used by hospital and provider EHRs and similar systems and inherit the security features of those systems.
* **Compliance Information:** This specification and its reference implementation are tested using standard FHIR validation tools, including the HL7 FHIR Validator and IG Publisher. Conformance is aligned with the US Core Implementation Guide and relevant ONC interoperability testing requirements for the Connectathon.

## Repository Structure

```
├── sushi-config.yaml               # SUSHI configuration (canonical, deps, pages, menu)
├── ig.ini                          # IG Publisher configuration
├── package.json                    # NPM package manifest
│
├── input/
│   ├── fsh/                        # FHIR Shorthand source files
│   │   ├── SCD_Aliases.fsh         # Code system and URI aliases
│   │   ├── profiles/
│   │   │   ├── SCD_Administrative.fsh      # Patient, Practitioner, Org, Location
│   │   │   ├── SCD_EncounterCondition.fsh  # Encounter, Conditions
│   │   │   ├── SCD_CareManagement.fsh      # AllergyIntolerance, CarePlan, ServiceRequest, Medication
│   │   │   └── SCD_ClinicalData.fsh        # Procedure, Lab, Vital Signs, BiologicallyDerivedProduct
│   │   ├── extensions/
│   │   │   └── SCD_Extensions.fsh          # SCD-specific FHIR extensions
│   │   ├── valuesets/
│   │   │   └── SCD_ValueSets.fsh           # Value set definitions
│   │   ├── codesystems/
│   │   │   └── SCD_CodeSystems.fsh         # Local code system definitions
│   │   └── instances/
│   │       ├── SCD_Examples.fsh            # Clinical example instances
│   │       └── SCD_CapabilityStatements.fsh # Server/Client CapabilityStatements
│   │
│   └── pagecontent/                # Markdown narrative pages
│       ├── index.md                # Home page
│       ├── introduction.md         # Introduction
│       ├── background.md           # Clinical & policy background
│       ├── scope_and_usage.md      # Scope, use cases
│       ├── overview.md             # Architecture overview, data element mapping
│       ├── audience.md             # Intended audiences
│       ├── conformance.md          # Must Support, conformance requirements
│       ├── profiles.md             # Profile narrative descriptions
│       ├── extensions.md           # Extension descriptions
│       ├── terminology.md          # Value sets and code systems
│       ├── security.md             # Security and privacy guidance
│       ├── downloads.md            # Downloadable artifacts
│       └── changes.md              # Change log
│
└── _build.sh                       # Build script (SUSHI + IG Publisher, see also _build.bat)
```


## Included Profiles

| Profile | Base Resource | Parent Profile |
|---|---|---|
| USCDI-SCD Patient | Patient | US Core Patient 8.0.1 |
| USCDI-SCD Practitioner | Practitioner | US Core Practitioner 8.0.1 |
| USCDI-SCD PractitionerRole | PractitionerRole | US Core PractitionerRole 8.0.1 |
| USCDI-SCD Organization | Organization | US Core Organization 8.0.1 |
| USCDI-SCD Location | Location | US Core Location 8.0.1 |
| USCDI-SCD Encounter | Encounter | US Core Encounter 8.0.1 |
| USCDI-SCD Condition Encounter Diagnosis | Condition | US Core Condition Encounter Diagnosis 8.0.1 |
| USCDI-SCD Condition Problems and Health Concerns | Condition | US Core Condition Problems and Health Concerns 8.0.1 |
| USCDI-SCD AllergyIntolerance | AllergyIntolerance | US Core Allergy Intolerance 8.0.1 |
| USCDI-SCD CarePlan | CarePlan | US Core CarePlan 8.0.1 |
| USCDI-SCD ServiceRequest | ServiceRequest | US Core ServiceRequest 8.0.1 |
| USCDI-SCD Medication | Medication | US Core Medication 8.0.1 |
| USCDI-SCD Procedure | Procedure | US Core Procedure 8.0.1 |
| USCDI-SCD Laboratory Result | Observation | US Core Laboratory Result Observation 8.0.1 |
| USCDI-SCD Vital Signs | Observation | US Core Vital Signs 8.0.1 |
| USCDI-SCD BiologicallyDerivedProduct | BiologicallyDerivedProduct | FHIR 4.0.1 Base (no US Core parent) |

## Extensions

| Extension | Context | Purpose |
|---|---|---|
| `scd-genotype` | Condition | SCD genotype/subtype (HbSS, HbSC, etc.) |
| `scd-transfusion-antigen-match` | BiologicallyDerivedProduct, Procedure | Red cell antigen matching criteria |
| `scd-hydroxyurea-adherence` | MedicationStatement, Observation | Hydroxyurea adherence level and method |
| `scd-voc-frequency` | Condition | VOC episode frequency over a defined period |
| `scd-blood-product-age` | BiologicallyDerivedProduct | Blood product age in days at transfusion |
| `scd-iron-chelation-indication` | MedicationRequest | Iron chelation trigger and threshold |
| `scd-newborn-screen-reference` | Condition, Patient | Link to original newborn screening result |

## Prerequisites

- **[Node.js](https://nodejs.org/) ≥ 18** (required for SUSHI)
- **[SUSHI](https://fshschool.org/)** (FSH compiler): `npm install -g fsh-sushi`
- **Java 17+** (required for IG Publisher)
- **[HL7 IG Publisher](https://github.com/HL7/fhir-ig-publisher/releases)**: `_build.sh update` downloads `publisher.jar` into `input-cache/` (it also checks the parent directory as a fallback)


## Building the IG

This IG is built with the standard HL7 tooling ([FHIR Shorthand / SUSHI](https://github.com/FHIR/sushi) and the [HL7 IG Publisher](https://github.com/HL7/fhir-ig-publisher)).

1. Clone this repository.
2. Run the publisher update script to download the latest IG Publisher:
   - macOS/Linux: `./_updatePublisher.sh`
   - Windows: `_updatePublisher.bat`
3. Build the IG:
   - macOS/Linux: `./_genonce.sh`
   - Windows: `_genonce.bat`

The generated output is written to the `output/` directory; open `output/index.html` to view the build.


## Key TODOs Before Ballot

- [ ] Complete all narrative page content (marked `TODO` in .md files)
- [ ] Submit value sets to VSAC and update canonical URIs
- [ ] Confirm all RxNorm concept IDs for SCD medications
- [ ] Confirm SNOMED CT concept codes (US edition)
- [ ] Add ISBT 128 code system registration and product codes
- [ ] Complete CapabilityStatement search parameter definitions
- [ ] Define SMART on FHIR scope requirements
- [ ] Add CarePlan and ServiceRequest examples
- [ ] Add pediatric patient example
- [ ] Review extensions against hl7.fhir.uv.extensions.r4 for reuse opportunities
- [ ] Conduct clinical SME review of profiles and value sets
- [ ] Submit for HL7 ballot (STU1)

## Contributing

<!-- TODO: Add contributing guidelines, GitHub issue template link,
     HL7 Jira project link, and work group meeting schedule. -->

Issues and pull requests welcome. Please follow [HL7 FHIR IG development conventions](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation).
