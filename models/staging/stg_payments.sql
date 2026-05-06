select
    cast(payment_id as int64) as payment_id,
    cast(donation_id as int64) as donation_id,
    lower(processor) as processor,
    lower(payment_status) as payment_status,
    cast(processed_at as timestamp) as payment_processed_at,
    cast(gross_amount as numeric) as payment_gross_amount,
    cast(fee_amount as numeric) as payment_fee_amount,
    cast(net_amount as numeric) as payment_net_amount,
from {{ source('fundraising_raw', 'raw_payments') }}