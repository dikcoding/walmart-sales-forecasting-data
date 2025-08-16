{{ config(
    alias='bronze_opendatabay_data'   
) }}

SELECT *
FROM {{ ref('data') }}            
