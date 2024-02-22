resource "aws_iam_role" "rds" {
  name               = "rds"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.rds_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "rds_policy" {
  role       = aws_iam_role.rds.name
  policy_arn = aws_iam_policy.rds_permissions_policy.arn
}

resource "aws_iam_policy" "rds_permissions_policy" {
  name        = "rds-iam-policy"
  description = "RDS IAM Role Policy"
  policy      = data.aws_iam_policy_document.rds_permissions_policy.json
}

