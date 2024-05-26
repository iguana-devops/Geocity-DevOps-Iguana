################ SECRET ################

variable "secret_id" {
  description = "Name of secret"
  type        =  string
  default     = "database_credentials"
}

variable "ssh_key_jenkins" {
  description = "Name of SSH key for Jenkins VM"
  type        = string
  default     = "jenkins_ssh"
}

variable "label_db" {
  type        = string
  default     = "citizen-db"
}

variable "label_ssh_jenkins" {
  type        = string
  default     = "jenkins_vm"
}

variable "environment" {}