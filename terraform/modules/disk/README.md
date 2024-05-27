# Terraform Module: Google Cloud Disk and Snapshot Policy Setup

## Overview

This Terraform module sets up a Google Cloud disk and applies a daily snapshot policy to it.

## Resources

The module creates the following resources:

- **google_compute_disk**: Manages a persistent disk
- **google_compute_resource_policy**: Manages a resource policy for daily snapshots
- **google_compute_disk_resource_policy_attachment**: Attaches the resource policy to the disk

## Input Variables

| Name                          | Description                                                                     | Type    | Default                   | Required |
|-------------------------------|---------------------------------------------------------------------------------|---------|---------------------------|----------|
| `disk_name`                   | The name of the disk                                                            | string  | "disk-jenkins"            | no       |
| `disk_description`            | Description of the disk                                                         | string  | "Disk for Jenkins config" | no       |
| `disk_type`                   | The type of disk                                                                | string  | "pd-ssd"                  | no       |
| `disk_size`                   | The size of the disk in GB                                                      | number  | 20                        | no       |
| `snapshot_policy_name`        | The name of the snapshot policy                                                 | string  | "daily-snapshot-policy"   | no       |
| `snapshot_policy_description` | Description of the snapshot policy                                              | string  | "snapshot policy once per day" | no |
| `snapshot_days_in_cycle`      | Number of days between each snapshot                                            | number  | 1                         | no       |
| `snapshot_start_time`         | The start time for the snapshot schedule                                        | string  | "00:00"                   | no       |
| `snapshot_max_retention_days` | Maximum retention days for snapshots                                            | number  | 7                         | no       |
| `snapshot_disk_deletion_policy`| Specifies the behavior to apply to scheduled snapshots when the source disk is deleted | string | "KEEP_AUTO_SNAPSHOTS"     | no       |
| `environment`                 | The environment label to be applied                                             | string  | n/a                       | yes      |

## Outputs

| Name               | Description                        |
|--------------------|------------------------------------|
| `disk_jenkins_id`  | The ID of the created disk         |