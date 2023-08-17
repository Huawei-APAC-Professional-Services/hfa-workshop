resource "huaweicloud_cts_tracker" "hfa_system_tracker" {
  bucket_name = var.hfa_security_obs_bucket_name
}

resource "huaweicloud_smn_topic" "hfa_cts_topic" {
  name                     = "hfa_cts_topic"
  display_name             = "hfa_cts_topic"
  services_publish_allowed = "cts"
  introduction             = "created by hfa"
}

resource "huaweicloud_smn_subscription" "hfa_cts_notification_email" {
  topic_urn = huaweicloud_smn_topic.hfa_cts_topic.id
  endpoint  = var.hfa_cts_notification_email_address
  protocol  = "email"
  remark    = "cts notification"
}

resource "huaweicloud_cts_notification" "hfa_cts" {
  name           = "IAM_Operation_Notification"
  operation_type = "customized"
  smn_topic      = huaweicloud_smn_topic.hfa_cts_topic.topic_urn

  operations {
    service     = "IAM"
    resource    = "userGroup"
    trace_names = ["createUserGroup","deleteGroup","createGroup","deleteUserGroup"]
  }
}