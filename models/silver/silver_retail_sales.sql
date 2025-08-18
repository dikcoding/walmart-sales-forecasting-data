{{ config(
    alias='silver_retail_sales'   
) }}

select
  CAST(Store AS int) as store,
  TO_DATE(Date, 'DD-MM-YYYY') as date,
  weekly_sales,
  holiday_flag,
  temperature,
  fuel_price,
  cpi,
  unemployment
from {{ ref('data') }}