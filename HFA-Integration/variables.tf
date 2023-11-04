variable "hfa_terraform_state_bucket" {
  type = string
}

variable "hfa_iam_state_key" {
  type = string
  default = "hfa-iam/terraform.tfstate"
}

variable "hfa_terraform_state_region" {
  type    = string
  default = "ap-southeast-3"
}

variable "hfa_network_state_key" {
  type = string
  default = "hfa-network/terraform.tfstate"
}

variable "hfa_network_workload_state_key" {
  type = string
  default = "hfa-network-workloads/terraform.tfstate"
}

variable "hfa_app_state_key" {
  type = string
  default = "hfa-app/terraform.tfstate"
}