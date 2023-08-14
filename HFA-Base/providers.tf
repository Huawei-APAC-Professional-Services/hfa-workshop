terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.51.0"
    }
  }
  backend "s3" {}
}

# Need to set HW_ACCESS_KEY and HW_SECRET_KEY environment variables for default provider
provider "huaweicloud" {
  region = var.hfa_default_region
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

provider "huaweicloud" {
  region = var.hfa_default_region
  alias  = "security"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_base_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_security_account
  }
}

