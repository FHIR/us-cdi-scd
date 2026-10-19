{%- comment -%}
Section numbering fix for the generated CapabilityStatement page.
The IG Publisher (3.0.x) renders the title twice (#root and #title), nests the
REST section and puts every resource five levels deep (for example
18.2.1.2.2.2). These rules give the same layout as the US Core
CapabilityStatement pages:
  18.2.1      CapabilityStatement title
  18.2.1.1    SHALL Support the Following Implementation Guides
  18.2.1.2    FHIR RESTful Capabilities (the "Mode" panel is not numbered)
  18.2.1.3    Capabilities by Resource/Profile
  18.2.1.3.n  Summary, then one section per resource
The rules are tied to the publisher's element ids and heading levels, so check
this page's numbering after upgrading the IG Publisher.
{%- endcomment -%}
<style>
  #title:before, #mode1:before { content: none; counter-increment: none; }
  #title { counter-reset: none; }
  #shallIGs:before, #rest:before, #resourcesCap1:before {
    counter-increment: sub-section;
    content: var(--heading-prefix) "." counter(section) "." counter(sub-section) " ";
  }
  #shallIGs, #rest, #mode1 { counter-reset: none; }
  #resourcesCap1 { counter-reset: composite; }
  h5:before {
    counter-increment: composite;
    content: var(--heading-prefix) "." counter(section) "." counter(sub-section) "." counter(composite) " ";
  }
</style>
