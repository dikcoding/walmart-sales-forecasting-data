{{ config(alias='silver_retail_sales_normalization') }}

with base as (
    select
        store,
        date,
        weekly_sales,
        holiday_flag,
        temperature,
        fuel_price,
        cpi,
        unemployment
    from {{ ref('silver_retail_sales_standardization') }}
)

select
    store,
    date,
    weekly_sales,
    holiday_flag,
    temperature,
    fuel_price,
    cpi,
    unemployment,

    (temperature - avg(temperature) over()) / nullif(stddev(temperature) over(), 0) as temperature_z,
    (fuel_price  - avg(fuel_price)  over()) / nullif(stddev(fuel_price)  over(), 0) as fuel_price_z,
    (cpi        - avg(cpi)         over()) / nullif(stddev(cpi)         over(), 0) as cpi_z,
    (unemployment - avg(unemployment) over()) / nullif(stddev(unemployment) over(), 0) as unemployment_z
from base