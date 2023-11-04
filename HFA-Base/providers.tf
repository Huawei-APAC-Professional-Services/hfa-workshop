terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.57.0"
    }
  }
  backend "s3" {}
}

# Need to set HW_ACCESS_KEY and HW_SECRET_KEY environment variables for default provider
provider "huaweicloud" {
  region = data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
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
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "huaweicloud" {
  region = data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
  alias  = "iam"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_base_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_iam_account_name
  }
}

provider "huaweicloud" {
  region = data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
  alias  = "security"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_base_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_security_account_name
  }
}

provider "huaweicloud" {
  region = data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
  alias  = "app"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_base_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_app_account_name
  }
}

provider "huaweicloud" {
  region = data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
  alias  = "transit"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_base_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_transit_account_name
  }
}

provider "huaweicloud" {
  region = data.terraform_remote_state.hfa_iam.outputs.hfa_main_region
  alias  = "common"

  assume_role {
    agency_name = data.terraform_remote_state.hfa_iam.outputs.hfa_base_agency_name
    domain_name = data.terraform_remote_state.hfa_iam.outputs.hfa_common_account_name
  }
}

