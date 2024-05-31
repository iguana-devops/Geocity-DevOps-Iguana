variable "db_disk_size" {
  description = "The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased"
  type        = number
}

variable "vpc_id" {}

variable "deletion_protection" {}

variable "region" {}

variable "app" {}

variable "env" {}