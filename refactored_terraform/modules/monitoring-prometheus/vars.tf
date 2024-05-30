variable "env" {
  description = "Deploy environment"
  type        = string
}

variable "region" {
  description = "Deploy region"
  type        = string
}

variable "network" {
  description = "Network for resources"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork for resources"
  type        = string
}

variable "machine_type" {
  description = "Type of the VM"
  type        = string
}