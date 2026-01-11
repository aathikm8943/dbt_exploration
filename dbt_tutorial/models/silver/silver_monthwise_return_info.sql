WITH dim_date AS (
    SELECT 
        dd.date_sk,
        dd.month_name
    FROM 
        {{ref('bronze_dim_date')}} 
),
monthwise_returns AS (
    SELECT * FROM dim_date
)
SELECT * FROM monthwise_returns