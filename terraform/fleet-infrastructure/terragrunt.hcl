remote_state {
    backend = "s3"
    config = {
        bucket = "unrealops-terraform-state-bucket"
        profile = "unreal_devops"
        key = "${path_relative_to_include()}/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
    }
}