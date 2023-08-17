module "transit_account_base_agency" {
  source                           = "../modules/base"
  hfa_iam_account                  = var.hfa_iam_account
  hfa_security_admin_agency_name   = var.hfa_security_admin_agency_name
  hfa_network_admin_agency_name    = var.hfa_network_admin_agency_name
  hfa_base_agency_name             = var.hfa_base_agency_name
  hfa_security_account             = var.hfa_security_account
  hfa_cts_log_transfer_agency_name = var.hfa_cts_log_transfer_agency_name
  providers = {
    huaweicloud = huaweicloud.transit
  }
}

output "hfa_transit_account" {
  value = var.hfa_transit_account
}

output "hfa_transit_account_custom_role_name" {
  value = module.transit_account_base_agency.hfa_custom_role_name
}