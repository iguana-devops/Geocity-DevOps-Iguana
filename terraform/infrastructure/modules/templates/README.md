# Terraform Module: Google Cloud Template

## Overview

This Terraform module sets up a Template on Google Cloud Platform (GCP).

## Resources

The module creates the following resources:

- **google_compute_instance_template**: The template for the auto-scaler to scale


## Input Variables

| Name           | Description                                          | Type          | Default                       | Required |
|----------------|------------------------------------------------------|---------------|-------------------------------|----------|
| `vpc_id`       | The id of the vpc network.                           | string        | "vpc-dev"                     |   yes    |
| `subnet_id`    | The id of the subnetwork.                            | string        | "subnet-dev"                  |   yes    |


## Outputs

| Name                 | Description                              |
|----------------------|------------------------------------------|
| `template_id`        | The id of the template                   |

