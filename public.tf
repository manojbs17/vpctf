resource "aws_internet_gateway" "amc-vpc-igw" {
  vpc_id = aws_vpc.amc-vpc.id
  tags   = merge(var.tags, {Name = "amc-vpc-igw"})
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.amc-vpc.id
  tags              = merge(var.tags, {Name = "public_a"})
  cidr_block        = var.subnets.a
  availability_zone = "ap-south-1a"
}

resource "aws_nat_gateway" "nat-gw-2a-public" {
  allocation_id = aws_eip.eip_a.id
  subnet_id     = aws_subnet.public_a.id
  tags      = merge(var.tags, {Name = "nat-gw-2a-public"})
  depends_on = [aws_eip.eip_a]
}

resource "aws_route_table" "rt_public_a" {
  vpc_id = aws_vpc.amc-vpc.id
   tags   = merge(var.tags, {Name = "rt_public_a"})
}
