-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Takaful Insurance Analytics
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.TAKAFUL_ANALYTICS
  COMMENT = 'Takaful claims, underwriting, reserving, and fraud analytics'
AS
  TABLES (
    CURATED.CLAIMS_DASHBOARD AS claims_dashboard,CURATED.COMBINED_RATIO AS combined_ratio,CURATED.IBNR_RESERVE AS ibnr_reserve,CURATED.FRAUD_RISK_SCORE AS fraud_risk_score
  );
