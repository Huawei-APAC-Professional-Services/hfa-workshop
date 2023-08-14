#module "master_account_base_agency" {
#  source = "../modules/base"
#  hfa_iam_account = var.hfa_iam_account
#  hfa_security_admin_agency_name = var.hfa_security_admin_agency_name
#  hfa_network_admin_agency_name = var.hfa_network_admin_agency_name
#  providers = {
#    huaweicloud = huaweicloud.master
#  }
#}
#
#output "hfa_master_account" {
#    value = var.hfa_master_account
#}