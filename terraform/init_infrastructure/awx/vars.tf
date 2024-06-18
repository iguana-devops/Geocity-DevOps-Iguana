variable "region" {
  description = "Region to deploy"
}

variable "zone" {
  description = "Zone to deploy"
}

variable "project" {
  description = "Project Id"
}

variable "storage_class" {
  description = "Storage class name"
  default     = "premium-rwo"
}

variable "awx_admin_username" {
  description = "AWX admin username"
  default     = "admin"
}

variable "env" {
  description = "The Working environment"
  type        = string
}

variable "app" {
  description = "The application name"
  type        = string
}
