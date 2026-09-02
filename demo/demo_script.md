# Takaful Insurance Analytics

**Indonesia - Islamic Finance**
Use case: Takaful Insurance

> Claims analytics and actuarial intelligence for Indonesia's Takaful insurance market — ML.FORECAST projects claims reserves, Dynamic Tables build real-time underwriting dashboards, and Cortex AI generates risk assessments.

## Why Snowflake

Snowflake delivers Takaful actuarial intelligence — Dynamic Tables aggregate claims and premiums in real-time, ML.FORECAST projects IBNR reserves, and Cortex AI generates underwriting risk assessments from policy documents

- **ML.FORECAST for IBNR reserve projection** - Only demo using ML.FORECAST for Islamic insurance reserve estimation
- **ML.ANOMALY_DETECTION for claims fraud** - Only demo detecting fraudulent Takaful claims patterns with ML
- **Dynamic Tables for real-time combined ratio** - Maintains live actuarial KPIs without batch processing
- **Indonesian Takaful context** - Surplus distribution, participant model, retakaful, OJK compliance

## What is deployed

| | |
|---|---|
| Database | `ID_ISLAMIC_FINANCE_TAKAFUL` |
| Service | `ID_ISLAMIC_FINANCE_TAKAFUL_APP` |
| Compute pool | `SEA_DEMOS_INDONESIA_POOL` |
| Dimension table | `RAW.ACTUARIAL_STUDIES` (20 rows) |
| Fact table | `RAW.CONTRIBUTIONS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | IDR (Rp) |

Regions in play: Jakarta, North Sumatra, Riau, East Kalimantan, Sulawesi
Segments: Family Takaful, General Takaful, Health Takaful, Motor Takaful

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh ID_ISLAMIC_FINANCE_TAKAFUL
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| Gross Contributions | `Rp 14.2T` | total across Actuarial Studies |
| Claims Ratio | `62%` | average per event |
| Surplus Distributed | `Rp 1.8T` | total across Actuarial Studies |
| Policies Active | `4.2M` | total across Actuarial Studies |
| Loss Ratio Forecast | `64%` | average per event |
| Reserve Adequacy | `112%` | average per event |
| Persistency Rate | `84%` | average per event |


## Demo flow

1. Takaful Overview
2. Claims Analytics
3. Actuarial Reserves
4. Ask AI
5. Architecture & Data

## Talking points

- **200,000 policies** - across general, family, and health Takaful
- **Rp 8.5T** - annual contributions
- **94.2%** - combined ratio (profitable)
- **340 claims** - flagged for fraud investigation
- **Rp 1.2T IBNR** - incurred but not reported reserve

## Business impact

- Indonesia's Takaful industry assets reached Rp 45 trillion in 2023 with 15% CAGR (OJK)
- Claims fraud costs the Indonesian insurance industry Rp 8-12 trillion annually (AAUI)
- AI-powered fraud detection reduces fraudulent claims by 30-40% (McKinsey Insurance)
- Automated reserving reduces actuarial processing time by 60% (Deloitte Actuarial)

---
Generated from `generator/demo_specs/aws-indonesia-islamic-finance-takaful.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-indonesia-islamic-finance-takaful` instead.
