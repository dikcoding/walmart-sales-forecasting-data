{{ config(
    alias='silver_retail_sales_enrichment'
) }}

select
    *,
    case 
        when sales_month in (12,1,2) then 'Winter'
        when sales_month in (3,4,5) then 'Spring'
        when sales_month in (6,7,8) then 'Summer'
        when sales_month in (9,10,11) then 'Fall'
    end as season
from {{ ref('silver_retail_sales_derived') }}
