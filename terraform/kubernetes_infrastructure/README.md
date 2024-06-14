# Terraform Module: Google Cloud Network and Compute Resources Setup

## Overview

This Terraform module sets up a Google Cloud Network and a Kubernetes cluster.

## Resources

The module creates the following resources:

- **google_container_cluster**: Manages a Kubernetes cluster
- **google_container_node_pool**: Manages a Kubernetes pool of nodes
- **google_compute_network**: Manages a network for the Kubernetes cluster
- **google_compute_subnetwork**: Manages subnets within the VPC network

## Input Variables

| Name               | Description                                                  | Type    | Default                           |
|--------------------|--------------------------------------------------------------|---------|-----------------------------------|
| `project`          | Google cloud active project                                  | string  |                                   |
| `env`              | The working environment                                      | string  |                                   |
| `app`              | The application name                                         | string  |                                   |
| `region`           | The default region to deploy infrastructure                  | string  |                                   |
| `zone`             | The availability zone where the resource will be deployed    | string  |                                   |
| `image_type`       | The instance OS                                              | string  | "ubuntu-os-cloud/ubuntu-2204-lts" |
| `app_additional`   | The application name of addional project                     | string  |                                   |
| `region_additional`| The region of addional project                               | string  |                                   |