################ SECRET ################

variable "secret_id" {
  description = "Name of secret"
  type        = string
  default     = "database_credentials"
}

variable "label" {
  type    = string
  default = "citizen-db"
}

