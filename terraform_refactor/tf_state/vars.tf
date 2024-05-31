variable "project" {
  description = "Google cloud active project"
  type        = string
  default     = "diesel-studio-423421-p9"
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

