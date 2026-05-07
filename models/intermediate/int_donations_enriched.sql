with donations as (

    select *
    from {{ ref('stg_donations') }}

),

payments as (

    select *
    from {{ ref('stg_payments') }}

),

campaigns as (

    select *
    from {{ ref('stg_campaigns') }}

),

users as (

    select *
    from {{ ref('stg_users') }}

),

joined as (

    select
        d.donation_id,
        d.user_id,
        d.campaign_id,

        u.acquisition_channel,
        u.country,

        c.nonprofit_id,
        c.campaign_type,
        c.campaign_goal_amount,

        d.donation_status,
        d.gross_donation_amount,
        d.is_recurring,
        d.donation_created_at,

        p.payment_id,
        p.processor,
        p.payment_status,
        p.payment_fee_amount,
        p.payment_net_amount,

        case
            when d.donation_status = 'completed' then d.gross_donation_amount
            when d.donation_status = 'refunded' then -1 * d.gross_donation_amount
            else 0
        end as adjusted_gross_revenue,

        case
            when d.donation_status = 'completed' then p.payment_net_amount
            when d.donation_status = 'refunded' then -1 * p.payment_net_amount
            else 0
        end as adjusted_net_revenue

    from donations d
    left join payments p
        on d.donation_id = p.donation_id
    left join campaigns c
        on d.campaign_id = c.campaign_id
    left join users u
        on d.user_id = u.user_id

)

select *
from joined