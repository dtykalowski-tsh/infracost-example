resource "aws_secretsmanager_secret" "rds_password" {
  name = "${var.service_name}-rds-password"
}
