resource "aws_security_group" "allow_unreal_server_udp" {
    name        = "allow_unreal_server_udp"
    description = "Allow 7777/udp."

    ingress {
        description = "Unreal Engine UDP port"
        from_port   = 7777
        to_port     = 7777
        protocol    = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_unreal_server_udp"
    }
}

resource "aws_launch_template" "launch_template" {
    name_prefix = var.launch_template_name_prefix
    image_id = data.aws_ami.dedicated_server_image.id
    instance_type = var.launch_template_instance_type
    vpc_security_group_ids = [aws_security_group.allow_unreal_server_udp.id]
}

resource "aws_autoscaling_group" "autoscaling_group" {
    name = var.asg_name
    availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
    desired_capacity = var.asg_desired_capacity
    health_check_type = "EC2"
    health_check_grace_period = var.asg_health_check_grace_period
    max_size = var.asg_max_size
    min_size = var.asg_min_size
    
    launch_template {
        id      =  aws_launch_template.launch_template.id
        version = "$Latest"
    }

    tag {
        key = "Name"
        value   = "fleet-dedicated-server-${var.region}"
        propagate_at_launch = true
    }

    tag {
        key = "Type"
        value = "fleet-dedicated-server"
        propagate_at_launch = true
    }
}