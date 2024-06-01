############## project ##############

variable "project_id" {
  description = "Google cloud active project"
  type        = string
  default     = "amplified-grail-423921-n7"
}

variable "region" {
  description = "default region to deploy infrastructure"
  type        = string
  default     = "europe-central2"
}

variable "zone" {
  description = "The availability zone where the instance will be deployed"
  type        = string
  default     = "europe-central2-a"
}

variable "environment" {
  description = "Working environment"
  type        = string
  default     = "dev"
}

variable "services" {
  description = "A list of services to enable."
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "secretmanager.googleapis.com"
  ]
}
