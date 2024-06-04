# Infrastructure in GCP for the Geocity Web Application

## Overview

This project builds and hosts infrastructure for the web application Geocity on Google Cloud Platform (GCP). It implements a comprehensive development and build process lifecycle.

## Technology

![GCP](https://img.shields.io/badge/Google%20Cloud-4285F4?style=flat-square&logo=google-cloud&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=flat-square&logo=terraform&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat-square&logo=jenkins&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)
![JFrog](https://img.shields.io/badge/JFrog-41BF47?style=flat-square&logo=jfrog&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white)
![Load Balancer](https://img.shields.io/badge/Load%20Balancer-0052CC?style=flat-square&logo=load-balancer&logoColor=white)
![Auto Scaling Group](https://img.shields.io/badge/Auto%20Scaling%20Group-0000FF?style=flat-square&logo=auto-scaling&logoColor=white)
![Maven](https://img.shields.io/badge/Apache%20Maven-C71A36?style=flat-square&logo=apache-maven&logoColor=white)
![DNS](https://img.shields.io/badge/DNS-008000?style=flat-square&logo=dns&logoColor=white)
![TLS](https://img.shields.io/badge/TLS-000000?style=flat-square&logo=tls&logoColor=white)

## GCP architecture

![My_drawio drawio](https://github.com/iguana-devops/geocity/assets/69010595/469e383a-ba5f-42bf-a41e-3bab5c795524)

## Project Structure

The Geocity project is composed of several key modules, each responsible for specific aspects of the infrastructure and application lifecycle:

- **Terraform**: Builds and manages infrastructure in Google Cloud Platform (GCP).
- **Jenkins**: Implements CI/CD pipelines with jobs for:
  - Building infrastructure via Terraform.
  - Building the application and pushing it to JFrog Artifactory.
  - Configuring virtual machines (VMs) using Ansible.
  - Destroying infrastructure via Terraform.
- **Ansible**: Configures instances to run the Geocity application and monitoring.
- **Java-app**: Contains the Geocity web application.

### Directory Structure

The following is an overview of the project's directory structure:
```
Geocity/
├── ansible
│   ├── ansible.cfg
│   ├── data_jfrog.yml
│   ├── inventory.ini
│   ├── playbook_monitor.yml
│   ├── playbook.yml
│   ├── README.md
│   └── roles
├── java-app
│   ├── front-end
│   ├── pom.xml
│   ├── README.md
│   ├── resources
│   └── src
├── Jenkins
│   ├── env.sh
│   ├── Jenkinsfile_ansible
│   ├── Jenkinsfile_build
│   ├── Jenkinsfile_terraform
│   ├── Jenkinsfile_terraform_destroy
│   └── README.md
├── terraform
│   ├── init_infrastructure
│   ├── main_infrastructure
│   ├── modules
│   ├── README.md
│   ├── tf_state
│   └── workspace_vars
├── README.md
└── LICENSE
```

## Deployment Steps

1. **Create S3 Bucket**: 
   - Create an S3 bucket for the tfstate backend in `terraform/tf_state`.

2. **Build Initial Infrastructure**: 
   - Build the initial infrastructure in `terraform/init_infrastructure`. 
   - This step sets up the VPC, Jenkins, Grafana, and JFrog.

3. **Build Main Infrastructure**: 
   - The main infrastructure in `terraform/main_infrastructure` is built via Jenkins. 
   - Use the Jenkins job defined in `Jenkins/Jenkinsfile_terraform`.

4. **Configure Instances**: 
   - Configure the instances in the auto scaling group using Ansible. 
   - Use the Jenkins job `Jenkinsfile_ansible`.

For more details, refer to the README files in those modules.

## Services URL Host

- **Geo Citizen**: [iguana-devops.pp.ua/citizen](http://iguana-devops.pp.ua/citizen)
- **Jenkins**: [jenkins.iguana-devops.pp.ua:8443](http://jenkins.iguana-devops.pp.ua:8443)
- **JFrog**: [jfrog.iguana-devops.pp.ua](http://jfrog.iguana-devops.pp.ua)
- **Grafana**: [grafana.iguana-devops.pp.ua:3000](http://grafana.iguana-devops.pp.ua:3000)

## Authors
- [Aliona Sahaidak](https://github.com/AlanaSahaidak)
- [Andrii Kovalchuk](https://github.com/andrii-p-kovalchuk)
- [Yurii Belichenko](https://github.com/Yura11)
- [Mykhailo Lavryniv](https://github.com/muhaluk322)