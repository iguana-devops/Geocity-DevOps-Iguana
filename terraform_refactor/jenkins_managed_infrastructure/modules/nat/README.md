# Terraform Module: Google Cloud NAT setup

## Overview

This Terraform module sets up a NAT on Google Cloud Platform (GCP).

## Resources

The module creates the following resources:

- **google_compute_router**: A route for the nat.
- **google_compute_router_nat**: A nat router.


## Input Variables

| Name              | Description                                          | Type          | Default                       | Required |
|-------------------|------------------------------------------------------|---------------|-------------------------------|----------|
| `vpc_id`          | The vpc network id.                                  | string        | "vpc-dev"                     |   yes    |




## Outputs

| Name                       | Description                               |
|----------------------------|-------------------------------------------|


