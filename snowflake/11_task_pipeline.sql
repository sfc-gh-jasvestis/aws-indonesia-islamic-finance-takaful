-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Takaful Insurance Analytics
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_REFRESH_CLAIMS
  WAREHOUSE = TAKAFUL_WH
  SCHEDULE = 'USING CRON 0 */2 * * * UTC'
  COMMENT = 'Refresh claims dashboard with latest registrations and settlements'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_SCORE_FRAUD
  WAREHOUSE = TAKAFUL_WH
  AFTER APP.TASK_REFRESH_CLAIMS
  COMMENT = 'Recalculate fraud risk scores for new claims'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_FORECAST_RESERVES
  WAREHOUSE = TAKAFUL_WH
  AFTER APP.TASK_SCORE_FRAUD
  COMMENT = 'Run IBNR reserve forecast by product line'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_FORECAST_RESERVES RESUME;
ALTER TASK APP.TASK_SCORE_FRAUD RESUME;
ALTER TASK APP.TASK_REFRESH_CLAIMS RESUME;
