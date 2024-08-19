resource "aws_vpc" "amc-vpc" {
  tags       = merge(var.tags, {Name = "amc-vpc"})
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}


