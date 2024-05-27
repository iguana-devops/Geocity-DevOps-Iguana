# Terraform Module: Google Cloud Services Setup

## Overview

This Terraform module enables a specified list of Google Cloud services for a project.

## Resources

The module creates the following resource:

- **google_project_service**: Enables specified Google Cloud services

## Input Variables

| Name      | Description                         | Type         | Default                                         | Required |
|-----------|-------------------------------------|--------------|-------------------------------------------------|----------|
| `services`| A list of services to enable        | list(string) | ["compute.googleapis.com", "servicenetworking.googleapis.com", "secretmanager.googleapis.com"] | no       |