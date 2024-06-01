# Terraform Module: Google Cloud Compute Engine VM, Disk, and Secrets Setup

## Overview

This Terraform module sets up a Google Cloud Compute Engine VM instance with a disk, a public IP address, daily snapshot policy, and an SSH key stored in Secret Manager.

## Resources

The module creates the following resources:

- **google_compute_instance**: Manages a Compute Engine VM instance
- **google_compute_address**: Allocates a public IP address
- **google_compute_disk**: Manages a persistent disk
- **google_compute_resource_policy**: Manages a resource policy for daily snapshots
- **google_compute_disk_resource_policy_attachment**: Attaches the resource policy to the disk
- **tls_private_key**: Generates an SSH private key for the VM
- **google_secret_manager_secret**: Manages secrets in Google Cloud Secret Manager
- **google_secret_manager_secret_version**: Manages secret versions in Google Cloud Secret Manager


## Input Variables

| Name                          | Description                                | Type    |
|-------------------------------|--------------------------------------------|---------|
| `instance_type`               | The instance OS                            | string  |
| `image_type`                  | The instance type                          | string  |
| `disk_size`                   | The size of Jenkins disk                   | number  |
| `vpc_network`                 | The VPC network for the instance           | string  |
| `sub_network`                 | The subnetwork for the instance            | string  |
| `instance_deletion_protection`| The deletion protection policy             | bool    |
| `env`                         | The working environment                    | string  |
| `app`                         | The application name                       | string  |
| `region`                      | The default region to deploy infrastructure| string  |

