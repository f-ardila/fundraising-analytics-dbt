select
    cast(user_id as int64) as user_id,
    cast(created_at as timestamp) as user_created_at,
    lower(acquisition_channel) as acquisition_channel,
    lower(country) as country,
from {{ source('fundraising_raw', 'raw_users') }}