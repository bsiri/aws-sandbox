variable "first_variable" {
  type        = string
  description = "first test variable"
  default     = "(default value)"
}

variable "aws_ec2_admin_role_profile"{
  type = string
  description = "name of the profile for the ec2 admin"
}
