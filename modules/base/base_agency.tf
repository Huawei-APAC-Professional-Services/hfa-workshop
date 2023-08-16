resource "huaweicloud_identity_agency" "hfa_base_agency" {
  name                  = var.hfa_base_agency_name
  description           = "Allow infra team to configure all basic resources in a member account"
  delegated_domain_name = var.hfa_iam_account

  all_resources_roles = ["OBS Administrator","IAM ReadOnlyAccess","CTS Administrator"]
}

output "hfa_base_agency_id" {
  value = huaweicloud_identity_agency.hfa_base_agency.id
}

output "hfa_base_agency_name" {
  value = huaweicloud_identity_agency.hfa_base_agency.name
}