data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "rds_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

data "aws_iam_policy_document" "rds_permissions_policy" {
  statement {
    actions = ["lambda:InvokeFunction"]

    resources = ["arn:aws:lambda:*:${data.aws_caller_identity.current.account_id}:function:*"]
  }
}
