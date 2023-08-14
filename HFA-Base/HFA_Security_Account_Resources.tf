resource "huaweicloud_obs_bucket" "hfa_security_log" {
  provider   = huaweicloud.security
  bucket     = var.HFA_Security_OBS_Bucket_Name
  versioning = true
}

output "Security_Account_Log_Bucket" {
  value = var.HFA_Security_OBS_Bucket_Name
}