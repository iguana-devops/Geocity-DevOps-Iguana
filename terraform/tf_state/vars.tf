variable "project" {
  description = "Google cloud active project"
  type        = string
  default     = "amplified-grail-423921-n7"
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

