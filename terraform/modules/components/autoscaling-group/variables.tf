variable "launch_template_name_prefix" {
    type = string
    default = "fleet-launch-template"
}

variable "launch_template_instance_type" {
    type = string
}

variable "asg_name" {
    type = string
}

variable "asg_min_size" {
    type = number
    default = 1
}

variable "asg_max_size" {
    type = number
    default = 5
}

variable "asg_desired_capacity" {
    type = number
    default = 5
}

variable "asg_health_check_grace_period" {
    type = number
    default = 120
}

variable "region" {
    type = string
}