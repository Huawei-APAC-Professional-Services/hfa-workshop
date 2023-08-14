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
  default = "Object key for HFA-IAM state"
}

variable "hfa_network_state_key" {
  type = string
}

variable "hfa_default_region" {
  type        = string
  description = "Using default region otherwise specified"
  default     = "ap-southeast-3"
}

variable "nginx_admin_pass" {
  type        = string
  default     = "Nginx2023"
  description = "password for nginx server"
}