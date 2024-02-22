resource "aws_ssm_parameter" "rds_hostname" {
  name  = "${var.service_name}-rds-hostname"
  type  = "String"
  value = var.rds_hostname
}

resource "aws_ssm_parameter" "rds_port" {
  name  = "${var.service_name}-rds-port"
  type  = "String"
  value = var.rds_port
}

resource "aws_ssm_parameter" "rds_username" {
  name  = "${var.service_name}-rds-username"
  type  = "String"
  value = var.rds_username
}

resource "aws_ssm_parameter" "rds_db_name" {
  name  = "${var.service_name}-rds-db-name"
  type  = "String"
  value = var.rds_db_name
}

resource "aws_ssm_parameter" "rds_db_type" {
  name  = "${var.service_name}-rds-db-type"
  type  = "String"
  value = var.rds_db_type
}
