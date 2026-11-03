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