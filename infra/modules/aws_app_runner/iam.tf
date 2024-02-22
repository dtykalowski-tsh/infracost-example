resource "aws_iam_role" "app_runner_instance_role" {
  name                = "${var.service_name}-AppRunnerInstanceRole"
  managed_policy_arns = [aws_iam_policy.app_runner_instance_policy.arn]
  assume_role_policy  = data.aws_iam_policy_document.app_runner_instance_role_assume_policy.json

  depends_on = [
    aws_iam_policy.app_runner_instance_policy
  ]
}

resource "aws_iam_role" "app_runner_access_role" {
  name                = "${var.service_name}-AppRunnerAccessRole"
  managed_policy_arns = [aws_iam_policy.app_runner_access_policy.arn]
  assume_role_policy  = data.aws_iam_policy_document.app_runner_access_role_assume_policy.json

  depends_on = [
    aws_iam_policy.app_runner_access_policy
  ]
}

resource "aws_iam_policy" "app_runner_instance_policy" {
  name   = "${var.service_name}-AppRunnerInstancePolicy"
  policy = data.aws_iam_policy_document.app_runner_instance_policy.json
}

resource "aws_iam_policy" "app_runner_access_policy" {
  name   = "${var.service_name}-AppRunnerAccessPolicy"
  policy = data.aws_iam_policy_document.app_runner_access_policy.json
}
