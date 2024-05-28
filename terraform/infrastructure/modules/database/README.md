# Terraform Module: Google Cloud SQL Database and Secret Management

## Overview

This Terraform module sets up a Google Cloud SQL database instance with specified configurations, including PostgreSQL version, backup configurations, and users. It also manages secrets in Google Cloud Secret Manager.

## Resources

The module creates the following resources:

- **random_id**: Generates a random suffix for the database instance name
- **google_sql_database_instance**: Manages a Google Cloud SQL database instance
- **google_sql_database**: Manages a database within a Cloud SQL instance
- **google_sql_user**: Manages users for the Cloud SQL instance
- **random_password**: Generates a random password for the database user
- **google_secret_manager_secret**: Manages secrets in Google Cloud Secret Manager
- **google_secret_manager_secret_version**: Manages secret versions in Google Cloud Secret Manager

## Input Variables

| Name                      | Description                                                                 | Type    | Default             | Required |
|---------------------------|-----------------------------------------------------------------------------|---------|---------------------|----------|
| `database_version`        | Version of the database                                                     | string  | "POSTGRES_15"       | no       |
| `db_edition`              | The edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS           | string  | "ENTERPRISE"        | no       |
| `db_tier`                 | The instance type                                                           | string  | "db-custom-1-3840"  | no       |
| `db_availability_type`    | The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL) | string  | "ZONAL"             | no       |
| `db_disk_size`            | The size of the data disk, in GB                                            | number  | 10                  | no       |
| `db_retention_days`       | The number of days of transaction logs we retain for point in time restore  | number  | 7                   | no       |
| `region`                  | The region where the resources will be created                              | string  | n/a                 | yes      |
| `vpc_network_id`          | The ID of the VPC network for private IP configuration                      | string  | n/a                 | yes      |
| `environment`             | The environment label to be applied                                         | string  | n/a                 | yes      |
| `db_deletion_protection`  | Whether to enable deletion protection for the database instance             | bool    | n/a                 | yes      |
