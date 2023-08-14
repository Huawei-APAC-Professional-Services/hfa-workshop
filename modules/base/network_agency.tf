resource "huaweicloud_identity_agency" "hfa_networkd_admin" {
  name                  = var.hfa_network_admin_agency_name
  description           = "Manage all network resources arcoss HFA"
  delegated_domain_name = var.hfa_iam_account

  all_resources_roles = [
    "ER FullAccess",
    "VPC FullAccess",
    "NAT FullAccess",
    "ELB FullAccess"
  ]
}

output "hfa_network_admin_agency_id" {
  value = huaweicloud_identity_agency.hfa_networkd_admin.id
}
