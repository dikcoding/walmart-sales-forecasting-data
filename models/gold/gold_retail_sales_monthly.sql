{{ config(
    alias='gold_retail_sales_monthly'
) }}

select
    store,
    sales_year,
    sales_month,
    season,
    sum(weekly_sales) as total_sales,
    avg(weekly_sales) as avg_weekly_sales,
    max(weekly_sales) as max_weekly_sales,
    min(weekly_sales) as min_weekly_sales,
    avg(temperature) as avg_temp,
    avg(fuel_price) as avg_fuel_price,
    avg(cpi) as avg_cpi,
    avg(unemployment) as avg_unemployment
from {{ ref('silver_retail_sales_enrichment') }}
group by store, sales_year, sales_month, season
order by store, sales_year, sales_month
