terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.51.0"
    }
  }

  # Need to set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables for 
  # accessing OBS bucket

  # All the backend configuration will be saved in a separated file named obs.tfbackend
  # Change the bucket name and key according to customer environment
  backend "s3" {}
}

data "terraform_remote_state" "hfa_iam" {
  backend = "s3"
  config = {
    bucket                      = var.hfa_terraform_state_bucket
    key                         = var.hfa_iam_state_key
    region                      = var.hfa_terraform_state_region
    endpoint                    = "https://obs.ap-southeast-3.myhuaweicloud.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

data "terraform_remote_state" "hfa_network" {
  backend = "s3"
  config = {
    bucket                      = var.hfa_terraform_state_bucket
    key                         = var.hfa_network_state_key
    region                      = var.hfa_terraform_state_region
    endpoint                    = "https://obs.ap-southeast-3.myhuaweicloud.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

data "terraform_remote_state" "hfa_network_workload" {
  backend = "s3"
  config = {
    bucket                      = var.hfa_terraform_state_bucket
    key                         = var.hfa_network_workload_state_key
    region                      = var.hfa_terraform_state_region
    endpoint                    = "https://obs.ap-southeast-3.myhuaweicloud.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

# Need to set HW_ACCESS_KEY and HW_SECRET_KEY environment variables for default provider
# Default provider which will have access to Central IAM accounts, all ohter provider will be 
# assuming agency to access other accounts 
provider "huaweicloud" {
  region = var.hfa_default_region
}

provider "huaweicloud" {
  region = var.hfa_default_region
  alias  = "app"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_iam_app_admin_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_app_account
  }
}
