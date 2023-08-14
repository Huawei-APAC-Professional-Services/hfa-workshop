variable "hfa_iam_account" {
  type = string
  description = "Central IAM Account Name"
}

variable "hfa_security_account" {
  type = string
  description = "Security Operation Account"
}

variable "hfa_security_admin_agency_name" {
  type = string
  default = "HFA-Security-Admin"
}

variable "hfa_network_admin_agency_name" {
  type = string
  default = "HFA-Network-Admin"
}

variable "hfa_base_agency_name" {
  default = "hfa_base_admin"
}

variable "hfa_cts_log_transfer_agency_name" {
  default = "hfa_cts_log_transfer"
}

