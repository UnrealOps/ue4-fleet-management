resource "aws_kms_key" "s3_bucket_encryption_key" {}

module "s3_bucket_terraform_state" {
  source = "../modules/components/s3-bucket"

  bucket_name = var.terraform_state_bucket_name
  kms_key_arn = "${aws_kms_key.s3_bucket_encryption_key.arn}"
}

module "s3_bucket_dedicated_server" {
  source = "../modules/components/s3-bucket"

  bucket_name = var.dedicated_server_bucket_name
  kms_key_arn = "${aws_kms_key.s3_bucket_encryption_key.arn}"
}