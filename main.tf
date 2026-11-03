resource "aws_vpc" "vpc_exercises" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true # required for access to AWS DNS server
  enable_dns_hostnames = true # also required for registering automatically EC2 hostnames
  tags = {
    "Name" = "vpc_exercises"
  }
}

resource "aws_subnet" "subnet_exercises" {
  vpc_id            = aws_vpc.vpc_exercises.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-3a"
  tags = {
    "Name" = "subnet_exercises"
  }
}

resource "aws_vpc_block_public_access_options" "vpc_no_public_access" {
  internet_gateway_block_mode = "block-ingress"
}


resource "aws_internet_gateway" "igw_exercises" {
  vpc_id = aws_vpc.vpc_exercises.id
  tags = {
    "Name" = "igw_exercises"
  }
}


resource "aws_route_table" "rt_exercises" {
  vpc_id = aws_vpc.vpc_exercises.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_exercises.id
  }

  tags = {
    "Name" = "rt_exercises"
  }
}

resource "aws_route_table_association" "rt_subnet_asso_exercises" {
  subnet_id      = aws_subnet.subnet_exercises.id
  route_table_id = aws_route_table.rt_exercises.id
}