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
  default     = 10
  type        = number
  description = "disk size in GB for each node"
}

locals{
  full_name_of_project = "${var.project}-${var.region}-${var.zone}"
}