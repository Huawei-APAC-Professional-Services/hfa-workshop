module "hfa_common_account_baseline" {
  providers = {
    huaweicloud = huaweicloud.common
  }
  source                   = "github.com/Huawei-APAC-Professional-Services/terraform-module/hfa-baseline"
  hfa_cts_regions          = local.cts_regions
  hfa_security_account_id  = data.terraform_remote_state.hfa_iam.outputs.hfa_security_account_id
  hfa_config_bucket_region = huaweicloud_obs_bucket.hfa_config_log.region
  hfa_config_bucket_name   = huaweicloud_obs_bucket.hfa_config_log.id
}