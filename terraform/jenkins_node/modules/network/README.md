# Terraform Module: Google Cloud VPC and Firewall Setup

## Overview

This Terraform module sets up a Google Cloud Virtual Private Cloud (VPC) network, including a subnet, global address for VPC peering, a VPC peering connection, a public IP address, and a firewall rule to allow web traffic.

## Resources

The module creates the following resources:

- **google_compute_network**: Manages a VPC network
- **google_compute_global_address**: Allocates a global private IP address for VPC peering
- **google_service_networking_connection**: Manages a VPC peering connection
- **google_compute_subnetwork**: Manages a subnetwork within the VPC
- **google_compute_address**: Allocates a public IP address
- **google_compute_firewall**: Manages firewall rules for the VPC

## Input Variables

| Name           | Description                                | Type         | Default         | Required |
|----------------|--------------------------------------------|--------------|-----------------|----------|
| `subnet_cidr`  | The CIDR range for the subnet              | string       | "10.0.0.0/16"   | no       |
| `allowed_ports`| List of allowed ports for the firewall     | list(any)    | ["80", "443", "22", "8080"] | no |
| `region`       | The region where resources are created     | string       | n/a             | yes      |
| `project_id`   | The GCP project ID                         | string       | n/a             | yes      |

## Outputs

| Name            | Description                       |
|-----------------|-----------------------------------|
| `vpc_network`   | The self-link of the VPC network  |
| `sub_network`   | The self-link of the subnetwork   |
| `public_ip`     | The allocated public IP address   |