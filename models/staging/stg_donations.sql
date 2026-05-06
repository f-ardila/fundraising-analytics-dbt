select
    cast(donation_id as int64) as donation_id,
    cast(user_id as int64) as user_id,
    cast(campaign_id as int64) as campaign_id,
    cast(amount as numeric) as gross_donation_amount,
    lower(status) as donation_status,
    cast(created_at as timestamp) as donation_created_at,
    cast(is_recurring as bool) as is_recurring
from {{ source('fundraising_raw', 'raw_donations') }}