select
    cast(campaign_id as int64) as campaign_id,
    cast(nonprofit_id as int64) as nonprofit_id,
    lower(campaign_name) as campaign_name,
    cast(goal_amount as numeric) as campaign_goal_amount,
    cast(created_at as timestamp) as campaign_created_at,
    lower(campaign_type) as campaign_type,
from {{ source('fundraising_raw', 'raw_campaigns') }}