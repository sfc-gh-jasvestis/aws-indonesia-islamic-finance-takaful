-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Takaful Insurance Analytics
-- ============================================================================
USE DATABASE TAKAFUL_ANALYTICS;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.TAKAFUL_INTELLIGENCE_AGENT
  COMMENT = 'Takaful Insurance Analytics AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'TAKAFUL_ANALYTICS.APP.TAKAFUL_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'TAKAFUL_ANALYTICS.SEARCH.UNDERWRITING_DOCS_SEARCH', TOOL_DESCRIPTION => 'Search documents for Islamic Finance information')
  )
  SYSTEM_PROMPT = 'You are the Takaful Intelligence Agent for an Indonesian general and family Takaful operator managing 200,000 policies with Rp 8.5 trillion in contributions.';
