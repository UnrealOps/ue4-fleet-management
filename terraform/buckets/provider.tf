provider "aws" {
  profile = var.aws_profile
  region  = var.region
  version = "~> 2.68"
}