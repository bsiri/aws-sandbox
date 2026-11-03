variable "first_variable" {
  type        = string
  description = "first test variable"
  default     = "(default value)"
}

variable "aws_ec2_admin_credentials_profile" {
  type        = string
  description = "name of the profile in aws credentials file"
}

variable "aws_main_availability_zone_name" {
  type        = string
  description = "the main az where things should be deployed"
}