############## NETWORK ##############

variable "subnet_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}

variable "region" {}

variable "project_id" {}
