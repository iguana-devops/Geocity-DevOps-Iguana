# Terraform Module: Google Cloud Jenkins VM and Infrastructure Setup

## Overview

This Terraform module sets up the infrastructure required for Jenkins and other components in Google Cloud. It includes two sub-modules: `jenkins_vm` for creating the infrastructure for the Jenkins machine, and `infrastructure` for setting up the required networking and other services.

## Modules

### jenkins_vm

This module creates the infrastructure for the Jenkins machine in Google Cloud. It includes creating a VM instance, managing SSH keys in Secret Manager, and configuring automated backups for the Jenkins configuration disk.

#### Features:
- Access to SSH via GCP console or private key stored in Secret Manager.
- Automated backup for the `disk_jenkins` which is used for Jenkins configuration.

### infrastructure

This module sets up the infrastructure in Google Cloud via Jenkins node.

## Instructions

### Restoring Jenkins from Snapshot Disk

1. **Remove attached disk from VM**:
    - Navigate to Compute Engine > VM instances.
    - Select the instance `jenkins_vm` and click `Edit`.
    - Under `Additional disks`, remove the disk `disk-jenkins` and save.

2. **Delete the disk**:
    - Navigate to Compute Engine > Disks.
    - Select the disk `disk-jenkins` and delete it.

3. **Create disk from snapshot**:
    - Navigate to Compute Engine > Snapshots.
    - Select the snapshot and click `Create disk`.
    - Set the following values:
        - Name: `disk-jenkins`
        - Region: Region of the VM
        - Disk type: SSD persistent disk
        - Select or create a snapshot schedule: `daily-snapshot-policy`
    - Click `Create`.

4. **Attach the disk to VM**:
    - Navigate to Compute Engine > VM instances.
    - Select the instance `jenkins_vm` and click `Edit`.
    - Under `Additional disks`, attach the existing disk `disk-jenkins` and save.

5. **Login via SSH to Jenkins instance**:
    - Run the following script:
      ```bash
      sudo bash -e /scripts/disk_remount.sh
      ```

6. **Refresh Terraform state**:
    - Run the following commands:
      ```bash
      terraform state rm module.jenkins_vm.google_compute_disk.disk_jenkins
      terraform import module.jenkins_vm.google_compute_disk.disk_jenkins europe-central2-a/disk-jenkins
      ```