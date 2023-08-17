variable "hfa_security_obs_bucket_name" {
  type        = string
  description = "OBS Bucket for storing security related logs"
  default     = ""
  validation {
    condition     = var.hfa_security_obs_bucket_name != "" || can(regex("^[a-z0-9-.]+$", var.hfa_security_obs_bucket_name))
    error_message = "Invalid Bucket Name, can only contains lower letters,hyphens,period"
  }
}

variable "hfa_default_region" {
  type    = string
  default = "ap-southeast-3"
}

variable "hfa_terraform_state_bucket" {
  type = string
}
variable "hfa_terraform_state_region" {
  type = string
}

variable "hfa_iam_state_key" {
  type = string
}

variable "hfa_cts_notification_email_address" {
  type = string
}