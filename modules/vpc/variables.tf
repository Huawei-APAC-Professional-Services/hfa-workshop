variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "vpc_secondary_cidr" {
  type = string
  default = ""
}

variable "vpc_subnets" {
  type = map(string)
  default = {}
}

variable "vpc_subnets_common_tags" {
  description = "Common tags for the subnet"
  type        = map(string)
  default     = {}
}

variable "vpc_ipv6_enable" {
  type = bool
  default = false
}

variable "vpc_dhcp_enable" {
  type = bool
  default = true
}