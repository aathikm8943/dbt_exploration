WITH 
    sales AS (
        SELECT 
            sales_id,
            product_sk,
            customer_sk,
            ({{ multiply('unit_price', 'gross_amount') }}) as calculated_gross_amount,
            payment_method
        FROM
            {{ref("bronze_fact_sales")}}
    ),
    product AS (
        SELECT 
            product_sk,
            department,
            category
        FROM 
            {{ref("bronze_dim_product")}}
    ),
    customer AS (
        SELECT 
            customer_sk,
            gender
        FROM
            {{ref("bronze_dim_customer")}}
    ),
    combined_query AS (
        SELECT 
            sales.sales_id,
            sales.calculated_gross_amount,
            sales.payment_method,
            product.department,
            product.category,
            customer.gender
        FROM 
            sales
        LEFT JOIN
            product ON sales.product_sk = product.product_sk
        LEFT JOIN
            customer ON sales.customer_sk = customer.customer_sk
    )

-- SELECT * FROM combined_query

SELECT 
    category,
    gender,
    SUM(calculated_gross_amount) as sum_amount
FROM 
    combined_query
GROUP BY
    gender, category
ORDER BY 
    category
