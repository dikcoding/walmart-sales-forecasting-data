{{ config(
    alias='gold_retail_sales_seasonal'
) }}

select
    store,
    sales_year,
    season,
    sum(weekly_sales) as total_sales,
    avg(weekly_sales) as avg_weekly_sales,
    count(*) as total_weeks,
    sum(case when holiday_flag = 1 then weekly_sales else 0 end) as holiday_sales,
    sum(case when holiday_flag = 0 then weekly_sales else 0 end) as non_holiday_sales
from {{ ref('silver_retail_sales_enrichment') }}
group by store, sales_year, season
order by store, sales_year, season