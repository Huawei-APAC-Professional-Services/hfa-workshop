locals {
  hfa_accounts = [
    data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_id,
    data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_id,
    data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_id,
    data.terraform_remote_state.hfa_iam.outputs.hfa_security_account_id,
    data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_id
  ]
  config_aggregator_account_id = data.terraform_remote_state.hfa_iam.outputs.hfa_security_account_id
  config_member_account_ids    = [for account in local.hfa_accounts : account if account != local.config_aggregator_account_id]
}
