variable "hfa_default_region" {
  type        = string
  description = "Using default region otherwise specified"
  default     = "ap-southeast-3"
}
variable "hfa_iam_base_agency_name" {
  type        = string
  description = "HFA IAM Agency Name in every acount except Central IAM Account for delegating permission to IAM Account"
  default     = "hfa_terraform"
}

#variable "hfa_master_account" {
#  type = string
#  description = "Master Account Name"
#}

variable "hfa_iam_account" {
  type        = string
  description = "Central IAM Account Name"
}

variable "hfa_security_account" {
  type        = string
  description = "HFA security account"
}

variable "hfa_transit_account" {
  type        = string
  description = "HFA transit account"
}

variable "hfa_common_account" {
  type        = string
  description = "HFA common account"
}

variable "hfa_app_account" {
  type        = string
  description = "HFA app account"
}

variable "hfa_terraform_state_bucket" {
  type        = string
  description = "OBS Bucket for storing terraform state"
}

variable "hfa_iam_state_key" {
  type = string
}

variable "hfa_network_state_key" {
  type = string
}


variable "hfa_app_state_key" {
  type    = string
  default = "hfa-app/terraform.tfstate"
}

variable "hfa_base_state_key" {
  type    = string
  default = "hfa-base/terraform.tfstate"
}

variable "hfa_iam_acccount_security_group_name" {
  type    = string
  default = "HFA_Security"
}

variable "hfa_iam_account_pipeline_network_group_name" {
  type    = string
  default = "HFA_Pipeline_Network"
}

variable "hfa_iam_account_pipeline_network_user_name" {
  type    = string
  default = "HFA_Pipeline_Network"
}

variable "hfa_iam_account_app_admin_group_name" {
  type    = string
  default = "hfa_pipeline_app"
}

variable "hfa_iam_account_pipeline_app_user_name" {
  type    = string
  default = "HFA_Pipeline_App"
}

variable "hfa_security_admin_agency_name" {
  type    = string
  default = "HFA-Security-Admin"
}

variable "hfa_network_admin_agency_name" {
  type    = string
  default = "HFA-Network-Admin"
}

variable "hfa_network_state_ingress_key" {
  type = string
}

variable "hfa_iam_account_pipeline_base_group_name" {
  type = string
  default = "hfa_pipeline_base"
}

variable "hfa_iam_account_pipeline_base_user_name" {
  type = string
  default = "hfa_pipeline_base"
}

variable "hfa_base_agency_name" {
  type = string
  default = "hfa_base_admin"
}

variable "hfa_cts_log_transfer_agency_name" {
  type = string
  default = "hfa_log_transfer"
}