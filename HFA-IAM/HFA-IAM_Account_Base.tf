resource "huaweicloud_identity_agency" "hfa_cts_agency" {
  delegated_service_name = "op_svc_CTS"
  description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
  duration               = "FOREVER"
  name                   = "cts_admin_trust"
  project_role {
    project = "ap-southeast-1"
    roles = [
      "KMS Administrator",
      "SMN Administrator",
      "OBS Administrator"
    ]
  }
  project_role {
    project = "ap-southeast-3"
    roles = [
      "KMS Administrator",
      "SMN Administrator",
      "OBS Administrator"
    ]
  }

  all_resources_roles = ["Tenant Administrator"]

  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

resource "huaweicloud_identity_role" "hfa_domain_id" {
  name = "forgetdomainidfromterraform"
  type = "AX"
  policy = jsonencode({
    "Version" : "1.1",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Action" : [
          "iam:agencies:assume",
          "iam:tokens:assume"
        ]
      }
    ]
  })
  description = "Allowing terraform get domain id"
}

output "hfa_iam_account_custom_role_name" {
  value = huaweicloud_identity_role.hfa_domain_id.name
}