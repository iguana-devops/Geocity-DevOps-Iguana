# Terraform Module: Google Cloud Main Setup

## Overview

This Terraform module sets up the Google Cloud project services, VPC network, and a Compute Engine VM instance. It enables required Google Cloud services, configures the VPC network and firewall, and deploys a VM instance with attached disks and startup scripts.

## Resources

The imported modules:

- **vm**: This Terraform module sets up a Google Cloud Compute Engine VM instance with a disk, a public IP address, daily snapshot policy, and an SSH key stored in Secret Manager.
- **network**: This Terraform module sets up a Google Cloud Virtual Private Cloud (VPC) network, including a subnet, global address for VPC peering, a VPC peering connection, and a firewall rule to allow web traffic.

## Input Variables

| Name           | Description                                                      | Type         | Default                     | Required |
|----------------|------------------------------------------------------------------|--------------|-----------------------------|----------|
| `project_id`   | Google Cloud active project                                      | string       | "diesel-studio-423421-p9"   | no       |
| `region`       | Default region to deploy infrastructure                          | string       | "europe-central2"           | no       |
| `zone`         | The availability zone where the instance will be deployed        | string       | "europe-central2-a"         | no       |
| `environment`  | Working environment                                              | string       | "dev"                       | no       |
| `services`     | A list of services to enable                                     | list(string) | ["compute.googleapis.com", "servicenetworking.googleapis.com", "secretmanager.googleapis.com"] | no       |