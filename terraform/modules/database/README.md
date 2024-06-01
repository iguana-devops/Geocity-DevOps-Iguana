# Terraform Module: Google Cloud SQL PostgreSQL Instance Setup

## Overview

This Terraform module sets up a Google Cloud SQL PostgreSQL instance with database configurations, user creation, and secrets management. It also configures private IP addressing and VPC peering.

## Resources

The module creates the following resources:

- **google_sql_database_instance**: Manages a Cloud SQL instance
- **google_sql_database**: Manages a database in the SQL instance
- **google_sql_user**: Manages users for the SQL instance
- **google_compute_global_address**: Allocates a private IP address for VPC peering
- **google_service_networking_connection**: Manages VPC peering connection
- **google_secret_manager_secret**: Manages secrets in Google Cloud Secret Manager
- **google_secret_manager_secret_version**: Manages secret versions in Google Cloud Secret Manager
- **random_password**: Generates a random password for the database user

## Input Variables

| Name                    | Description                                | Type    |
|-------------------------|--------------------------------------------|---------|
| `db_disk_size`          | The size of data disk, in GB.              | number  |
| `vpc_id`                | The VPC id                                 | string  |
| `deletion_protection`   | The deletion protection policy             | bool    |
| `env`                   | The working environment                    | string  |
| `app`                   | The application name                       | string  |
| `region`                | The default region to deploy infrastructure| string  |

## Outputs

| Name                 | Description                          |
|----------------------|--------------------------------------|
| `database_private_ip`| The private IP address of the database |
| `database_pass`      | The password for the database user    |