############## project ##############

variable "project_id" {
  description = "Google cloud active project"
  type        = string
  default     = "diesel-studio-423421-p9"
}

variable "region" {
  description = "default region to deploy infrastructure"
  type        = string
  default     = "europe-central2"
}

variable "zone" {
  type        = string
  description = "The availability zone where the instance will be deployed"
  default     = "europe-central2-a"
}

variable "environment" {
  default = "dev"
  type    = string
}