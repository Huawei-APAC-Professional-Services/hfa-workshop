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

output "hfa_custom_role_name" {
  value = huaweicloud_identity_role.hfa_domain_id.name
}