############## VPC ##############

variable "network_name" {
  description = "The name of the network"
  type        = string
  default     = "vpc-dev"
}

variable "subnet_name" {
  description = "The name of the subnetwork"
  type        = string
  default     = "subnet-dev"
}

variable "subnet_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "network_tags" {
  description = "A list of network tags to be applied to the instance"
  type        = list(string)
  default     = ["web"]
}

variable "region" {}

variable "project_id" {}
