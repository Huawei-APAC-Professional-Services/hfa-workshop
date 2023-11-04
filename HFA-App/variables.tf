variable "hfa_terraform_state_bucket" {
  type        = string
  description = "OBS Bucket for storing terraform state"
}

variable "hfa_terraform_state_region" {
  type        = string
  default     = "ap-southeast-3"
  description = "OBS Bucket region for storing terraform state"
}

variable "hfa_iam_state_key" {
  type    = string
  default = "hfa-iam/terraform.tfstate"
}

variable "hfa_network_state_key" {
  type = string
  default = "hfa-network/terraform.tfstate"
}

variable "hfa_network_workload_state_key" {
  type = string
  default = "hfa-network-workloads/terraform.tfstate"
}

variable "nginx_admin_pass" {
  type        = string
  default     = "Nginx2023"
  description = "password for nginx server"
}