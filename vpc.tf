
########################## VPC and subnets ############################

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
  availability_zone = var.aws_az_main
  tags = {
    "Name" = "subnet_exercises"
  }
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



################# Public access exclusion ######################

# Preventing spurious internet access by enabling Block Public Access (BPA)
# Doc here: https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html
#
# Awkwardly, we have to:
# - the BPA set to block bidirectionnally, 
# - then add an exclusion to "allow-egress"
#
# This is different from setting the BPA directly to "egress-only", 
# because that mode would allow only NAT GW to egress, but here we 
# want our VM in the public subnet to also be able to reach the Internet.


resource "aws_vpc_block_public_access_options" "bpa_exercises" {
  internet_gateway_block_mode = "block-bidirectional"
}

resource "aws_vpc_block_public_access_exclusion" "bpa_ex_exercises" {
  subnet_id                       = aws_subnet.subnet_exercises.id
  internet_gateway_exclusion_mode = "allow-egress"
  tags = {
    "Name" = "bpa_ex_exercises"
  }
}