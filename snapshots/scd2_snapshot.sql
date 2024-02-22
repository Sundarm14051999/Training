{% snapshot customer_snaps %}
    {{
        config(
          target_database='raw',
           target_schema='DBT_SMURUGESAN',
          unique_key='c_custkey',
          strategy='timestamp',
          updated_at='updated_at'
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
select * from {{ source('SNOWFLAKE', 'customer')  }}
{% endsnapshot %}