module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.9.0"

  identifier           = "infracost-rds-postgresql"
  engine               = "postgres"
  engine_version       = "15"
  family               = "postgres15"
  major_engine_version = "15"
  instance_class       = "db.t4g.small"

  allocated_storage     = 20
  max_allocated_storage = 50

  username = "tshdevops"

  multi_az               = false
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.rds_security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true
  ca_cert_identifier              = "rds-ca-rsa2048-g1"

  backup_retention_period = 7
  skip_final_snapshot     = false
  deletion_protection     = true

  performance_insights_enabled          = false
  performance_insights_retention_period = 0
  create_monitoring_role                = false

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]
}

module "rds_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name        = "infracost-rds-postgresql"
  description = "PostgreSQL RDS Access"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = "-1"
      description = "PostgreSQL Access From Within VPC"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = "-1"
      description = "PostgreSQL Access To VPC"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name        = "infracost-rds-postgresql"
  description = "PostgreSQL RDS Access"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = "-1"
      description = "PostgreSQL Access From Within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = -1
      to_port     = -1
      protocol    = "-1"
      description = "PostgreSQL Access To VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
}

resource "aws_db_instance_role_association" "rds_role" {
  db_instance_identifier = module.rds.db_instance_id
  feature_name           = "Lambda"
  role_arn               = aws_iam_role.rds.arn
}
