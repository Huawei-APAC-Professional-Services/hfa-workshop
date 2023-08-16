data "huaweicloud_identity_role" "hfa_iam_readonly" {
  display_name = "IAM ReadOnlyAccess"
}

data "huaweicloud_identity_role" "hfa_cts_admin" {
  display_name = "CTS Administrator"
}

data "huaweicloud_identity_role" "hfa_obs_admin" {
  display_name = "OBS Administrator"
}

resource "huaweicloud_identity_group" "hfa_iam_pipeline_base" {
  name        = var.hfa_iam_account_pipeline_base_group_name
  description = "network Group in Central IAM Account allowing network operations in member account"
}

resource "huaweicloud_identity_role" "hfa_iam_pipeline_base" {
  name = var.hfa_iam_account_pipeline_base_group_name
  type = "AX"
  policy = jsonencode({
    "Version" : "1.1",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:agencies:assume",
          "iam:tokens:assume"
        ],
        "Resource" : {
          "uri" : [
            "/iam/agencies/${module.security_account_base_agency.hfa_base_agency_id}",
            "/iam/agencies/${module.transit_account_base_agency.hfa_base_agency_id}",
            "/iam/agencies/${module.common_account_base_agency.hfa_base_agency_id}",
            "/iam/agencies/${module.app_account_base_agency.hfa_base_agency_id}",
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
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_iam_state_key}"
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
          "OBS:*:*:object:${var.hfa_terraform_state_bucket}/${var.hfa_base_state_key}"
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

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_base" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_base.id
  role_id    = huaweicloud_identity_role.hfa_iam_pipeline_base.id
  project_id = "all"
}

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_base_iamread" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_base.id
  role_id    = data.huaweicloud_identity_role.hfa_iam_readonly.id
  project_id = "all"
}

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_base_ctsadmin" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_base.id
  role_id    = data.huaweicloud_identity_role.hfa_cts_admin.id
  project_id = "all"
}

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_base_obsadmin" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_base.id
  role_id    = data.huaweicloud_identity_role.hfa_obs_admin.id
  project_id = "all"
}

resource "huaweicloud_identity_group_role_assignment" "hfa_iam_pipeline_base_kms" {
  group_id   = huaweicloud_identity_group.hfa_iam_pipeline_base.id
  role_id    = huaweicloud_identity_role.hfa_state_kms.id
  project_id = "all"
}

resource "huaweicloud_identity_user" "hfa_iam_pipeline_base" {
  name        = var.hfa_iam_account_pipeline_base_user_name
  description = "A IAM user for HFA network operations"
  enabled     = true
  access_type = "programmatic"
  pwd_reset   = false
}

resource "huaweicloud_identity_group_membership" "hfa_iam_pipeline_base" {
  group = huaweicloud_identity_group.hfa_iam_pipeline_base.id
  users = [
    huaweicloud_identity_user.hfa_iam_pipeline_base.id
  ]
}

resource "huaweicloud_identity_access_key" "hfa_iam_pipeline_base" {
  user_id     = huaweicloud_identity_user.hfa_iam_pipeline_base.id
  secret_file = "/doesntexists/secrest"
}


output "hfa_iam_pipeline_base_ak" {
  value = huaweicloud_identity_access_key.hfa_iam_pipeline_base.id
}

output "hfa_iam_pipeline_base_sk" {
  sensitive = true
  value     = huaweicloud_identity_access_key.hfa_iam_pipeline_base.secret
}