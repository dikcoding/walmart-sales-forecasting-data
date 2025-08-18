{{ config(
    alias='silver_retail_sales_normalization'
) }}

select
    store,
    date,
    weekly_sales,
    holiday_flag,
    (temperature - avg(temperature) over()) / nullif(stddev(temperature) over(),0) as temperature_z,
    (fuel_price - avg(fuel_price) over()) / nullif(stddev(fuel_price) over(),0) as fuel_price_z,
    (cpi - avg(cpi) over()) / nullif(stddev(cpi) over(),0) as cpi_z,
    (unemployment - avg(unemployment) over()) / nullif(stddev(unemployment) over(),0) as unemployment_z
from {{ ref('silver_retail_sales_standardization') }}
