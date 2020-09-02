module "fleet_autoscaling_group" {
  source = "../../components/autoscaling-group"

  asg_name             = "dedicated-server-fleet-${var.region}"
  asg_max_size         = var.asg_max_size
  asg_min_size         = var.asg_min_size
  asg_desired_capacity = var.asg_desired_capacity

  region = var.region

  launch_template_instance_type = var.instance_type
}