# Terraform Module: Google Cloud VPC Setup

## Overview

This Terraform module sets up a Virtual Private Cloud (VPC) on Google Cloud Platform (GCP) with a custom subnet, global private IP address, and public IP address.

## Resources

The module creates the following resources:

- **google_compute_network**: VPC Network
- **google_compute_global_address**: Private IP Address for VPC Peering
- **google_service_networking_connection**: VPC Peering Connection
- **google_compute_subnetwork**: Subnetwork
- **google_compute_address**: Public IP Address

## Input Variables

| Name           | Description                                          | Type          | Default      | Required |
|----------------|------------------------------------------------------|---------------|--------------|----------|
| `network_name` | The name of the VPC network                          | string        | "vpc-dev"    | no       |
| `subnet_name`  | The name of the subnet                               | string        | "subnet-dev" | no       |
| `subnet_cidr`  | The CIDR range for the subnet                        | string        | "10.0.0.0/16"| no       |
| `region`       | The region where resources are created               | string        | n/a          | yes      |
| `project_id`   | The GCP project ID                                   | string        | n/a          | yes      |

## Outputs

| Name                 | Description                          |
|----------------------|--------------------------------------|
| `vpc_network`        | The self-link of the VPC network     |
| `vpc_network_name`   | The name of the VPC network          |
| `vpc_network_id`     | The ID of the VPC network            |
| `sub_network`        | The self-link of the created subnetwork|
| `public_ip`          | The public IP address allocated      |