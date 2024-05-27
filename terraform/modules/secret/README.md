# Terraform Module: Google Cloud Secret Management

## Overview

This Terraform module manages secrets in Google Cloud using the Secret Manager. It creates a database user password and an SSH key for Jenkins VM, and stores them securely in Secret Manager.

## Resources

The module creates the following resources:

- **random_password**: Generates a random password for database user
- **tls_private_key**: Generates an SSH private key for Jenkins VM
- **google_secret_manager_secret**: Manages secrets in Google Cloud Secret Manager
- **google_secret_manager_secret_version**: Manages secret versions in Google Cloud Secret Manager

## Input Variables

| Name              | Description                             | Type   | Default              | Required |
|-------------------|-----------------------------------------|--------|----------------------|----------|
| `secret_id`       | Name of the secret                      | string | "database_credentials" | no       |
| `ssh_key_jenkins` | Name of the SSH key for Jenkins VM      | string | "jenkins_ssh"        | no       |
| `label_db`        | Label for the database secret           | string | "citizen-db"         | no       |
| `label_ssh_jenkins`| Label for the SSH key secret           | string | "jenkins_vm"         | no       |
| `environment`     | The environment label to be applied     | string | n/a                  | yes      |

## Outputs

| Name                | Description                                       |
|---------------------|---------------------------------------------------|
| `db_user_pass`      | The generated database user password (sensitive)  |
| `ssh_key_jenkins`   | The generated SSH private key for Jenkins VM (sensitive) |
| `ssh_key_jenkins_pub` | The generated SSH public key for Jenkins VM     |