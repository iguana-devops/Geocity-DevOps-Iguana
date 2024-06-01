variable "instance_type" {
  description = "The instance OS"
  type        = string
}

variable "image_type" {
  description = "The instance type"
  type        = string
}

variable "disk_size" {
  description = "The size of jenkins disk"
  type        = number
}

variable "vpc_network" {
  description = "The VPC network for the instance"
  type        = string
}

variable "sub_network" {
  description = "The subnetwork for the instance"
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
