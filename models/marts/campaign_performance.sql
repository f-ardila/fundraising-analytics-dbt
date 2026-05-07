select

    campaign_id,
    nonprofit_id,
    campaign_type,

    count(*) as total_donations,

    countif(donation_status = 'completed') as completed_donations,

    countif(donation_status = 'refunded') as refunded_donations,

    sum(adjusted_gross_revenue) as gross_revenue,

    sum(adjusted_net_revenue) as net_revenue,

    avg(gross_donation_amount) as avg_donation_amount,

    max(campaign_goal_amount) as campaign_goal_amount,

    safe_divide(
        sum(adjusted_gross_revenue),
        max(campaign_goal_amount)
    ) as pct_of_goal_reached

from {{ ref('fct_donations') }}
where campaign_id is not null

group by 1,2,3