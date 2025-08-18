{{ config(
    alias='silver_retail_sales_standardization'
) }}

select
    store,
    date,
    weekly_sales,
    holiday_flag,
    round(temperature, 2) as temperature,
    round(fuel_price, 2) as fuel_price,
    round(cpi, 2) as cpi,
    round(unemployment, 2) as unemployment
from {{ ref('silver_retail_sales_cleaning') }}
