# USCDI + Sickle Cell Disease Implementation Guide (USCDI-SCD)

## Build & Environment
- **Requirements:** Node.js ≥ 18, Java 17+, SUSHI (`npm install -g fsh-sushi`).
- **Publisher:** `_build.sh` looks for `publisher.jar` in `input-cache/` first, then falls back to the parent directory. Run `_build.sh update` to download it into `input-cache/` if missing.
- **Build Commands:**
  - `_build.sh update`: Download/update `publisher.jar` and scripts.
  - `_build.sh build`: Full build (SUSHI + IG Publisher).
  - `_build.sh nosushi`: Build without SUSHI.
  - `_build.sh notx`: Build without TX server.
  - `_build.sh jekyll`: Run Jekyll build for narrative pages.
  - `_build.sh clean`: Clean temp directories and output.
- **Validation:** `sushi .` validates FSH and compiles to FHIR JSON.

## Architecture & Structure
- **FSH Source:** Located in `input/fsh/`.
  - `profiles/`: Resource profiles (Patient, Encounter, etc.).
  - `extensions/`: SCD-specific extensions.
  - `valuesets/` & `codesystems/`: Terminology.
  - `instances/`: Clinical examples.
- **Narrative Content:** Markdown files in `input/pagecontent/` mapped via `sushi-config.yaml`.
- **Output:** Generated FHIR JSON in `fsh-generated/` and web output in `output/`.

## Key Conventions
- **SUSHI Config:** `sushi-config.yaml` defines the IG identity, dependencies (US Core 8.0.1), and page navigation.
- **IG Publisher:** `ig.ini` points to the generated IG JSON and template.
- **Dependencies:** Always ensure `hl7.fhir.us.core` (8.0.1), `hl7.fhir.uv.extensions.r4` (5.1.0), and `us.nlm.vsac` (0.19.0) are correctly referenced.
- **Workflow:** `_build.sh` is the primary entrypoint. Use `update` first if the build fails due to missing artifacts.
