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


   venv\Scripts\activate
   pip install -r requirements.txt
