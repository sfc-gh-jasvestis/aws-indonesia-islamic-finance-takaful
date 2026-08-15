-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Takaful Insurance Analytics
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.UNDERWRITING_DOCS_SEARCH
  ON CONTENT
  ATTRIBUTES DOC_TYPE, PRODUCT_LINE, RISK_CATEGORY
  WAREHOUSE = TAKAFUL_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.UNDERWRITING_DOCS
);
