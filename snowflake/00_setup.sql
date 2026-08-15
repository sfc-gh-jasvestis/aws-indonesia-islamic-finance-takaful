-- ============================================================================
-- Takaful Insurance Analytics
-- Claims analytics and actuarial intelligence for Indonesia's Takaful insurance market — ML.FORECAST projects claims reserves, Dynamic Tables build real-time underwriting dashboards, and Cortex AI generates risk assessments.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS TAKAFUL_ANALYTICS;
CREATE WAREHOUSE IF NOT EXISTS TAKAFUL_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE TAKAFUL_ANALYTICS;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE TAKAFUL_WH;
