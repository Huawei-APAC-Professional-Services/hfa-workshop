data "huaweicloud_identity_custom_role" "hfa_security_account_fake_role" {
  provider = huaweicloud.security
  name = data.terraform_remote_state.hfa_iam.outputs.hfa_security_account_custom_role_name
}

data "huaweicloud_identity_custom_role" "hfa_app_account_fake_role" {
  provider = huaweicloud.app
  name = data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_custom_role_name
}

data "huaweicloud_identity_custom_role" "hfa_common_account_fake_role" {
  provider = huaweicloud.common
  name = data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_custom_role_name
}

data "huaweicloud_identity_custom_role" "hfa_iam_account_fake_role" {
  name = data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_custom_role_name
}

data "huaweicloud_identity_custom_role" "hfa_transit_account_fake_role" {
  provider = huaweicloud.transit
  name = data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_custom_role_name
}

resource "huaweicloud_obs_bucket" "hfa_security_log" {
  provider   = huaweicloud.security
  bucket     = var.HFA_Security_OBS_Bucket_Name
  versioning = true
}

resource "huaweicloud_obs_bucket_acl" "hfa_cts_log" {
  provider = huaweicloud.security
  bucket = var.HFA_Security_OBS_Bucket_Name

  account_permission {
    access_to_bucket = ["READ", "WRITE"]
    access_to_acl    = ["READ_ACP", "WRITE_ACP"]
    account_id       = data.huaweicloud_identity_custom_role.hfa_transit_account_fake_role.domain_id
  }

  account_permission {
    access_to_bucket = ["READ", "WRITE"]
    access_to_acl    = ["READ_ACP", "WRITE_ACP"]
    account_id       = data.huaweicloud_identity_custom_role.hfa_iam_account_fake_role.domain_id
  }

  account_permission {
    access_to_bucket = ["READ", "WRITE"]
    access_to_acl    = ["READ_ACP", "WRITE_ACP"]
    account_id       = data.huaweicloud_identity_custom_role.hfa_app_account_fake_role.domain_id
  }

  account_permission {
    access_to_bucket = ["READ", "WRITE"]
    access_to_acl    = ["READ_ACP", "WRITE_ACP"]
    account_id       = data.huaweicloud_identity_custom_role.hfa_common_account_fake_role.domain_id
  }
}

output "Security_Account_Log_Bucket" {
  value = var.HFA_Security_OBS_Bucket_Name
}