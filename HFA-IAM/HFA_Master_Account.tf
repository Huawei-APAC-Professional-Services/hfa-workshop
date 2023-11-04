#variable "hfa_master_account_name" {
#  type        = string
#  description = "name of master account"
#}
#
#
#provider "huaweicloud" {
#  region = var.hfa_default_region
#  alias  = "master"
#
#  assume_role {
#    agency_name = var.hfa_base_agency_name
#    domain_name = var.hfa_master_account_name
#  }
#}
#
#data "huaweicloud_account" "hfa_master_account" {
#  provider = huaweicloud.master
#}
#
#output "hfa_master_account_id" {
#  value = data.huaweicloud_account.hfa_master_account.id
#}