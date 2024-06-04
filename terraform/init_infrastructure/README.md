# Terraform Module: Google Cloud Network and Compute Resources Setup

## Overview

This Terraform module sets up a Google Cloud Network with multiple subnets, firewall rules, and resource policies. It also provisions virtual machines (VMs) for Jenkins, JFrog, and Prometheus with specified configurations.

## Resources

The module creates the following resources:

- **google_compute_network**: Manages a VPC network
- **google_compute_subnetwork**: Manages subnets within the VPC network
- **google_compute_firewall**: Manages firewall rules
- **google_compute_resource_policy**: Manages resource policies for snapshots

The imported modules:

- **jenkins_vm**
- **jfrog_vm**
- **prometheus_vm**

## Input Variables

| Name             | Description                                                  | Type    | Default                         |
|------------------|--------------------------------------------------------------|---------|---------------------------------|
| `project`        | Google cloud active project                                  | string  |                                 |
| `env`            | The working environment                                      | string  |                                 |
| `app`            | The application name                                         | string  |                                 |
| `region`         | The default region to deploy infrastructure                  | string  |                                 |
| `zone`           | The availability zone where the resource will be deployed    | string  |                                 |
| `image_type`     | The instance OS                                              | string  | "ubuntu-os-cloud/ubuntu-2204-lts" |
| `instance_type`  | The instance type                                            | string  | "e2-medium"                     |