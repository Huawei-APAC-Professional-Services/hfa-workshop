resource "huaweicloud_identity_agency" "hfa_base_agency" {
  name                  = var.hfa_base_agency_name
  description           = "Allow infra team to configure all basic resources in a member account"
  delegated_domain_name = var.hfa_iam_account

  domain_roles = ["Tenant Administrator","KMS Administrator"]
}

output "hfa_base_agency_id" {
  value = huaweicloud_identity_agency.hfa_base_agency.id
}