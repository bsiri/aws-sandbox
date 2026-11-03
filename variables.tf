variable "first_variable" {
  type        = string
  description = "first test variable"
  default     = "(default value)"
}

variable "aws_ec2_admin_role_arn" {
  type        = string
  description = "name ARN of the ec2 admin role"
}

variable "aws_main_availability_zone_name" {
  type        = string
  description = "the main az where things should be deployed"
}