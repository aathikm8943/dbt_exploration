SELECT * 
FROM {{ref("bronze_dim_product")}}
WHERE 
    product_sk < 0 and supplier_sk < 0