data "aws_ami" "dedicated_server_image" {
    most_recent      = true
    owners           = ["self"]

    filter {
        name   = "name"
        values = ["unreal-dedicated-server-*"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}