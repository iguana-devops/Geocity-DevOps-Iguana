# Terraform Module: Google Cloud Auto-scale setup

## Overview

This Terraform module sets up a Auto-scale on Google Cloud Platform (GCP).

## Resources

The module creates the following resources:

- **google_compute_instance_group_manager**: Group manager
- **google_compute_region_health_check**: The health check
- **google_compute_autoscaler**: The auto-scaler

## Input Variables

| Name           | Description                                          | Type          | Default                       | Required |
|----------------|------------------------------------------------------|---------------|-------------------------------|----------|
| `template_id`  | The id of the template.                              | string        | "template-website-backend"    |   yes    |


## Outputs

| Name                 | Description                              |
|----------------------|------------------------------------------|
| `health_check_id`    | The id of the health check               |
| `instance_group`     | The instance group of the group manager  |
