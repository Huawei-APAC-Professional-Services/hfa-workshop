module "hfa_security_account_system_tracker" {
  source = "../modules/cts"
  providers = {
    huaweicloud = huaweicloud.security
  }
  hfa_security_obs_bucket_name       = var.hfa_security_obs_bucket_name
  hfa_cts_notification_email_address = var.hfa_cts_notification_email_address
  depends_on                         = [huaweicloud_obs_bucket_acl.hfa_cts_log]
}

module "hfa_app_account_system_tracker" {
  source = "../modules/cts"
  providers = {
    huaweicloud = huaweicloud.app
  }
  hfa_security_obs_bucket_name       = var.hfa_security_obs_bucket_name
  hfa_cts_notification_email_address = var.hfa_cts_notification_email_address
  depends_on                         = [huaweicloud_obs_bucket_acl.hfa_cts_log]
}

module "hfa_common_account_system_tracker" {
  source = "../modules/cts"
  providers = {
    huaweicloud = huaweicloud.common
  }
  hfa_security_obs_bucket_name       = var.hfa_security_obs_bucket_name
  hfa_cts_notification_email_address = var.hfa_cts_notification_email_address
  depends_on                         = [huaweicloud_obs_bucket_acl.hfa_cts_log]
}

module "hfa_transit_account_system_tracker" {
  source = "../modules/cts"
  providers = {
    huaweicloud = huaweicloud.transit
  }
  hfa_security_obs_bucket_name       = var.hfa_security_obs_bucket_name
  hfa_cts_notification_email_address = var.hfa_cts_notification_email_address
  depends_on                         = [huaweicloud_obs_bucket_acl.hfa_cts_log]
}

module "hfa_iam_account_system_tracker" {
  source                             = "../modules/cts"
  hfa_security_obs_bucket_name       = var.hfa_security_obs_bucket_name
  hfa_cts_notification_email_address = var.hfa_cts_notification_email_address
  depends_on                         = [huaweicloud_obs_bucket_acl.hfa_cts_log]
}