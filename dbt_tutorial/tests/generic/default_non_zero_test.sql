{% test default_non_zero_test(model, column_name) %}

SELECT * 
FROM {{model}}
WHERE {{column_name}} < 0 

{% endtest %}