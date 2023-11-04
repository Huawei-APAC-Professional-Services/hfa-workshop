variable "hfa_cts_bucket_prefix" {
  type        = string
  description = "OBS Bucket for storing security related logs"
  default     = "hfa-archive"
  validation {
    condition     = var.hfa_cts_bucket_prefix != "" || can(regex("^[a-z0-9-.]+$", var.hfa_cts_bucket_prefix))
    error_message = "Invalid Bucket Name, can only contains lower letters,hyphens,period"
  }
}

variable "hfa_terraform_state_bucket" {
  type = string
}

variable "hfa_terraform_state_region" {
  type    = string
  default = null
}

variable "hfa_cts_log_region" {
  type    = string
  default = null
}

variable "hfa_config_log_region" {
  type    = string
  default = null
}

variable "hfa_iam_state_key" {
  type    = string
  default = "hfa-iam/terraform.tfstate"
}

variable "hfa_allowed_regions" {
  type    = set(string)
  default = ["ap-southeast-1", "ap-southeast-3"]
}

variable "hfa_config_bucket_prefix" {
  type    = string
  default = "hfa-config"
}