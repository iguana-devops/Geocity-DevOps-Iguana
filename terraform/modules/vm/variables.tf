############## VM ##############

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

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "webserver"
}

variable "network_tags" {
  description = "A list of network tags to be applied to the instance"
  type        = list(string)
  default     = ["web"]
}

variable "environment" {}

variable "zone" {}

variable "vpc_network" {}

variable "sub_network" {}

variable "public_ip" {}
