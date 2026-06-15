# USCDI+ Sickle Cell Disease (SCD) Implementation Guide

This repository contains the source for a FHIR R4 Implementation Guide (IG) supporting the United States Core Data for Interoperability Plus (USCDI+) Sickle Cell Disease (SCD) data use cases. The IG is modeled on other USCDI+ projects, including USCDI+ Behavioral Health (USCDI+ BH), and builds on existing US Core FHIR resources and profiles.

The IG supports two use cases:

1. **SCD Diagnosis** — ensuring that all individuals living with SCD are consistently and accurately identified across various care settings using structured data.
2. **SCD Emergency Care** — ensuring the treatment or interventions received by individuals living with SCD during an acute episode are consistent with care previously received and are adequately captured.

This draft IG is intended for Connectathon testing and piloting.

## FHIR Foundation Project Statement

* **Maintainers:** Kahuina Consulting, LLC on contract with the Office of the National Coordinator for Health IT (ONC).
* **Issues / Discussion:** There are no anticipated issues at this time. The draft IG is intended for Connectathon testing and piloting and uses existing US Core FHIR resources and profiles. Issues and suggestions may be submitted via [GitHub Issues](https://github.com/FHIR/us-cdi-scd/issues).
* **License:** [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).
* **Contribution Policy:** This initial draft was developed with input from patients, clinicians, researchers, and the FHIR community. Contributions are welcome from any community that may benefit or be affected by this work. The testing team will collect issues and suggestions via GitHub Issues, and from the testing partners during the Connectathon. All contributions will be reviewed by the maintainers for alignment with project goals and ONC requirements and triaged appropriately.
* **Security Information:** This repository contains code to build an IG for proof-of-concept testing and piloting. Piloting will not include production systems or live patient data. Any identified security concerns will be reported to the testing team. In production implementations, the IG will be used by hospital and provider EHRs and similar systems and inherit the security features of those systems.
* **Compliance Information:** This specification and its reference implementation are tested using standard FHIR validation tools, including the HL7 FHIR Validator and IG Publisher. Conformance is aligned with the US Core Implementation Guide and relevant ONC interoperability testing requirements for the Connectathon.

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

