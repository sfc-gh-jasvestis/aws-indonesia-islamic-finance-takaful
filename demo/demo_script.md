# Demo Script: Takaful Insurance Analytics
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake delivers Takaful actuarial intelligence — Dynamic Tables aggregate claims and premiums in real-time, ML.FORECAST projects IBNR reserves, and Cortex AI generates underwriting risk assessments from policy documents"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Ir. Wahyu Hidayat** | Chief Actuary | React App (SPCS) | Claims reserves, combined ratio, surplus distribution, retakaful capacity |
| **Siti Rahayu** | Claims Manager | Amazon QuickSight | Claims frequency, fraud detection, settlement turnaround, large loss events |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 6 tables | POLICIES (200000), CLAIMS (80000), CONTRIBUTIONS (500000), UNDERWRITING_DOCS (100), ACTUARIAL_STUDIES (50), FRAUD_INDICATORS (20000) |
| **CURATED** | 4 Dynamic Tables | CLAIMS_DASHBOARD, COMBINED_RATIO, IBNR_RESERVE, FRAUD_RISK_SCORE |
| **ML** | ML.FORECAST + ML.ANOMALY_DETECTION | Forecasting + anomaly detection |
| **AI** | COMPLETE, SUMMARIZE, AI_CLASSIFY | Classification + extraction |
| **Search** | Cortex Search | 100 documents indexed |
| **Agent** | TAKAFUL_INTELLIGENCE_AGENT | Semantic View + Search tools |


---

## The Story

Indonesia's Takaful insurance market is growing at 15% annually, but operators face rising claims frequency and sophisticated fraud attempts. A Chief Actuary managing Rp 8.5 trillion in contributions needs real-time claims visibility, ML-powered reserve projections, and AI-driven fraud detection — while ensuring surplus distribution to participants meets Shariah principles.

---

## Script

### [0:00–0:45] TAKAFUL OVERVIEW

**Show**: Takaful Overview tab

> "200,000 active policies across general, family, and health Takaful lines."

**Action**: Point at 200K policies and Rp 8.5T contributions

### [0:45–1:30] CLAIMS ANALYTICS

**Show**: Claims Analytics tab

> "80,000 claims processed — motor Takaful highest frequency at 12% of policies."

**Action**: Show claims frequency by product line

### [1:30–2:15] ACTUARIAL RESERVES

**Show**: Actuarial Reserves tab

> "IBNR reserve estimated at Rp 1.2 trillion — 8% above last quarter."

**Action**: Show claims development triangle

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Wahyu asks: 'How much surplus is available for participant distribution?'"

**Action**: Type surplus question

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Six Snowflake capabilities, six AWS services."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.FORECAST for IBNR reserve projection** — Only demo using ML.FORECAST for Islamic insurance reserve estimation
2. **ML.ANOMALY_DETECTION for claims fraud** — Only demo detecting fraudulent Takaful claims patterns with ML
3. **Dynamic Tables for real-time combined ratio** — Maintains live actuarial KPIs without batch processing
4. **Indonesian Takaful context** — Surplus distribution, participant model, retakaful, OJK compliance


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM TAKAFUL_ANALYTICS.RAW.POLICIES` → 200000
- [ ] `SELECT COUNT(*) FROM TAKAFUL_ANALYTICS.RAW.CLAIMS` → 80000
- [ ] `SELECT COUNT(*) FROM TAKAFUL_ANALYTICS.RAW.CONTRIBUTIONS` → 500000

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM TAKAFUL_ANALYTICS.ML.CLAIMS_RESERVE_FORECAST_RESULTS` → >0
- [ ] `SELECT COUNT(*) FROM TAKAFUL_ANALYTICS.ML.FRAUD_DETECTION_RESULTS WHERE IS_ANOMALY = TRUE` → >=300

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM TAKAFUL_ANALYTICS.AI.CLAIMS_CLASSIFICATION` → 80000

