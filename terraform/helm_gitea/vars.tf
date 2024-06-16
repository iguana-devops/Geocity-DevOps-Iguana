variable "username" {
  description = "The username for docker registry"
  type        = string
}

variable "password" {
  description = "The password for docker registry"
  type        = string
  sensitive   = true
}

variable "mail" {
  description = "The mail for docker registry"
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