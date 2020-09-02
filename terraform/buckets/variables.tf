variable "aws_profile" {
    type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "terraform_state_bucket_name" {
  type = string
}

variable "dedicated_server_bucket_name" {
  type = string
}