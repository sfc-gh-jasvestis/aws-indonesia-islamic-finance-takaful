-- Generated from generator/demo_specs/aws-indonesia-islamic-finance-takaful.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-indonesia-islamic-finance-takaful
-- This is the schema that is actually deployed for ID_ISLAMIC_FINANCE_TAKAFUL.

-- ID_ISLAMIC_FINANCE_TAKAFUL  (Takaful Insurance Analytics)
-- generated from generator/demo_specs/aws-indonesia-islamic-finance-takaful.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS ID_ISLAMIC_FINANCE_TAKAFUL;
CREATE SCHEMA IF NOT EXISTS ID_ISLAMIC_FINANCE_TAKAFUL.RAW;
CREATE SCHEMA IF NOT EXISTS ID_ISLAMIC_FINANCE_TAKAFUL.CURATED;
CREATE SCHEMA IF NOT EXISTS ID_ISLAMIC_FINANCE_TAKAFUL.APP;
USE DATABASE ID_ISLAMIC_FINANCE_TAKAFUL;

-- 5 real regions; entity names carry their region so the two always agree
