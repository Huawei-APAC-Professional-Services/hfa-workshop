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
  region = var.hfa_main_region
}

provider "huaweicloud" {
  region = var.hfa_main_region
  alias  = "security"

  assume_role {
    agency_name = var.hfa_iam_base_agency_name
    domain_name = var.hfa_security_account_name
  }
}

provider "huaweicloud" {
  region = var.hfa_main_region
  alias  = "transit"

  assume_role {
    agency_name = var.hfa_iam_base_agency_name
    domain_name = var.hfa_transit_account_name
  }
}

provider "huaweicloud" {
  region = var.hfa_main_region
  alias  = "common"

  assume_role {
    agency_name = var.hfa_iam_base_agency_name
    domain_name = var.hfa_common_account_name
  }
}

provider "huaweicloud" {
  region = var.hfa_main_region
  alias  = "app"

  assume_role {
    agency_name = var.hfa_iam_base_agency_name
    domain_name = var.hfa_app_account_name
  }
}



