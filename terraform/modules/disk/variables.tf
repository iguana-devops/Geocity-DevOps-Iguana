################ DISK ################

variable "disk_name" {
  description = "The name of the disk"
  type        = string
  default     = "disk-jenkins"
}

variable "disk_description" {
  description = "Description of the disk"
  type        = string
  default     = "Disk for Jenkins config"
}

variable "disk_type" {
  description = "The type of disk"
  type        = string
  default     = "pd-ssd"
}

variable "disk_size" {
  description = "The size of the disk in GB"
  type        = number
  default     = 20
}

variable "snapshot_policy_name" {
  description = "The name of the snapshot policy"
  type        = string
  default     = "daily-snapshot-policy"
}

variable "snapshot_policy_description" {
  description = "Description of the snapshot policy"
  type        = string
  default     = "snapshot policy once per day"
}

variable "snapshot_days_in_cycle" {
  description = "Number of hours between each snapshot"
  type        = number
  default     = 1
}

variable "snapshot_start_time" {
  description = "The start time for the snapshot schedule"
  type        = string
  default     = "00:00"
}

variable "snapshot_max_retention_days" {
  description = "Maximum retention days for snapshots"
  type        = number
  default     = 7
}

variable "snapshot_disk_deletion_policy" {
  description = "Specifies the behavior to apply to scheduled snapshots when the source disk is deleted"
  type        = string
  default     = "KEEP_AUTO_SNAPSHOTS"
}

variable "environment" {}

