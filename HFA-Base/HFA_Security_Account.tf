locals {
  non_security_accounts = [
    data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_id,
    data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_id,
  ]
}

module "hfa_security_account_baseline" {
  providers = {
    huaweicloud = huaweicloud.security
  }
  source                           = "github.com/Huawei-APAC-Professional-Services/terraform-module/hfa-baseline"
  hfa_config_member_account_ids    = local.config_member_account_ids
  hfa_config_aggregator_account_id = local.config_aggregator_account_id
  hfa_cts_regions_obs_config       = local.cts_all_regions_obs_config
  hfa_config_bucket_region         = huaweicloud_obs_bucket.hfa_config_log.region
  hfa_config_bucket_name           = huaweicloud_obs_bucket.hfa_config_log.id
  hfa_config_smn_topic             = zipmap([huaweicloud_smn_topic.hfa_config_topic.region], [huaweicloud_smn_topic.hfa_config_topic.topic_urn])
  depends_on                       = [huaweicloud_obs_bucket_acl.hfa_cts_log, huaweicloud_obs_bucket_acl.hfa_config_log]
}