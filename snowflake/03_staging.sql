-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Takaful Insurance Analytics
-- Country: INDONESIA | Currency: IDR
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- POLICIES: 200,000 rows — Active Takaful policies across general, family, and health lines
-- CLAIMS: 80,000 rows — Claims records with status, reserve, and settlement data
-- CONTRIBUTIONS: 500,000 rows — Monthly contribution (premium) payments by policy and participant
-- UNDERWRITING_DOCS: 100 rows — Underwriting guidelines, risk assessment templates, and retakaful treaties
-- ACTUARIAL_STUDIES: 50 rows — Actuarial reserving studies, experience analysis, and surplus distribution reports
-- FRAUD_INDICATORS: 20,000 rows — Claims fraud indicators and investigation records
