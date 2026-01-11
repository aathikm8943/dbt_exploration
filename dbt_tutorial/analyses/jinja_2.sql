{%- set items = ["apple", "orange", "banana"] -%}

{% for item in items %}

    {% if item == "apple"%}
        I love {{item}}
    {% else %}
        {{item}}

    {% endif %}
{% endfor %}