variable "env" {
  description = "Deploy environment"
  type        = string
}

variable "region" {
  description = "Deploy region"
  type        = string
}

variable "zone" {
  description = "Deploy zone"
  type        = string
}

variable "machine_type" {
  description = "Type of the VM"
  type        = string
  default     = "e2-medium"
}

