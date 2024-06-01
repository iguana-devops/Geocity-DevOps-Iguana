# Terraform Google Cloud Provider

## Overview
This Terraform module sets up the Cloud infrastructure in Google Cloud. It includes five directories: `workspace_vars`, `tf_state`, `init_infrastructure`, `main_infrastructure`, `modules`.

## Directories

### workspace_vars
This directory contains initial files for Terraform workspace.

### tf_state
This directory contains Terraform configuration for creating an S3 bucket for backend.

### init_infrastructure
This folder contains the initial cloud infrastructure setup, including VPC, Jenkins, JFrog, and Grafana.

### main_infrastructure
This folder contains the main cloud infrastructure managed by Jenkins.

### modules
This folder contains initialized Terraform modules.

## Instructions

### Add GCP Service Account Credentials File to Your Shell PATH as an Environment Variable
```
$env:GOOGLE_APPLICATION_CREDENTIALS = "path/to/file.json"
```

### Setting Up S3 Buckets for Backend
To start the project, you need to create an S3 bucket for each environment: dev, stage, prod. 

1. **Path:** `terraform/tf_state`

2. For each environment (dev, stage, prod), update the `Makefile` with the environment:
```
GEO_ENV ?= {env}-01-us-central1-geo
```
3. Run the following commands:
```
   make plan
   make apply
```
4. In `main.tf`, uncomment the lines and change the environment:
```
# backend "gcs" {
#   bucket = "{env}-01-us-central1-geo-tf-state"
#   prefix = "terraform/s3-tfstate"
# }
```
5. Run `make plan`.When prompted with 
```
"Do you want to migrate all workspaces to 'gcs'?"
```
**answer** "yes".
6. Comment out the backend configuration again: 
```
backend "gcs" {
  bucket = "{env}-01-us-central1-geo-tf-state"
  prefix = "terraform/s3-tfstate"
}
```
7. **Delete**: the `.terraform/terraform.tfstate` file.

### Initial Infrastructure Setup
1. **Path:** `terraform/init_infrastructure`
2. For different environments, update the `Makefile` and backend configuration in `main.tf`:

**main.tf**:
```
bucket = "geocity-{env}-01-us-central1-tf-state"
```

**Makefile**: 
```
GEO_ENV ?= {env}-01-us-central1-geo
```
3. Run the following commands:
```
make plan
make apply
```

### Main Cloud Infrastructure Setup
The main cloud infrastructure runs by Jenkins, but for testing purposes, you can run it locally. 
1. **Path:** `terraform/main_infrastructure`
2. Follow the same instructions as for the initial infrastructure setup.

## Backup restore

### Restoring Instance from Snapshot Disk

1. **Remove attached disk from VM**:
    - Navigate to Compute Engine > VM instances.
    - Select the `instance` and click `Edit`.
    - Under `Additional disks`, remove the disk `disk` and save.

2. **Delete the disk**:
    - Navigate to Compute Engine > Disks.
    - Select the disk `disk` and delete it.

3. **Create disk from snapshot**:
    - Navigate to Compute Engine > Snapshots.
    - Select the snapshot and click `Create disk`.
    - Set the following values:
        - Name: `disk` (it should be the same name of deleted disk)
        - Region: Region of the VM
        - Disk type: SSD persistent disk
        - Select or create a snapshot schedule: `daily-snapshot-policy`
    - Click `Create`.

4. **Attach the disk to VM**:
    - Navigate to Compute Engine > VM instances.
    - Select the `instance` and click `Edit`.
    - Under `Additional disks`, attach the existing disk `disk` and save.

5. **Login via SSH to Jenkins instance**:
    - Run the following script:
      ```bash
      sudo bash -e /scripts/disk_remount.sh
      ```

6. **Refresh Terraform state**:
    - Run the following commands:
      ```
      terraform state rm module.jenkins_vm.google_compute_disk.disk_jenkins
      terraform import module.jenkins_vm.google_compute_disk.disk_jenkins europe-central2-a/disk-jenkins
      ```