############## project ##############

variable "project_id" {
  description = "Google cloud active project"
  type        = string
  default     = "diesel-studio-423421-p9"
}

variable "region" {
  description = "default region to deploy infrastructure"
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "The availability zone where the instance will be deployed"
  type        = string
  default     = "europe-west3-a"
}

variable "environment" {
  description = "Working environment"
  type        = string
  default     = "dev"
}
