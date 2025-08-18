{{ config(
    alias='silver_retail_sales_derived'
) }}

select
    *,
    extract(year from date) as sales_year,
    extract(month from date) as sales_month,
    case when holiday_flag = 1 then 'Holiday' else 'Non-Holiday' end as holiday_desc
from {{ ref('silver_retail_sales_normalization') }}
