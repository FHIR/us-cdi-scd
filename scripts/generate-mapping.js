#!/usr/bin/env node
// ==============================================================================
// generate-mapping.js
//
// Generates the USCDI-SCD data element mapping chart from the profile
// StructureDefinitions, so the chart always matches the profiles.
//
// Inputs (run AFTER a full IG Publisher build, from the repo root):
//   output/StructureDefinition-*.json         profile and extension snapshots
//   fsh-generated/resources/*.json            differentials, value sets, examples
//
// Outputs:
//   input/pagecontent/data-element-mapping.md       the IG page
//   input/images/uscdi-scd-data-element-mapping.csv the tester download
//
// Usage:  node scripts/generate-mapping.js
// Then rebuild the IG so the regenerated page is published.
// ==============================================================================

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const OUTPUT = path.join(ROOT, 'output');
const GEN = path.join(ROOT, 'fsh-generated', 'resources');
const PAGE = path.join(ROOT, 'input', 'pagecontent', 'data-element-mapping.md');
const CSV = path.join(ROOT, 'input', 'images', 'uscdi-scd-data-element-mapping.csv');
const CANON = 'http://hl7.org/fhir/us/uscdi-scd/';

// Use cases from the Scope and Usage page (key profiles per use case).
const USE_CASES = {
  'uscdi-scd-patient': ['Transfer of Care', 'Emergency Department'],
  'uscdi-scd-condition-problems': ['Transfer of Care'],
  'uscdi-scd-laboratory-result': ['Transfer of Care', 'Emergency Department'],
  'uscdi-scd-practitioner': ['Transfer of Care'],
  'uscdi-scd-practitionerrole': ['Transfer of Care'],
  'uscdi-scd-organization': ['Transfer of Care'],
  'uscdi-scd-encounter': ['Emergency Department'],
  'uscdi-scd-condition-encounter-diagnosis': ['Emergency Department'],
  'uscdi-scd-vital-signs': ['Emergency Department'],
  'uscdi-scd-medicationrequest': ['Emergency Department'],
  'uscdi-scd-careplan': ['Emergency Department'],
};

// Display order (matches the Profiles page).
const ORDER = [
  'uscdi-scd-patient', 'uscdi-scd-practitioner', 'uscdi-scd-practitionerrole',
  'uscdi-scd-organization', 'uscdi-scd-location', 'uscdi-scd-encounter',
  'uscdi-scd-condition-problems', 'uscdi-scd-condition-encounter-diagnosis',
  'uscdi-scd-medication', 'uscdi-scd-medicationrequest',
  'uscdi-scd-allergyintolerance', 'uscdi-scd-careplan',
  'uscdi-scd-servicerequest', 'uscdi-scd-procedure',
  'uscdi-scd-laboratory-result', 'uscdi-scd-vital-signs',
  'uscdi-scd-biologicallyderivedproduct',
];

const readJson = (f) => JSON.parse(fs.readFileSync(f, 'utf8'));

// --- Load resources ---------------------------------------------------------
const titles = {}; // canonical -> title, for all local and dependency artifacts
for (const f of fs.readdirSync(GEN).filter((n) => n.endsWith('.json'))) {
  const r = readJson(path.join(GEN, f));
  if (r.url) titles[r.url] = r.title || r.name;
}

const profiles = {};
const extensions = {};
for (const f of fs.readdirSync(OUTPUT).filter((n) => /^StructureDefinition-.*\.json$/.test(n))) {
  const sd = readJson(path.join(OUTPUT, f));
  if (!sd.url || !sd.url.startsWith(CANON) || !sd.snapshot) continue;
  if (sd.type === 'Extension') extensions[sd.url] = sd;
  else profiles[sd.id] = sd;
}

const differentialIds = (id) => {
  const f = path.join(GEN, `StructureDefinition-${id}.json`);
  if (!fs.existsSync(f)) return new Set();
  return new Set((readJson(f).differential?.element || []).map((e) => e.id));
};

// Parent profiles (US Core and FHIR core) from the local FHIR package cache,
// used to tell whether this guide actually changed an element.
const PKG = path.join(process.env.USERPROFILE || process.env.HOME, '.fhir', 'packages');
const parentCache = {};
function loadParent(url) {
  if (parentCache[url] !== undefined) return parentCache[url];
  parentCache[url] = null;
  for (const pkg of ['hl7.fhir.us.core#8.0.1', 'hl7.fhir.r4.core#4.0.1']) {
    const dir = path.join(PKG, pkg, 'package');
    if (!fs.existsSync(dir)) continue;
    for (const f of fs.readdirSync(dir).filter((n) => n.startsWith('StructureDefinition-'))) {
      const sd = readJson(path.join(dir, f));
      if (sd.title || sd.name) titles[sd.url] = sd.title || sd.name;
      if (sd.url === url) parentCache[url] = sd;
    }
  }
  return parentCache[url];
}

const sig = (e) => JSON.stringify([
  e.min, e.max, !!e.mustSupport,
  (e.type || []).map((t) => [t.code, (t.targetProfile || []).map((p) => p.split('|')[0]).sort()]),
  e.binding?.valueSet?.split('|')[0] || '', e.binding?.strength || '',
]);

// True when this guide adds the element or changes its cardinality, Must
// Support flag, types/targets or binding compared with the parent profile.
function changedFromParent(e, parentById) {
  const p = parentById.get(e.id);
  return !p || sig(p) !== sig(e);
}

// Examples per profile (by meta.profile).
const examplesByProfile = {};
for (const f of fs.readdirSync(GEN).filter((n) => n.endsWith('.json'))) {
  const r = readJson(path.join(GEN, f));
  if (['StructureDefinition', 'ValueSet', 'CodeSystem', 'ImplementationGuide', 'CapabilityStatement', 'Bundle'].includes(r.resourceType)) continue;
  for (const p of r.meta?.profile || []) {
    (examplesByProfile[p] ||= []).push({ type: r.resourceType, id: r.id });
  }
}

// --- Helpers ----------------------------------------------------------------
const shortName = (url) => {
  const base = url.split('|')[0];
  if (titles[base]) return titles[base];
  return base.split('/').pop();
};

const typeText = (e) => (e.type || []).map((t) => {
  if (t.code === 'Extension' && t.profile) return `Extension(${t.profile.map(shortName).join(', ')})`;
  if (t.targetProfile) return `Reference(${t.targetProfile.map(shortName).join(' | ')})`;
  return t.code;
}).join(' | ');

const bindingText = (e) => {
  if (!e.binding?.valueSet) return '';
  return `${shortName(e.binding.valueSet)} (${e.binding.strength})`;
};

const SKIP = /\.(id|meta|implicitRules|language|text|contained|modifierExtension)$/;

// Keep Must Support elements, required elements under a kept parent, and
// extension slices this guide defines; skip infrastructure elements.
function selectElements(sd, diff) {
  const kept = new Set();
  const rows = [];
  const root = sd.type;
  for (const e of sd.snapshot.element) {
    if (e.id === root || SKIP.test(e.path)) continue;
    if (/\.extension$/.test(e.id) || /\.extension\.(url|value\[x\])$/.test(e.path) && !e.sliceName) continue;
    const parentId = e.id.substring(0, e.id.lastIndexOf('.'));
    const parentKept = parentId === root || kept.has(parentId);
    const isExtSlice = /extension:[^.]+$/.test(e.id);
    const scdExtSlice = isExtSlice && diff.has(e.id);
    const include = e.mustSupport || (e.min >= 1 && parentKept) || scdExtSlice;
    if (!include || (!parentKept && !e.mustSupport && !scdExtSlice)) continue;
    kept.add(e.id);
    rows.push(e);
  }
  return rows;
}

const esc = (s) => String(s ?? '').replace(/\|/g, '\\|').replace(/\r?\n+/g, ' ').trim();
const csvCell = (s) => `"${String(s ?? '').replace(/"/g, '""').replace(/\r?\n+/g, ' ').trim()}"`;

// --- Build ------------------------------------------------------------------
const csvRows = [[
  'USCDI+ SCD Data Element (TODO)', 'Use Case', 'Profile', 'Element', 'Cardinality',
  'Must Support', 'Type', 'Binding', 'Source', 'Description',
]];

let md = `### Data Element Mapping

This page maps the data elements in this guide to their FHIR profiles and elements. It lists every Must Support element and every required element for each profile, with its cardinality, data type and terminology binding. It is generated from the profile definitions, so it always matches them.

**Download:** [uscdi-scd-data-element-mapping.csv](uscdi-scd-data-element-mapping.csv) (opens in Excel)

<!-- TODO: Add the data element names from the USCDI+ SCD project's data element
     list to this chart (the "USCDI+ SCD Data Element" column in the CSV). -->

#### How to read this chart

| Column | Meaning |
|---|---|
| Element | The FHIR element path. A name after a colon (for example, \`extension:scd-genotype\`) is a named slice. |
| Card. | Cardinality: minimum..maximum occurrences. A minimum of 1 means the element is required. |
| MS | **Y** means the element is Must Support. See [Must Support](conformance.html#must-support). |
| Type | The data type. For references, the profiles the reference must conform to. |
| Binding | The value set the element's codes come from, and the binding strength. |
| Source | **USCDI-SCD** if this guide adds or changes the element; **Inherited** if it comes unchanged from the parent profile (usually US Core). |

Elements inherited from US Core are included so testers can see every requirement in one place. Child elements are listed only when their parent is listed.

`;

const profileIds = ORDER.filter((id) => profiles[id]).concat(Object.keys(profiles).filter((id) => !ORDER.includes(id)));
const usedExtensions = new Set();

for (const id of profileIds) {
  const sd = profiles[id];
  const diff = differentialIds(id);
  const parentSd = loadParent(sd.baseDefinition);
  const parentById = new Map((parentSd?.snapshot?.element || []).map((e) => [e.id, e]));
  const parent = shortName(sd.baseDefinition);
  const useCases = (USE_CASES[id] || []).join(', ') || 'Supporting';
  const examples = (examplesByProfile[sd.url] || []).map((x) => `[${x.id}](${x.type}-${x.id}.html)`).join(', ');

  md += `---\n\n#### [${sd.title}](StructureDefinition-${id}.html)\n\n`;
  md += `**Parent:** ${parent} &nbsp;·&nbsp; **Use case:** ${useCases}${examples ? ` &nbsp;·&nbsp; **Examples:** ${examples}` : ''}\n\n`;
  md += '<div style="overflow-x:auto" markdown="1">\n\n';
  md += '| Element | Card. | MS | Type | Binding | Source | Description |\n|---|---|---|---|---|---|---|\n';

  for (const e of selectElements(sd, diff)) {
    for (const t of e.type || []) if (t.code === 'Extension') (t.profile || []).forEach((p) => usedExtensions.add(p.split('|')[0]));
    const source = changedFromParent(e, parentById) ? 'USCDI-SCD' : 'Inherited';
    const card = `${e.min}..${e.max}`;
    const ms = e.mustSupport ? 'Y' : '';
    md += `| \`${esc(e.id)}\` | ${card} | ${ms} | ${esc(typeText(e))} | ${esc(bindingText(e))} | ${source} | ${esc(e.short)} |\n`;
    csvRows.push(['', useCases, sd.title, e.id, card, ms, typeText(e), bindingText(e), source, e.short]);
  }
  md += '\n</div>\n\n';
}

// Extension detail: sub-elements of the SCD extensions used by the profiles.
md += `---\n\n#### Extension Details\n\nThe parts of each SCD extension used in the profiles above.\n\n`;
md += '<div style="overflow-x:auto" markdown="1">\n\n';
md += '| Extension | Part | Card. | Type | Binding | Description |\n|---|---|---|---|---|---|\n';
for (const url of [...usedExtensions].filter((u) => extensions[u]).sort()) {
  const sd = extensions[url];
  const link = `[${sd.title}](StructureDefinition-${sd.id}.html)`;
  const subs = sd.snapshot.element.filter((e) => /^Extension\.extension:[^.]+$/.test(e.id));
  const parts = subs.length
    ? subs.map((s) => ({ name: s.sliceName, e: s, v: sd.snapshot.element.find((x) => x.id === `${s.id}.value[x]`) }))
    : [{ name: '(value)', e: sd.snapshot.element.find((x) => x.id === 'Extension'), v: sd.snapshot.element.find((x) => x.id === 'Extension.value[x]') }];
  for (const p of parts) {
    const card = `${p.e.min}..${p.e.max}`;
    md += `| ${link} | ${p.name} | ${card} | ${esc(p.v ? typeText(p.v) : '')} | ${esc(p.v ? bindingText(p.v) : '')} | ${esc(p.e.short || sd.title)} |\n`;
    csvRows.push(['', '', sd.title, `${sd.id}:${p.name}`, card, '', p.v ? typeText(p.v) : '', p.v ? bindingText(p.v) : '', 'USCDI-SCD', p.e.short || sd.title]);
  }
}
md += '\n</div>\n';

fs.writeFileSync(PAGE, md, 'utf8');
fs.mkdirSync(path.dirname(CSV), { recursive: true });
fs.writeFileSync(CSV, '﻿' + csvRows.map((r) => r.map(csvCell).join(',')).join('\r\n') + '\r\n', 'utf8');
console.log(`Wrote ${path.relative(ROOT, PAGE)} and ${path.relative(ROOT, CSV)} (${csvRows.length - 1} rows, ${profileIds.length} profiles, ${usedExtensions.size} extensions).`);
