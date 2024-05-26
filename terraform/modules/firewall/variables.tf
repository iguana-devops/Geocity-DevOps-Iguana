############## FIREWALL ##############

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}

variable "allowed_auto_scale" {
  description = "List of allowed ports to auto-scale"
  type        = list(any)
  default     = ["80", "443", "8000"]
}

variable "vpc_network_name" {}



