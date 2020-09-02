resource "aws_s3_bucket" "s3_bucket" {
    acl = "private"
    bucket = var.bucket_name
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = var.kms_key_arn
                sse_algorithm     = "aws:kms"
            }
        }
    }
    
    tags = {
        Environment = "Production"
        CreatedBy = "UnrealOps"
    }
    versioning {
        enabled = true
    }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
    bucket = aws_s3_bucket.s3_bucket.id

    block_public_acls   = true
    block_public_policy = true
    ignore_public_acls  = true
    restrict_public_buckets = true
}