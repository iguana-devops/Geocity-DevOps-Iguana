variable "project" {
  description = "Google cloud active project"
  type        = string
  default = "amplified-grail-423921-n7"
}

variable "env" {
  description = "The Working environment"
  type        = string
  default = "dev-01"
}

variable "app" {
  description = "The application name"
  type        = string
  default = "geo"
}

variable "region" {
  description = "The default region to deploy infrastructure"
  type        = string
  default = "us-east1"
}

variable "zone" {
  description = "The availability zone where the resource will be deployed"
  type        = string
  default = "us-east1-b"
}

