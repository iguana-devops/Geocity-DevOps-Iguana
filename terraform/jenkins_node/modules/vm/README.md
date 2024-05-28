# Terraform Module: Google Cloud Compute Engine VM, Disk, and Secrets Setup

## Overview

This Terraform module sets up a Google Cloud Compute Engine VM instance with a disk, daily snapshot policy, and an SSH key stored in Secret Manager.

## Resources

The module creates the following resources:

- **google_compute_instance**: Manages a Compute Engine VM instance
- **google_compute_disk**: Manages a persistent disk
- **google_compute_resource_policy**: Manages a resource policy for daily snapshots
- **google_compute_disk_resource_policy_attachment**: Attaches the resource policy to the disk
- **tls_private_key**: Generates an SSH private key for the VM
- **google_secret_manager_secret**: Manages secrets in Google Cloud Secret Manager
- **google_secret_manager_secret_version**: Manages secret versions in Google Cloud Secret Manager

## Script

 - Mount attached disk
 - Install and configure Jenkins

## Input Variables

| Name                         | Description                                                        | Type         | Default             | Required |
|------------------------------|--------------------------------------------------------------------|--------------|---------------------|----------|
| `instance_name`              | Name of the Compute Engine instance                                | string       | n/a                 | yes      |
| `instance_type`              | The instance type to be used for the Compute Engine instance       | string       | "e2-small"          | no       |
| `image_family`               | The family of the VM image for the instance to be launched         | string       | "ubuntu-2204-lts"   | no       |
| `image_project`              | The project of the VM image for the instance to be launched        | string       | "ubuntu-os-cloud"   | no       |
| `disk_type`                  | The type of disk                                                   | string       | "pd-ssd"            | no       |
| `disk_size`                  | The size of the disk in GB                                         | number       | n/a                 | yes      |
| `environment`                | The environment label to be applied                                | string       | n/a                 | yes      |
| `vpc_network`                | The VPC network for the instance                                   | string       | n/a                 | yes      |
| `sub_network`                | The subnetwork for the instance                                    | string       | n/a                 | yes      |
| `public_ip`                  | The public IP address for the instance                             | string       | n/a                 | yes      |
| `instance_deletion_protection`| Whether to enable deletion protection for the instance             | bool        | n/a                 | yes      |