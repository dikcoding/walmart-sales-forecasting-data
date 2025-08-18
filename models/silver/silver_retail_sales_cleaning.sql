{{ config(
    alias='silver_retail_sales_cleaning'
) }}

select
    CAST(Store AS int) as store,
    TRY_TO_DATE(Date, 'DD-MM-YYYY') as date,
    CAST(Weekly_Sales AS float) as weekly_sales,
    CAST(Holiday_Flag AS int) as holiday_flag,
    CAST(Temperature AS float) as temperature,
    CAST(Fuel_Price AS float) as fuel_price,
    CAST(CPI AS float) as cpi,
    CAST(Unemployment AS float) as unemployment
from {{ ref('bronze_opendatabay_data') }}
where store is not null
  and date is not null
  and weekly_sales is not null
