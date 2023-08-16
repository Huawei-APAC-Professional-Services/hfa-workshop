resource "huaweicloud_cts_tracker" "hfa_security_account_system_tracker" {
  provider = huaweicloud.security
  bucket_name = var.HFA_Security_OBS_Bucket_Name
}

resource "huaweicloud_cts_tracker" "hfa_app_account_system_tracker" {
  provider = huaweicloud.app
  bucket_name = var.HFA_Security_OBS_Bucket_Name
}

resource "huaweicloud_cts_tracker" "hfa_common_account_system_tracker" {
  provider = huaweicloud.common
  bucket_name = var.HFA_Security_OBS_Bucket_Name
}

resource "huaweicloud_cts_tracker" "hfa_transit_account_system_tracker" {
  provider = huaweicloud.transit
  bucket_name = var.HFA_Security_OBS_Bucket_Name
}

resource "huaweicloud_cts_tracker" "hfa_iam_account_system_tracker" {
  bucket_name = var.HFA_Security_OBS_Bucket_Name
}