-- SELECT * FROM dbt_tutorial.default.fact_sales;

select * from {{ source('source', 'fact_sales') }}