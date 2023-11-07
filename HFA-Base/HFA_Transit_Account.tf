module "hfa_transit_account_baseline" {
  providers = {
    huaweicloud = huaweicloud.transit
  }
  source                   = "github.com/Huawei-APAC-Professional-Services/terraform-module/hfa-baseline"
  hfa_cts_regions          = local.cts_regions
  hfa_config_bucket_region = huaweicloud_obs_bucket.hfa_config_log.region
  hfa_config_bucket_name   = huaweicloud_obs_bucket.hfa_config_log.id
  depends_on               = [huaweicloud_obs_bucket_acl.hfa_cts_log, huaweicloud_obs_bucket_acl.hfa_config_log]
  hfa_config_smn_topic     = zipmap([huaweicloud_smn_topic.hfa_config_topic.region], [huaweicloud_smn_topic.hfa_config_topic.topic_urn])
}