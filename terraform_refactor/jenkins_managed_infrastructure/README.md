# Terraform Module: Google Cloud Main Setup

## Overview

This Terraform module sets up the Google Cloud project services and a Cloud SQL database instance. It enables required Google Cloud services and deploys a PostgreSQL database with specified configurations.

## Resources

The imported modules:

- **vm**: This Terraform module sets up a Google Cloud SQL database instance with specified configurations, including PostgreSQL version, backup configurations, and users. It also manages secrets in Google Cloud Secret Manager.

## Input Variables

| Name           | Description                                                      | Type         | Default                     | Required |
|----------------|------------------------------------------------------------------|--------------|-----------------------------|----------|
| `project_id`   | Google Cloud active project                                      | string       | "diesel-studio-423421-p9"   | no       |
| `region`       | Default region to deploy infrastructure                          | string       | "europe-central2"           | no       |
| `zone`         | The availability zone where the instance will be deployed        | string       | "europe-central2-a"         | no       |
| `environment`  | Working environment                                              | string       | "dev"                       | no       |
| `services`     | A list of services to enable                                     | list(string) | ["compute.googleapis.com", "servicenetworking.googleapis.com", "secretmanager.googleapis.com"] | no       |
