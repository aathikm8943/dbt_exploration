WITH dedub AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated_at DESC) AS dedublicate_key
    FROM 
        {{source('bronze_source', 'items')}}
    )
SELECT 
    id,
    name,
    category,
    updated_at
FROM 
    dedub 
WHERE 
    dedublicate_key = 1