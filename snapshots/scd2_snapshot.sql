{% snapshot shipping_snap %}
    {{
        config(
            target_database="RAW",
            target_schema="DBT_SMURUGESAN",
            unique_key="id",
            strategy="timestamp",
            updated_at="updated_at",
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    select *
    from {{ source("snapshot", "shipping") }}
{% endsnapshot %}
