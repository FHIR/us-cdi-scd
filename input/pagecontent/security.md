{%- comment -%}
SECURITY AND PRIVACY PAGE — security.md
{%- endcomment -%}

### Security and Privacy

SCD data is highly sensitive. SCD disproportionately affects marginalized communities
and data breaches could lead to discrimination in employment, insurance, or social contexts. All HIPAA and 42 CFR Part 2 requirements must be assiduously adhered to.  
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


1. Genetic information (genotype) is covered by GINA (Genetic Information Nondiscrimination Act); may require additional access controls
2. Substance use / pain medication history. There is heightened sensitivity around opioid prescribing records for SCD patients
3. Mental health comorbidities are often documented alongside SCD
4. Race and ethnicity data used for health equity reporting may impact de-identification requirements
5. Pediatric patient data requires COPPA (Children's Online Privacy Protection Act) considerations for minors



---

### Recommendations for Implementers

- Implement role-based access control (RBAC) for SCD records
- Apply data segmentation for sensitive elements (genetic, substance use)
- Obtain patient consent before sharing genotype data
- Log all access to SCD patient records via FHIR AuditEvent
- Implement break-glass procedures for emergency access
- Follow NIST SP 800-53 security controls for health data systems

