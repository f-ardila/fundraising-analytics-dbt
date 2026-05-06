# Fundraising Analytics (dbt Project)

This project models a fundraising platform using dbt and BigQuery.

## Overview

I built this project to practice analytics engineering patterns, including:
- structuring transformations using dbt
- modeling transactional and revenue data
- handling edge cases like failed and refunded donations

## Data Model

The project is organized into three layers:

### Staging
- Cleans raw data from source tables
- Standardizes types and naming

### Intermediate
- Applies business logic (e.g. handling refunds, joining donations to payments)

### Marts
- Builds analytics-ready tables:
  - fact_donations
  - dim_users
  - dim_campaigns
  - campaign_performance

## Key Logic

- Failed donations → excluded or zero revenue
- Refunded donations → negative revenue impact
- Net revenue = gross amount - fees (adjusted for refunds)

## Tech Stack

- dbt
- BigQuery
- Python (for data generation)
