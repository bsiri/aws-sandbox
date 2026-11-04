########## EC2 supporting the infrastructure (bastion etc) ###############


data "aws_ami" "ami_ubuntu_resolute" {

  owners      = ["099720109477"] # Canonical
  name_regex  = "ubuntu/images/.*26.04.*"
  most_recent = true


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp3"]
  }
}

