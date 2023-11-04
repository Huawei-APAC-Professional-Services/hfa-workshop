resource "random_uuid" "bucket_suffix" {}

resource "huaweicloud_obs_bucket" "hfa_cts_log" {
  for_each   = var.hfa_allowed_regions
  provider   = huaweicloud.security
  bucket     = "${var.hfa_cts_bucket_prefix}-${each.value}-${random_uuid.bucket_suffix.result}"
  region     = each.value
  versioning = true
}

resource "huaweicloud_obs_bucket" "hfa_config_log" {
  provider   = huaweicloud.security
  bucket     = "${var.hfa_config_bucket_prefix}-${random_uuid.bucket_suffix.result}"
  region     = var.hfa_config_log_region != null ? var.hfa_config_log_region : data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
  versioning = true
}

locals {
  cts_regions = { for v in huaweicloud_obs_bucket.hfa_cts_log : v.region => v.id }
}

resource "huaweicloud_obs_bucket_acl" "hfa_cts_log" {
  for_each   = local.cts_regions
  region     = each.key
  provider   = huaweicloud.security
  depends_on = [huaweicloud_obs_bucket.hfa_cts_log]
  bucket     = each.value

  dynamic "account_permission" {
    for_each = [
      data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_id,
      data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_id,
      data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_id,
      data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_id
    ]
    content {
      access_to_bucket = ["READ", "WRITE"]
      access_to_acl    = ["READ_ACP", "WRITE_ACP"]
      account_id       = account_permission.value
    }
  }
}

resource "huaweicloud_obs_bucket_acl" "hfa_config_log" {
  region   = huaweicloud_obs_bucket.hfa_config_log.region
  provider = huaweicloud.security
  bucket   = huaweicloud_obs_bucket.hfa_config_log.id

  dynamic "account_permission" {
    for_each = [
      data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_id,
      data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_id,
      data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_id,
      data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_id
    ]
    content {
      access_to_bucket = ["READ", "WRITE"]
      access_to_acl    = ["READ_ACP", "WRITE_ACP"]
      account_id       = account_permission.value
    }
  }
}


#resource "huaweicloud_obs_bucket_policy" "hfa_config_bucket_policy" {
#  provider = huaweicloud.security
#  bucket = huaweicloud_obs_bucket.hfa_config_log.id
#  region = huaweicloud_obs_bucket.hfa_config_log.region
#  policy = jsonencode({
#    Statement = [
#      {
#        Sid = "Allow config to dump the data"
#        Effect = "Allow"
#        Principal = {
#          ID = [
#            "${data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_name}/${data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_id}:agency/rms_tracker_agency",
#            "${data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_name}/${data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_id}:agency/rms_tracker_agency",
#            "${data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_name}/${data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_id}:agency/rms_tracker_agency",
#            "${data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_name}/${data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_id}:agency/rms_tracker_agency"
#          ]
#        }
#        Action = [
#          "PutObject"
#        ]
#        Resource = [
#          "${huaweicloud_obs_bucket.hfa_config_log.id}/RMSLogs/*/Snapshot/*",
#          "${huaweicloud_obs_bucket.hfa_config_log.id}/RMSLogs/*/Notification/*"
#        ]
#      }
#    ]
#  })
#}