select

    donation_id,
    user_id,
    campaign_id,
    nonprofit_id,

    acquisition_channel,
    country,

    campaign_type,
    campaign_goal_amount,

    donation_status,
    is_recurring,

    processor,

    gross_donation_amount,
    adjusted_gross_revenue,
    payment_fee_amount,
    adjusted_net_revenue,

    donation_created_at

from {{ ref('int_donations_enriched') }}