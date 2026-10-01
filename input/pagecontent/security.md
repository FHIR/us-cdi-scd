{%- comment -%}
SECURITY AND PRIVACY PAGE — security.md
{%- endcomment -%}

### Security and Privacy

SCD data is highly sensitive. SCD disproportionately affects marginalized communities,
and data breaches could lead to discrimination in employment, insurance, or social contexts. Implementers SHALL comply with HIPAA and all other applicable federal and state privacy laws. Where exchanged data includes substance use disorder treatment records from programs covered by 42 CFR Part 2, those records are also subject to Part 2.

---

### General Security Guidance
Please refer to:

- FHIR Security (http://hl7.org/fhir/R4/security.html)
- US Core Security Guidance (http://hl7.org/fhir/us/core/security.html)
- SMART on FHIR for authentication and authorization
- TLS 1.2+ for transport security
- Audit logging (AuditEvent resource)


---

### Sensitive Data Considerations for SCD


1. **Genetic information.** Genotype and genetic test results are protected health information under HIPAA. The Genetic Information Nondiscrimination Act (GINA) prohibits the use of genetic information in health insurance and employment decisions; it does not cover life, disability or long-term care insurance. Implementers should consider additional access controls for genetic data.
2. **Substance use and pain medication history.** There is heightened sensitivity around opioid prescribing records for SCD patients. Substance use disorder treatment records from programs covered by 42 CFR Part 2 have additional restrictions.
3. **Mental health.** Mental health conditions are often documented alongside SCD.
4. **Race and ethnicity.** Race and ethnicity are not among the HIPAA Safe Harbor identifiers, but combined with an SCD diagnosis they can increase re-identification risk in small populations. Consider this when de-identifying data.
5. **Minors.** Access to minors' records is governed by HIPAA personal-representative rules and state minor-consent laws.



---

### Recommendations for Implementers

- Implement role-based access control (RBAC) for SCD records
- Apply data segmentation for sensitive elements (genetic, substance use)
- Obtain patient consent before sharing genotype data
- Log all access to SCD patient records via FHIR AuditEvent
- Implement break-glass procedures for emergency access
- Follow NIST SP 800-53 security controls for health data systems

