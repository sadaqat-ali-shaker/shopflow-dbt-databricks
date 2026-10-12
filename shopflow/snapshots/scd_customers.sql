{% snapshot scd_customers %}

{{
    config(
        target_schema='shopflow_dev',
        unique_key='customer_id',
        strategy='check',
        check_cols=['first_name', 'last_name', 'email', 'country']
    )
}}

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    country,
    created_at
FROM {{ ref('stg_customers') }}

{% endsnapshot %}

