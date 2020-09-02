variable "aws_profile" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "iam_role_name" {
  type = string
}

variable "iam_instance_profile_name" {
  type = string
}

variable "iam_policy_name" {
  type = string
}

variable "iam_policy" {
  type = string
}