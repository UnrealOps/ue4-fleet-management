variable "iam_role_name" {
  description = "Name of the IAM role to attach the policy."
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the IAM policy."
  type        = string
}

variable "iam_policy" {
  description = "Policy document containing the permissions of the IAM policy."
  type        = string
}