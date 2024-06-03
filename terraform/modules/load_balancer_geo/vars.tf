variable "app" {
  description = "The application name"
  type        = string
}

variable "env" {
  description = "Deploy environment"
  type        = string
}

variable "region" {
  description = "Deploy region"
  type        = string
}

variable "vpc_network" {
  description = "Vpc network for resources"
  type        = string
}

variable "sub_network" {
  description = "Subnetwork network for resources"
  type        = string
}

variable "image_type" {
  description = "The instance OS"
  type        = string
}
