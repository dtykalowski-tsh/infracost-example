data "aws_iam_policy_document" "app_runner_instance_role_assume_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["tasks.apprunner.amazonaws.com"]
    }
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "app_runner_access_role_assume_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["build.apprunner.amazonaws.com"]
    }
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "app_runner_instance_policy" {
  statement {
    sid    = "AppConfigPolicy"
    effect = "Allow"
    actions = [
      "appconfig:GetLatestConfiguration",
      "appconfig:StartConfigurationSession"
    ]

    resources = ["*"]
  }
  statement {
    sid    = "SecretManagerPolicy"
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue",
    ]

    resources = ["*"]
  }
  statement {
    sid    = "SSMPolicy"
    effect = "Allow"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]

    resources = ["*"]
  }
}

data "aws_iam_policy_document" "app_runner_access_policy" {
  statement {
    sid    = "ReadPrivateECR"
    effect = "Allow"
    actions = [
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:GetDownloadUrlForLayer",
    ]

    resources = ["*"]
  }
  statement {
    sid    = "AuthPrivateECR"
    effect = "Allow"
    actions = [
      "ecr:DescribeImages",
      "ecr:GetAuthorizationToken",
    ]

    resources = ["*"]
  }
}
