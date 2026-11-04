
variable "aws_region" {
  type        = string
  description = "the region"
}

variable "aws_az_main" {
  type        = string
  description = "the main az where things should be deployed"
}

variable "aws_ec2_admin_credentials_profile" {
  type        = string
  description = "name of the profile in aws credentials file"
}
