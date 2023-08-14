locals {
  hfa_common_prod_er_cidr  = cidrsubnet(var.hfa_common_prod_cidr, 8, 0)
  hfa_common_prod_api_cidr = cidrsubnet(var.hfa_common_prod_cidr, 8, 1)
}
// ingress VPC in transit account
resource "huaweicloud_vpc" "hfa_common_prod" {
  provider = huaweicloud.common
  name     = "hfa_common_prod"
  cidr     = var.hfa_common_prod_cidr

  tags = { "Name" : "hfa_common_prod" }
}

resource "huaweicloud_er_propagation" "hfa_er_to_common" {
  provider       = huaweicloud.transit
  instance_id    = huaweicloud_er_instance.hfa_transit_prod.id
  route_table_id = huaweicloud_er_route_table.hfa_transit_prod.id
  attachment_id  = huaweicloud_er_vpc_attachment.hfa_common_prod.id
}

//public subnet in ingress vpc for public resources
resource "huaweicloud_vpc_subnet" "hfa_common_prod_api" {
  provider   = huaweicloud.common
  name       = "hfa_common_prod_api"
  cidr       = local.hfa_common_prod_api_cidr
  gateway_ip = cidrhost(local.hfa_common_prod_api_cidr, 1)
  vpc_id     = huaweicloud_vpc.hfa_common_prod.id

  tags = { "Name" : "hfa_common_prod_api" }
}

resource "huaweicloud_vpc_subnet" "hfa_common_prod_er" {
  provider   = huaweicloud.common
  name       = "hfa_common_prod_er"
  cidr       = local.hfa_common_prod_er_cidr
  gateway_ip = cidrhost(local.hfa_common_prod_er_cidr, 1)
  vpc_id     = huaweicloud_vpc.hfa_common_prod.id

  tags = { "Name" : "hfa_common_prod_er" }
}

resource "huaweicloud_er_vpc_attachment" "hfa_common_prod" {
  provider    = huaweicloud.common
  instance_id = huaweicloud_er_instance.hfa_transit_prod.id
  vpc_id      = huaweicloud_vpc.hfa_common_prod.id
  subnet_id   = huaweicloud_vpc_subnet.hfa_common_prod_er.id

  name                   = "hfa_common_prod"
  description            = "VPC attachment created by terraform"
  auto_create_vpc_routes = false
}

resource "huaweicloud_er_association" "hfa_common_prod" {
  provider       = huaweicloud.transit
  instance_id    = huaweicloud_er_instance.hfa_transit_prod.id
  route_table_id = huaweicloud_er_route_table.hfa_transit_prod.id
  attachment_id  = huaweicloud_er_vpc_attachment.hfa_common_prod.id
}


output "hfa_common_prod_subnet_id" {
  value = huaweicloud_vpc_subnet.hfa_common_prod_api.id
}