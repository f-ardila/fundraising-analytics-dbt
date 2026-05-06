select
    cast(nonprofit_id as int64) as nonprofit_id,
    lower(nonprofit_name) as nonprofit_name,
    lower(cause_category) as cause_category,
    cast(created_at as timestamp) as nonprofit_created_at,
from {{ source('fundraising_raw', 'raw_nonprofits') }}