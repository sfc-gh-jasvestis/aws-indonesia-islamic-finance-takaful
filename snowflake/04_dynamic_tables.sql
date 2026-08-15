-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Takaful Insurance Analytics
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA CURATED;

-- CLAIMS_DASHBOARD: Real-time claims frequency, severity, and development by product line
-- Source: CLAIMS, POLICIES
CREATE OR REPLACE DYNAMIC TABLE CURATED.CLAIMS_DASHBOARD
  TARGET_LAG = '5 minutes'
  WAREHOUSE = TAKAFUL_WH
AS
SELECT * FROM RAW.CLAIMS;
-- TODO: Replace with actual join/aggregation logic per demo

-- COMBINED_RATIO: Combined ratio calculation by product line with trend analysis
-- Source: CLAIMS, CONTRIBUTIONS, POLICIES
CREATE OR REPLACE DYNAMIC TABLE CURATED.COMBINED_RATIO
  TARGET_LAG = '5 minutes'
  WAREHOUSE = TAKAFUL_WH
AS
SELECT * FROM RAW.CLAIMS;
-- TODO: Replace with actual join/aggregation logic per demo

-- IBNR_RESERVE: IBNR reserve estimation using chain ladder and BF methods
-- Source: CLAIMS
CREATE OR REPLACE DYNAMIC TABLE CURATED.IBNR_RESERVE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = TAKAFUL_WH
AS
SELECT * FROM RAW.CLAIMS;
-- TODO: Replace with actual join/aggregation logic per demo

-- FRAUD_RISK_SCORE: Claims fraud risk scoring based on pattern analysis
-- Source: CLAIMS, FRAUD_INDICATORS
CREATE OR REPLACE DYNAMIC TABLE CURATED.FRAUD_RISK_SCORE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = TAKAFUL_WH
AS
SELECT * FROM RAW.CLAIMS;
-- TODO: Replace with actual join/aggregation logic per demo

