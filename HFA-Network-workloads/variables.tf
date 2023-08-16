variable "hfa_app_prod_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "hfa_common_prod_cidr" {
  type = string
}

variable "hfa_terraform_state_region" {
  type        = string
  default     = "ap-southeast-3"
  description = "OBS Bucket region for storing terraform state"
}

variable "hfa_terraform_state_bucket" {
  type = string
}

variable "hfa_iam_state_key" {
  type = string
}

variable "hfa_default_region" {
  type = string
  default = "ap-southeast-3"
}

variable "hfa_network_state_key" {
  type = string
}