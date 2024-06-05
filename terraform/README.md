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
4. In `main.tf`, comment the lines:
```
backend "gcs" {
  bucket = "{env}-01-us-central1-geo-tf-state"
  prefix = "terraform/s3-tfstate"
}
```
4. Run the following commands:
```
   make plan
   make apply
```
5. In `main.tf`, uncomment the lines and change the environment on the relevant:
```
# backend "gcs" {
#   bucket = "{env}-01-us-central1-geo-tf-state"
#   prefix = "terraform/s3-tfstate"
# }
```
6. Run `make plan`.When prompted with 
```
"Do you want to migrate all workspaces to 'gcs'?"
```
**answer** "yes".

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

### Restoring Instance from Snapshot Disk via Terraform.

1. **Select the snapshot from which the disk will be created**
    - Navigate to Compute Engine > Snapshots.
    - Copy the name of snapshot.

2. **Change name of snapshot in Terraform**:
    - In the Terraform file of certain disk resource, change the value `disk_snapshot` with the name of the snapshot:
      ```
      disk_snapshot = "snapshot name"
      ```
3. **Recreate disk via Terraform**
    - Recreate the disk and attach it to the VM:
      ```
      make plan
      make apply
      ```
4. **Remount disk via script**:
    - Login via SSH to instance and run the following script:
      ```bash
      sudo bash -e /scripts/disk_remount.sh
      ```

### Restoring Instance from Snapshot Disk Manually. Use this option if creating the disk via Terraform is not possible.

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
        - **The Disk configuration should be the same as described in GCP console or terraform file disk resource**
        - Name: `disk`
        - Description: `Description`
        - Region: Region of the VM
        - Disk type: SSD persistent disk
        - Select or create a snapshot schedule: `daily-snapshot-policy`
    - Click `Create`.

5. **Change name of snapshot in Terraform**:
    - In the Terraform file of certain disk resource, change the value `disk_snapshot` with the name of the snapshot:
      ```
      disk_snapshot = "snapshot name"
      ```
6. **Refresh Terraform state**:
    - Run the following commands:
      ```
      terraform state rm [resource]
      terraform import -var-file ../workspace_vars/dev-01-us-central1-geo.json [resource] [zone]/[disk_name]
      ```
      Example:
      ```
      terraform state rm module.jenkins_vm.google_compute_disk.disk_jenkins
      terraform import -var-file ../workspace_vars/dev-01-us-central1-geo.json module.jenkins_vm.google_compute_disk.disk_jenkins us-central1-a/dev-01-us-central1-geo-disk-jenkins
      ```
7. **Attach disk via Terraform**
    - Check if the disk was created correctly and if Terraform will not destroy it:
      ```
      make plan
      ```
    - If Terraform will not destroy the disk resource, then everything is good. Write `make apply` to attach the disk to the VM:
      ```
      make apply
      ```
    - If Terraform mentions destroying the disk then try again from step 1.

8. **Remount disk via script**:
    - Login via SSH to instance and run the following script:
      ```bash
      sudo bash -e /scripts/disk_remount.sh
      ```
