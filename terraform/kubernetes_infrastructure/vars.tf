variable "project" {
  description = "Google cloud active project"
  type        = string
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

variable "zone" {
  description = "The availability zone where the resource will be deployed"
  type        = string
}

variable "gke_num_nodes" {
  default     = 3
  type        = number
  description = "number of gke nodes"
}

variable "gke_disk_size" {
  default     = 20
  type        = number
  description = "disk size in GB for each node"
}

variable "app_additional" {
  description = "The name of additional application"
  type        = string
}

variable "region_additional" {
  description = "The region that used in additional application"
  type        = string
}

locals {
  full_name               = "${var.env}-${var.region}-${var.app}"
  additional_app_vpc_name = "${var.env}-${var.region_additional}-${var.app_additional}"
}