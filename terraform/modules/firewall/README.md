# Terraform Module: Google Cloud Firewall Setup

## Overview

This Terraform module sets up a firewall rule to allow web traffic to a specified VPC network on Google Cloud Platform (GCP).

## Resources

The module creates the following resource:

- **google_compute_firewall**: Manages firewall rules for a VPC network

## Input Variables

| Name              | Description                  | Type         | Default                     | Required |
|-------------------|------------------------------|--------------|-----------------------------|----------|
| `allowed_ports`   | List of allowed ports        | list(any)    | ["80", "443", "22", "8080"] | no       |
| `vpc_network_name`| The name of the VPC network  | string       | n/a                         | yes      |
