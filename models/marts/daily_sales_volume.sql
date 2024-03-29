{{ config(materialized='table') }}

select
    sale_date,
    count(*) as total_sales
from {{ ref('stg_sales') }}
group by sale_date
