resource "aws_apprunner_service" "this" {
  service_name = var.service_name

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.app_runner_access_role.arn
    }

    image_repository {
      image_configuration {
        port = var.port
        runtime_environment_secrets = {
          MB_DB_TYPE   = aws_ssm_parameter.rds_db_type.arn
          MB_DB_HOST   = aws_ssm_parameter.rds_hostname.arn
          MB_DB_PASS   = aws_secretsmanager_secret.rds_password.arn
          MB_DB_PORT   = aws_ssm_parameter.rds_port.arn
          MB_DB_USER   = aws_ssm_parameter.rds_username.arn
          MB_DB_DBNAME = aws_ssm_parameter.rds_db_name.arn
        }
      }
      image_identifier      = "${var.image_repository_source}:${var.image_repository_tag}"
      image_repository_type = var.image_repository_type
    }
    auto_deployments_enabled = var.auto_deployments_enabled
  }

  network_configuration {
    ingress_configuration {
      is_publicly_accessible = true
    }

    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = aws_apprunner_vpc_connector.connector.arn
    }
  }

  health_check_configuration {
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    unhealthy_threshold = var.health_check_unhealthy_treshold
    healthy_threshold   = var.health_check_healthy_treshold
    protocol            = var.health_check_protocol
    path                = var.health_check_path
  }

  instance_configuration {
    instance_role_arn = aws_iam_role.app_runner_instance_role.arn
    cpu               = var.cpu
    memory            = var.memory
  }

  depends_on = [
    aws_iam_role.app_runner_instance_role,
    aws_iam_role.app_runner_access_role
  ]

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.this.arn
}

resource "aws_apprunner_auto_scaling_configuration_version" "this" {
  auto_scaling_configuration_name = var.service_name

  max_concurrency = var.autoscaling_max_concurrency
  max_size        = var.autoscaling_max_size
  min_size        = var.autoscaling_min_size
}

resource "aws_apprunner_vpc_connector" "connector" {
  vpc_connector_name = "${var.service_name}-vpc-connector"
  subnets            = var.vpc_connector_subnets
  security_groups    = var.vpc_connector_security_groups
}
