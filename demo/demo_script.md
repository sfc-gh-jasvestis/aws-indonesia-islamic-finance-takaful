# Takaful Claims Operations

**Indonesia - Takaful Claims Operations**
Use case: claims notification, referral to claims investigation and claims-handling controls

> Claims monitoring for 40 takaful plans at a fictional Indonesian takaful operator across 5 cities: dynamic tables, a holdout-evaluated referral-risk classifier, a claims-volume forecast and grounded AI answers.

## Why Snowflake

- **Dynamic tables** reconcile contributions received, claims, referrals to investigation, settlement SLA breaches and claims file audit compliance from RAW plan data, with checks in `run_core.py`
- **Escalation classification** gives a holdout-evaluated probability per plan that a claim is referred to investigation in the next 7 days
- **Claims forecast** projects 14 days of operator-wide claims volume with prediction intervals, for claims staffing
- **Grounded AI**: the Cortex Agent (Analyst over a semantic view, plus Search over SOPs) shows its SQL and SOP citations
- **Live claims**: a native simulator (Snowflake only) or Firehose, S3 and Snowpipe (AWS build), then an alert and email

## What is built

| | |
|---|---|
| Dimension table | `RAW.PLANS` (40 rows) |
| Fact table | `RAW.PLAN_DAILY` (3,600 plan-days, 90 days) |
| Curated layer | `CURATED.KPI_SUMMARY`, `PERFORMANCE_SUMMARY`, `CLAIMS_SUMMARY`, `TREND_ANALYSIS` |
| ML | `ML.ESCALATION_RISK_SCORES`, `ML.ESCALATION_RISK_HOLDOUT_METRICS`, `ML.CLAIMS_FORECAST`, `ML.DOC_REJECT_ANOMALIES` |

Cities: Jakarta, Surabaya, Bandung, Medan, Makassar (IDR).
Takaful products: Health takaful, Motor takaful, Family takaful, Property takaful, SME takaful.

Presenter note: in takaful, participants pay contributions into a participants' risk fund, and claims are paid from that fund. The demo models claims operations only. It makes no Sharia, legal or regulatory rulings, and its SOPs are synthetic.

## KPI cards (live from `CURATED.KPI_SUMMARY`; no fallback values)

| Card | Value from the seeded data |
|---|---|
| Claims per 1,000 Contributions | 0.80 |
| Claims Notified | 595 |
| Escalated to Claims Investigation | 185 |
| Escalation Rate | 31.1% |
| Settlement SLA Breaches | 89 |
| Contribution Value (IDR B) | 378 |
| Contributions Received | 748,300 |
| Claims File Audit Compliance | 79.2% |
| Plans Monitored | 40 |
| Claim File Coverage | 56.3% |
| Claim Documents Pending | 23 |

Values are synthetic. A rebuild reproduces them because the data is HASH-seeded; dates are relative to the build day.

## Demo flow

1. Executive Cockpit: KPIs, daily claims against referrals, claims and referrals by cause, plan table
2. Predictive: holdout metrics, risk bands, 14-day claims forecast, claim document rejection rate anomalies
3. Controls: claims file audit compliance, claim file coverage and pending documents, audit compliance against escalated claims, then generate the action memo
4. Live Claims: run `CALL APP.SIMULATE_CLAIMS(20)` (Snowflake only) or `python aws/publish_claims.py --count 20` (AWS build). Then run `EXECUTE ALERT APP.LIVE_CLAIMS_ALERT` and show the alert log and email.
5. Ask AI: the Cortex Agent answers metric questions through the semantic view and cites SOPs from Cortex Search. The SQL is shown.
6. QuickSight (AWS build): the same Snowflake tables through DIRECT_QUERY
7. Architecture: both builds side by side

## Talking points

- 595 claims were notified against 748,300 contributions (0.80 per 1,000); 31.1% of claims were referred to claims investigation.
- Hospital inpatient stays produce the most referrals (39 of 165 claims). The 16 flood event claims hit every plan in a city at once and always settle without investigation.
- The risk model is evaluated on a time-based holdout: precision 0.54 and recall 0.33 at 0.5, against a 0.29 base rate. Present it as triage, not a verdict.
- Flood events are excluded from model training, because they are not plan-driven.

## Business impact

Use only the sourced references in `README.md` (Business Impact).
