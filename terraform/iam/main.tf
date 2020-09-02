module "iam_dedicated_server_role" {
  source = "../modules/components/iam-role"

  iam_role_name = var.iam_role_name
}

module "iam_dedicated_server_policy" {
  source = "../modules/components/iam-policy"

  iam_policy_name = var.iam_policy_name
  iam_policy      = var.iam_policy
  iam_role_name   = module.iam_dedicated_server_role.iam_role_name
}

module "iam_dedicated_server_instance_profile" {
  source = "../modules/components/iam-instance-profile"

  iam_instance_profile_name = var.iam_instance_profile_name
  iam_role_name             = module.iam_dedicated_server_role.iam_role_name
}