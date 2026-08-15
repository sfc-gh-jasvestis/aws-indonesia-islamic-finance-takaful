-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Takaful Insurance Analytics
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_indonesia_islamic_finance_takaful_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: COMBINED_RATIO_ALERT
CREATE OR REPLACE ALERT APP.COMBINED_RATIO_ALERT
  WAREHOUSE = TAKAFUL_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Product line combined ratio exceeds 100% — underwriting review needed'
IF (EXISTS (
  SELECT 1 FROM CURATED.CLAIMS_DASHBOARD
  WHERE 1=1 -- Condition: Combined ratio exceeds 100% for any product line
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_indonesia_islamic_finance_takaful_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Takaful Insurance Analytics: Product line combined ratio exceeds 100% — underwriting review needed',
    'Product line combined ratio exceeds 100% — underwriting review needed'
  );

ALTER ALERT APP.COMBINED_RATIO_ALERT RESUME;

-- Alert: LARGE_LOSS_ALERT
CREATE OR REPLACE ALERT APP.LARGE_LOSS_ALERT
  WAREHOUSE = TAKAFUL_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Large loss claim registered — retakaful notification required'
IF (EXISTS (
  SELECT 1 FROM CURATED.CLAIMS_DASHBOARD
  WHERE 1=1 -- Condition: Single claim exceeds Rp 5 billion
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_indonesia_islamic_finance_takaful_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Takaful Insurance Analytics: Large loss claim registered — retakaful notification required',
    'Large loss claim registered — retakaful notification required'
  );

ALTER ALERT APP.LARGE_LOSS_ALERT RESUME;

