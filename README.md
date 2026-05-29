# Bike Sharing Dashboard

**Summary**  
12 months of bike‑sharing analysis: station demand, temporal patterns, top routes, and operational recommendations. This repo contains cleaned sample data, Python notebooks, SQL scripts used to derive business insights, a lightweight Power BI report for reviewers, and a presentation.

---

## Contents
# ride_data_cleaning.ipynb
**Purpose:** Reproducible record of cleaning, validation, and export for Power BI.  
- **`sql/`** — SQL scripts:
  - `00_create_tables.sql` — example schema for staging/production.
  - `01_member_vs_casual.sql` — member vs casual counts.
  - `02_bike_types.sql` — counts by rideable type.
  - `03_hourly_trend.sql`, `04_weekday_trend.sql`, `05_monthly_trend.sql` — time‑based trends.
  - `06_duration_buckets.sql` — trip duration buckets.
  - `07_top_paths.sql`, `08_top_starting_stations.sql`, `09_top_ending_stations.sql`, `10_bottom_starting_stations.sql` — station & route analysis.
  - `11_views_and_aggregates.sql` — views for Power BI import.
  - `12_qc_checks.sql` — data quality checks.

- **`powerbi/sample.pbix`** — lightweight Power BI report (kept <25 MB).  
- **`powerbi/screenshots/`** — dashboard screenshots used in the presentation.  
- **`presentation/Bike_Sharing_Presentation.pptx`** — slide deck with insights and speaker notes.  
- **`docs/data_dictionary.md`** — column definitions, types, units, and data quality flags.  
- **`docs/methodology.md`** — cleaning steps, assumptions, and known issues.  
- **`full-pbix-link.txt`** — external link to the full PBIX (OneDrive / Google Drive).

---

## Business problems solved
1. **Member vs Casual** — distribution of trips by rider type.  
   - Query: `01_member_vs_casual.sql`
2. **Bike types** — usage by rideable type.  
   - Query: `02_bike_types.sql`
3. **Temporal patterns** — peak hours, busiest weekday, busiest month.  
   - Queries: `03_hourly_trend.sql`, `04_weekday_trend.sql`, `05_monthly_trend.sql`  
4. **Trip duration distribution** — buckets to understand short vs long trips.  
   - Query: `06_duration_buckets.sql`  
5. **Station imbalance & routes** — top start/end stations, top paths, bottom stations to identify rebalancing needs.  
   - Queries: `07_top_paths.sql`, `08_top_starting_stations.sql`, `09_top_ending_stations.sql`, `10_bottom_starting_stations.sql`  
6. **Operational recommendations** — rebalancing schedule, dock capacity, targeted promotions, and data quality fixes (see `docs/methodology.md`).

---
##Insights & Business Recommendations

**1️⃣ Member vs Casual Riders (01_member_vs_casual.sql)**
Insight: Members contribute ≈ 64 % of total trips; casual riders ≈ 36 %.

Recommendation:

Launch referral and loyalty programs to retain members.

Convert casual riders through weekend discounts and “first‑month membership” trials.

Segment marketing: casual riders favor leisure hours → focus on experience‑based campaigns.

**2️⃣ Bike Types (02_bike_types.sql)**
Insight: Classic bikes ≈ 65 % usage; electric bikes ≈ 35 %.

Recommendation:

Expand electric fleet in high‑demand zones.

Schedule preventive maintenance for classic bikes.

Apply dynamic pricing—slightly higher for electric bikes during peak hours.

**3️⃣ – 5️⃣ Temporal Patterns (03_hourly_trend.sql, 04_weekday_trend.sql, 05_monthly_trend.sql)**
Insight:

Peak hours 3 – 6 PM; Friday–Saturday busiest; May–August seasonal surge.

Recommendation:

Deploy rebalancing crews 2 – 4 PM to prep for evening peaks.

Increase fleet and marketing spend in summer.

Offer weekday commuter plans for nearby offices.

**6️⃣ Trip Duration Buckets (06_duration_buckets.sql)**
Insight: Majority of rides < 15 min; sharp drop after 30 min.

Recommendation:

Keep short‑trip pricing competitive; introduce “extended‑ride” tourist packages.

Optimize dock turnover and quick maintenance cycles.

Add auto‑renew prompts for riders nearing time limits.

**7️⃣ – 10️⃣ Station Imbalance & Routes**
(07_top_paths.sql, 08_top_starting_stations.sql, 09_top_ending_stations.sql, 10_bottom_starting_stations.sql)

Insight:

Top stations: DuSable Lake Shore Dr, Kingsbury St, Navy Pier → high congestion.

Bottom stations: Canal St & Lake St, Green St & 86th St → underutilized.

Top routes: Ellis Ave ↔ 55th/60th St, University Ave ↔ 57th St.

Recommendation:

Redistribute bikes hourly from top to low‑traffic stations.

Expand dock capacity at Navy Pier & DuSable Lake Shore Dr.

Offer discounts for rides starting at low‑traffic stations.

Clean “unknown station” data (> 0.5 M records) for accurate route analytics.


   venv\Scripts\activate
   pip install -r requirements.txt
