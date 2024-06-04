# Terraform Module: Google Cloud Storage Bucket for Terraform State

## Overview

This Terraform module sets up a Google Cloud Storage (GCS) bucket for storing Terraform state files with versioning and lifecycle management.

## Resources

The module creates the following resources:

- **google_storage_bucket**: Manages a GCS bucket for Terraform state files

## Input Variables

| Name      | Description                             | Type    |
|-----------|-----------------------------------------|---------|
| `project` | Google cloud active project             | string  |
| `env`     | The working environment                 | string  |
| `app`     | The application name                    | string  |
| `region`  | The default region to deploy infrastructure | string  |