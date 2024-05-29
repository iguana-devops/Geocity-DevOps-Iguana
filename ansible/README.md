# Ansible Project Overview

## Introduction
This README provides an overview of the Ansible project structure, including details about the included roles, variable definitions, and setup requirements. This project is designed to manage and automate configurations across a series of servers.

## Requirements
- **Ansible Version**: 2.9 or later is required.
- **Target Systems**: Ubuntu 16.04 or newer.
- **Internet Access**: Required for fetching remote packages.

## Project Structure
- `gcp-ansible.gcp.yml`: Ansible inventory file defining groups and hosts.
- `playbook.yml`: Main playbook that includes roles and tasks for deployment.
- `roles/`: Directory containing roles, each designed to handle specific tasks:
  - `deploy_environment/`: Configures the environment that is required to deploy the application.
  - `deploy_application/`: Sets up and configures application "Geo citizen".
  - `deploy_monitoring_application/`: Sets up and configures application Node Exporter for monitoring servers.
- `data.yml`: This file contains the necessary configuration settings for deploying the application.
- `README.md`: This file, explaining project setup and structure.

## Roles Description
Each role in this project has a specific function:
- **deploy_environment**: Automates the deployment and configuration of Java, Tomcat, Maven, Git.
- **deploy_application**: Automates the deployment and configuration application "Geo citizen".
- **deploy_monitoring_application**: Automates the deployment and configuration application Node Exporter.

## Using This Project
To use this project, ensure you have configured your `gcp-ansible.gcp.yml` appropriately and configured your own `data.yml`. 
Create data.yml by using the following commands:
```bash
ansible-vault create data.yml
```
Run the main playbook using the following command:
```bash
ansible-playbook gcp-ansible.gcp.yml --ask-vault-pass
