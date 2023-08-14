resource "huaweicloud_vpc" "this" {
  name = var.vpc_name
  cidr = var.vpc_cidr
  secondary_cidr = var.vpc_secondary_cidr == "" ? null : var.vpc_secondary_cidr

  tags = merge(
    {"Name":var.vpc_name},
    var.vpc_tags
  )
}

resource "huaweicloud_vpc_subnet" "this" {
  for_each = var.vpc_subnets
  name       = each.key
  cidr       = each.value
  gateway_ip = cidrhost(each.value,1)
  vpc_id     = huaweicloud_vpc.this.id
  ipv6_enable = var.vpc_ipv6_enable
  dhcp_enable = var.vpc_dhcp_enable

  tags = merge(
    {"Name": each.key},
    var.vpc_subnets_common_tags
  )
}