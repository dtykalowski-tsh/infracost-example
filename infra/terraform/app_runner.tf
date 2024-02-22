module "app_runner" {
  source = "../modules/aws_app_runner"

  service_name = "metabase"

  image_repository_source = aws_ecr_repository.metabase.repository_url
  image_repository_tag    = "v0.47.4"
  port                    = 3000

  autoscaling_max_concurrency = 200
  autoscaling_max_size        = 1
  autoscaling_min_size        = 1
  health_check_path           = "/"
  cpu                         = "1 vCPU"
  memory                      = 2048

  vpc_connector_subnets         = module.vpc.database_subnets
  vpc_connector_security_groups = [module.rds_sg.security_group_id]

  rds_db_name  = "metabase"
  rds_username = "metabase"

  depends_on = [
    aws_ecr_repository.metabase
  ]
}
