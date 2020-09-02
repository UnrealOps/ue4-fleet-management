resource "aws_iam_policy" "policy" {
  name   = var.iam_policy_name
  policy = var.iam_policy
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = var.iam_role_name
  policy_arn = aws_iam_policy.policy.arn
}