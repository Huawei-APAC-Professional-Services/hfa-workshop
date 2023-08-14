variable "HFA_Security_OBS_Bucket_Name" {
  type        = string
  description = "OBS Bucket for storing security related logs"
  default     = ""
  validation {
    condition     = var.HFA_Security_OBS_Bucket_Name != "" || can(regex("^[a-z0-9-.]+$", var.HFA_Security_OBS_Bucket_Name))
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