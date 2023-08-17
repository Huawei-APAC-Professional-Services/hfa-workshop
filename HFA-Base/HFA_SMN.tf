resource "huaweicloud_smn_topic" "hfa_cts_topic_iam" {
  name                     = "hfa_cts_topic"
  display_name             = "hfa_cts_topic"
  services_publish_allowed = "cts"
  introduction             = "created by hfa"
}

resource "huaweicloud_smn_subscription" "hfa_cts_iam_notification_email" {
  topic_urn = huaweicloud_smn_topic.hfa_cts_topic_iam.id
  endpoint  = var.hfa_cts_notification_email_address
  protocol  = "email"
  remark    = "cts notification"
}

resource "huaweicloud_cts_notification" "hfa_cts_iam" {
  name           = "IAM_Operation_Notification"
  operation_type = "customized"
  smn_topic      = huaweicloud_smn_topic.hfa_cts_topic_iam.topic_urn

  operations {
    service     = "IAM"
    resource    = "userGroup"
    trace_names = ["createUserGroup","deleteGroup","createGroup","deleteUserGroup"]
  }
}