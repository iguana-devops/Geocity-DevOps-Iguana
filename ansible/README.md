# Ansible Project Overview

## Introduction

This README provides an overview of the Ansible project structure, including details about the included roles, variable definitions, and setup requirements. This project is designed to manage and automate configurations across a series of servers.

## Requirements

- **Ansible Version**: 2.9 or later is required.
- **Target Systems**: Ubuntu 16.04 or newer.
- **Internet Access**: Required for fetching remote packages.

## Project Structure

- `inventory.ini`: Ansible inventory file defines groups and hosts. The group [node_exporters] includes the IPs of nodes that will deploy the application, while the group [monitoring] includes the IPs of nodes that will monitor the [node_exporters] group.
- `playbook.yml`: Main playbook that includes roles and tasks for setting up the necessary environment for deploying the application.
- `playbook_monitor.yml`: Main playbook that includes roles and tasks for deploying the monitoring group, which includes Grafana and Prometheus.
- `roles/`: Directory containing roles, each designed to handle specific tasks:
  - `deploy_environment/`: Configures the environment that is required to deploy the application.
  - `deploy_application/`: Sets up and configures application "Geo citizen".
  - `deploy_monitoring_application/`: Sets up and configures application Node Exporter for monitoring servers.
  - `deploy_grafana/`: Sets up and configures Grafana.
  - `deploy_prometheus/`: Sets up and configures Prometheus.
- `data_jfrog.yml`: This file contains authorization data for downloading JFrog artifact files..
- `README.md`: This file, explaining project setup and structure.

## Roles Description

Each role in this project has a specific function:

- **deploy_environment**: Automates the deployment and configuration of Java, Tomcat, Maven, Git.
- **deploy_application**: Automates the deployment and configuration application "Geo citizen".
- **deploy_monitoring_application**: Automates the deployment and configuration application Node Exporter.
- **deploy_grafana**: Automates the deployment and configuration application Grafana.
- **deploy_prometheus**: Automates the deployment and configuration application Prometheus.

## Using This Project

To use this project, ensure you have configured your `inventory.ini` appropriately and configured your own `data_jfrog.yml`.
Create data_jfrog.yml by using the following commands:

```bash
ansible-vault create data_jfrog.yml
```

Run the main playbook using the following command to set up the environment for the [node_exporters] group:

```bash
ansible-playbook -i inventory.ini playbook.yml -l node_exporters --ask-vault-pass
```

Run the main playbook using the following command to set up the environment for the [monitoring] group:

```bash
ansible-playbook -i inventory.ini playbook_monitor.yml -l monitoring
```
