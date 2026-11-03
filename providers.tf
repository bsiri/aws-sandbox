provider "aws" {
  region = "eu-west-3"
  assume_role {
    role_arn = var.aws_ec2_admin_role_arn
  }
  default_tags {
    tags = {
      "Component" = "Infra",
      "Stage"     = "Exercice"
    }
  }
}
