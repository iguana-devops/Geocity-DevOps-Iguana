############## VM ##############

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "jenkins-vm"
}

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

variable "disk_name" {
  description = "Name of the attached disk"
  type        = string
  default     = "disk_jenkis"
}

variable "environment" {}

variable "vpc_network" {}

variable "sub_network" {}

variable "public_ip" {}

variable "disk_jenkins_id" {}

variable "ssh_key_pub" {}
