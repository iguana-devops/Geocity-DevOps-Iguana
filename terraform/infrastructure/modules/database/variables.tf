################ DATABASE ################

variable "database_version" {
  description = "Version of DB"
  type        = string
  default     = "POSTGRES_15"
}

variable "db_edition" {
  description = "he edition of the instance, can be ENTERPRISE or ENTERPRISE_PLUS"
  type        = string
  default     = "ENTERPRISE"
}

variable "db_tier" {
  description = "The instance type"
  type        = string
  default     = "db-custom-1-3840"
}

variable "db_availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)"
  type        = string
  default     = "ZONAL"
}

variable "db_disk_size" {
  description = "The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased"
  type        = number
  default     = 10
}

variable "db_retention_days" {
  description = "The number of days of transaction logs we retain for point in time restore"
  type        = number
  default     = 7
}

variable "db_name" {
  description = "Name of DB"
  type        = string
  default     = "citizen-db"
}

variable "db_user" {
  description = "Username of DB"
  type        = string
  default     = "citizen-user"
}

variable "region" {}

variable "vpc_network_id" {}

variable "environment" {}

variable "db_deletion_protection" {}