{% snapshot sp_customer %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_name', 'segment']
    )
}}

select
    *
from {{ ref('d_customer') }}

{% endsnapshot %}