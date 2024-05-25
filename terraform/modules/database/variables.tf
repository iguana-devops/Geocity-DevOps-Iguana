################ DATABASE ################

variable "db_instance_name" {
  description = "Name of Instance DB"
  type        = string
  default     = "db-postgres"
}

variable "db_name" {
  description = "Name of DB"
  type        = string
  default     = "citizen-db"
}

variable "db_user" {
  description = "Username of DB"
  type        = string
  default     = "citizen-user"
}

variable "region" {}

variable "vpc_network_id" {}

variable "environment" {}

variable "db_user_pass" {}

