# Terraform Module: Google Cloud Network and Compute Resources Setup

## Overview

This Terraform module sets up a Google Cloud Network with multiple subnets, firewall rules, routers, and NAT configurations. It also provisions a load balancer and a database with specified configurations.

## Resources

The module creates the following resources:

- **google_compute_router**: Manages a Cloud Router
- **google_compute_router_nat**: Manages a Cloud NAT
- **google_compute_subnetwork**: Manages subnets within the VPC network
- **google_compute_firewall**: Manages firewall rules
- **local_file**: Manages local file creation for outputs

The imported modules:

- **database**
- **load_balancer_geo**

## Input Variables

| Name             | Description                                                  | Type    | Default                         |
|------------------|--------------------------------------------------------------|---------|---------------------------------|
| `project`        | Google cloud active project                                  | string  |                                 |
| `env`            | The working environment                                      | string  |                                 |
| `app`            | The application name                                         | string  |                                 |
| `region`         | The default region to deploy infrastructure                  | string  |                                 |
| `zone`           | The availability zone where the resource will be deployed    | string  |                                 |
| `image_type`     | The instance OS                                              | string  | "ubuntu-os-cloud/ubuntu-2204-lts" |