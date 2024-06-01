variable "db_disk_size" {
  description = "The size of data disk, in GB."
  type        = number
}

variable "vpc_id" {
  description = "The VPC id"
  type        = string
}

variable "deletion_protection" {
  description = "The deletion protection policy"
  type        = bool
}

variable "env" {
  description = "The Working environment"
  type        = string
}

variable "app" {
  description = "The application name"
  type        = string
}

variable "region" {
  description = "The default region to deploy infrastructure"
  type        = string
}