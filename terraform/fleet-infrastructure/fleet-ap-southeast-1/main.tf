module "fleet_ap_southeast_1" {
    source = "../../modules/services/fleet"

    region = var.region
    asg_desired_capacity = var.fleet_capacity
    asg_max_size = var.fleet_max_size
    asg_min_size = var.fleet_min_size
    instance_type = var.instance_type
}