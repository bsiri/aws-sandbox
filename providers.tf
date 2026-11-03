provider "aws" {
  region  = "eu-west-3"
  profile = var.aws_ec2_admin_credentials_profile
  default_tags {
    tags = {
      "Component" = "Infra",
      "Stage"     = "Exercice"
    }
  }
}
