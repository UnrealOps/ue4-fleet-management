variable "region" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "c5.large"
}

variable "asg_max_size" {
  type    = number
  default = 5
}

variable "asg_min_size" {
  type    = number
  default = 1
}

variable "asg_desired_capacity" {
  type    = number
  default = 3
}