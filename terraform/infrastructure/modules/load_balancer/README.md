# Terraform Module: Google Cloud Load-balancer setup

## Overview

This Terraform module sets up a Application Regional Load-balancer on Google Cloud Platform (GCP).

## Resources

The module creates the following resources:

- **google_compute_forwarding_rule**: FOrwarding rule of the load-balancer
- **google_compute_region_target_https_proxy**: The https proxy for the load-balancer
- **google_compute_region_url_map**: The url map to route traffic to backend service
- **google_compute_region_backend_service**: The backend service
- **google_compute_address**: The public ip address for the load-balancer

## Input Variables

| Name              | Description                                          | Type          | Default                       | Required |
|-------------------|------------------------------------------------------|---------------|-------------------------------|----------|
| `instance_group`  | The instance group of the group manager.             | string        | "website-rigm"                |   yes    |
| `vpc_network_id`  | The id of the vpc network.                           | string        | "vpc-dev"                     |   yes    |
| `health_check_id` | The id of the health check.                          | string        | "website-hc"                  |   yes    |
| `certificates_id` | The id of the certificate.                           | string        | "ssl-certificate"             |   yes    |



## Outputs

| Name                       | Description                               |
|----------------------------|-------------------------------------------|
| `load_balancer_public_ip`  | The public ip of the load-balancer.       |

