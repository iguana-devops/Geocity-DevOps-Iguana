# Terraform Module: Google Cloud SQL Database Setup

## Overview

This Terraform module sets up a Google Cloud SQL database instance with specified configurations, including database version, backup configurations, and users.

## Resources

The module creates the following resources:

- **random_id**: Generates a random suffix for the database instance name
- **google_sql_database_instance**: Manages a Google Cloud SQL database instance
- **google_sql_database**: Manages a database within a Cloud SQL instance
- **google_sql_user**: Manages users for the Cloud SQL instance

## Input Variables

| Name                      | Description                                                                 | Type    | Default             | Required |
|---------------------------|-----------------------------------------------------------------------------|---------|---------------------|----------|
| `db_instance_name`        | Name of the database instance                                               | string  | "db-postgres"       | no       |
| `database_version`        | Version of the database                                                     | string  | "POSTGRES_15"       | no       |
| `db_edition`              | The edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS           | string  | "ENTERPRISE"        | no       |
| `db_tier`                 | The instance type                                                           | string  | "db-custom-1-3840"  | no       |
| `db_availability_type`    | The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL) | string  | "ZONAL"             | no       |
| `db_disk_size`            | The size of the data disk, in GB                                            | number  | 10                  | no       |
| `db_retention_days`       | The number of days of transaction logs we retain for point in time restore  | number  | 7                   | no       |
| `db_name`                 | Name of the database                                                        | string  | "citizen-db"        | no       |
| `db_user`                 | Username for the database                                                   | string  | "citizen-user"      | no       |
| `region`                  | The region where the resources will be created                              | string  | n/a                 | yes      |
| `vpc_network_id`          | The ID of the VPC network for private IP configuration                      | string  | n/a                 | yes      |
| `environment`             | The environment label to be applied                                         | string  | n/a                 | yes      |
| `db_user_pass`            | Password for the database user                                              | string  | n/a                 | yes      |
| `db_deletion_protection`  | Whether to enable deletion protection for the database instance             | bool    | n/a                 | yes      |

## Outputs

| Name                  | Description                          |
|-----------------------|--------------------------------------|
| `database_private_ip` | The private IP address of the database instance |