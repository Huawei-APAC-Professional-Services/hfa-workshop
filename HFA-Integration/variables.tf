variable "hfa_terraform_state_bucket" {
  type = string
}

variable "hfa_iam_state_key" {
  type = string
}

variable "hfa_terraform_state_region" {
  type    = string
  default = "ap-southeast-3"
}

variable "hfa_network_state_key" {
  type = string
}

variable "hfa_network_workload_state_key" {
  type = string
}

variable "hfa_app_state_key" {
  type = string
}

variable "hfa_default_region" {
  type    = string
  default = "ap-southeast-3"
}