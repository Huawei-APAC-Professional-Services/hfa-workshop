resource "huaweicloud_identity_group" "hfa_iam_pipeline_integration" {
  name        = var.hfa_iam_account_pipeline_integration_group_name
  description = "Integration Group in Central IAM Account allowing integrate separated resource together"
}

resource "huaweicloud_identity_role" "hfa_iam_pipeline_integration" {
  name = var.hfa_iam_account_pipeline_integration_group_name
  type = "AX"
  policy = jsonencode({
    "Version" : "1.1",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:agencies:assume"
        ],
        "Resource" : {
          "uri" : [
            "/iam/agencies/${module.security_account_base_agency.hfa_network_admin_agency_id}",
            "/iam/agencies/${module.transit_account_base_agency.hfa_network_admin_agency_id}",
            "/iam/agencies/${module.common_account_base_agency.hfa_network_admin_agency_id}",
            "/iam/agencies/${module.app_account_base_agency.hfa_network_admin_agency_id}",
          ]
        }
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "obs:object:GetObject",
          "obs:object:GetObjectVersion",
        ]
        "Resource" : [
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_iam_state_key}",
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_app_state_key}",
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_network_state_key}",
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_network_workloads_state_key}"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "obs:object:GetObject",
          "obs:object:AbortMultipartUpload",
          "obs:object:DeleteObject",
          "obs:object:PutObject",
          "obs:object:ModifyObjectMetaData",
          "obs:object:GetObjectVersion",
        ]
        "Resource" : [
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_integration_state_key}",
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "obs:bucket:HeadBucket",
          "obs:bucket:ListBucket"
        ]
        "Resource" : [
          "OBS:*:*:bucket:${var.hfa_terraform_state_bucket}"
        ]
      }
    ]
  })
  description = "Allowing Assume Role and access state file"
}

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_integration" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_integration.id
  role_id    = huaweicloud_identity_role.hfa_iam_pipeline_integration.id
  project_id = "all"
}

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_integration_kms" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_integration.id
  role_id    = huaweicloud_identity_role.hfa_state_kms.id
  project_id = "all"
}

resource "huaweicloud_identity_user" "hfa_iam_pipeline_integration" {
  name        = var.hfa_iam_account_pipeline_integration_user_name
  description = "A IAM user for HFA network operations"
  enabled     = true
  access_type = "programmatic"
  pwd_reset   = false
}

resource "huaweicloud_identity_group_membership" "hfa_iam_pipeline_integration" {
  group = huaweicloud_identity_group.hfa_iam_pipeline_integration.id
  users = [
    huaweicloud_identity_user.hfa_iam_pipeline_integration.id
  ]
}

resource "huaweicloud_identity_access_key" "hfa_iam_pipeline_integration" {
  user_id     = huaweicloud_identity_user.hfa_iam_pipeline_integration.id
  secret_file = "/doesntexists/secrest"
}

output "hfa_iam_pipeline_integration_ak" {
  value = huaweicloud_identity_access_key.hfa_iam_pipeline_integration.id
}

output "hfa_iam_pipeline_integration_sk" {
  sensitive = true
  value     = huaweicloud_identity_access_key.hfa_iam_pipeline_integration.secret
}