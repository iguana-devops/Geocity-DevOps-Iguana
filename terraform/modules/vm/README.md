# Terraform Module: Google Cloud Compute Engine VM Setup

## Overview

This Terraform module sets up a Google Cloud Compute Engine VM instance with specified configurations, including a boot disk, network interfaces, attached disks, and startup scripts.

## Resources

The module creates the following resource:

- **google_compute_instance**: Compute Engine VM Instance

## Script

 - Mount attached disk
 - Install and configure Jenkins

## Input Variables

| Name                         | Description                                                        | Type         | Default             | Required |
|------------------------------|--------------------------------------------------------------------|--------------|---------------------|----------|
| `instance_name`              | Name of the Compute Engine instance                                | string       | "jenkins-vm"        | no       |
| `instance_type`              | The instance type to be used for the Compute Engine instance       | string       | "e2-small"          | no       |
| `image_family`               | The family of the VM image for the instance to be launched         | string       | "ubuntu-2204-lts"   | no       |
| `image_project`              | The project of the VM image for the instance to be launched        | string       | "ubuntu-os-cloud"   | no       |
| `disk_name`                  | Name of the attached disk                                          | string       | "disk_jenkis"       | no       |
| `environment`                | The environment label to be applied                                | string       | n/a                 | yes      |
| `vpc_network`                | The VPC network for the instance                                   | string       | n/a                 | yes      |
| `sub_network`                | The subnetwork for the instance                                    | string       | n/a                 | yes      |
| `public_ip`                  | The public IP address for the instance                             | string       | n/a                 | yes      |
| `disk_jenkins_id`            | The ID of the attached disk for the instance                       | string       | n/a                 | yes      |
| `ssh_key_pub`                | The SSH public key for the instance                                | string       | n/a                 | yes      |
| `instance_deletion_protection`| The deletion protection policy                                    | bool         | n/a                 | yes      |