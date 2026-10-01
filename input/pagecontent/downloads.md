{%- comment -%}
DOWNLOADS PAGE — downloads.md
{%- endcomment -%}

### Downloads

The following artifacts are available for download:

<!-- TODO: Update links and checksums when the IG is published. -->

| Artifact | Description |
|---|---|
| [FHIR Package (NPM)](package.tgz) | Full FHIR package for validator and tooling |
| [Full IG](full-ig.zip) | The entire IG website, for offline viewing |
| [StructureDefinitions (JSON)](definitions.json.zip) | All profiles, extensions, value sets |
| [StructureDefinitions (XML)](definitions.xml.zip) | All profiles, extensions, value sets (XML) |
| [Examples (JSON)](examples.json.zip) | All example instances |
| [Examples (XML)](examples.xml.zip) | All example instances (XML) |
| [Schematron](schematrons.zip) | Schematron validation rules |
| [Data Element Mapping (CSV)](uscdi-scd-data-element-mapping.csv) | Every Must Support and required element, with cardinality, type and binding (see [Data Element Mapping](data-element-mapping.html)) |
| [Test Data Bundle (JSON)](Bundle-maya-johnson-test-data-transaction.json) | Transaction Bundle that loads the Maya Johnson test patient into a FHIR server (see [Test Data](testing.html)) |

---

### Tooling

The following tools are recommended for working with this IG:

- **[SUSHI](https://fshschool.org)** — FSH compiler (generates FHIR JSON from FSH)
- **[HL7 IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)** — Builds the full IG website
- **[HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)** — Validates FHIR instances against the profiles in this guide
- **[Simplifier.net](https://simplifier.net)** — Online FHIR registry and package hosting
- **[FSH Online](https://fshschool.org/FSHOnline/)** — Browser-based FSH editor
