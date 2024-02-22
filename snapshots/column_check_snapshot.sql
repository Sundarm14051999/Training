{% snapshot shipping_cols %}
    {{
        config(
            target_database="RAW",
            target_schema="DBT_SMURUGESAN",
            unique_key="ID",
            strategy="check",
            check_cols=['name','city','friend_name']
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    select id,name,city
    from {{ source("snapshot", "shipping") }}
{% endsnapshot %}