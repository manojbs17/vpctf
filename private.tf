resource "aws_route_table" "rt_private_a" {
  vpc_id = aws_vpc.amc-vpc.id
  tags   = merge(var.tags, {Name = "rt_private_a"})
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.amc-vpc.id
  tags                    = merge(var.tags, {Name = "private_a"})
  map_public_ip_on_launch = false
  cidr_block              = var.private_subnets.a
  availability_zone       = "ap-south-1a"
}

