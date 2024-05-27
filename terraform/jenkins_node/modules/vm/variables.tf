############## VM ##############

variable "instance_name" {}

variable "instance_type" {
  description = "The instance type to be used for the Compute Engine instance"
  type        = string
  default     = "e2-small"
}

variable "image_family" {
  description = "The family of the VM image for the instance to be launched"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "image_project" {
  description = "The project of the VM image for the instance to be launched"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "disk_type" {
  description = "The type of disk"
  type        = string
  default     = "pd-ssd"
}

variable "disk_size" {}

variable "environment" {}

variable "vpc_network" {}

variable "sub_network" {}

variable "public_ip" {}

variable "instance_deletion_protection" {}