variable "auto_deployments_enabled" {
  type    = bool
  default = true
}

variable "autoscaling_max_concurrency" {
  type    = number
  default = 10
}

variable "autoscaling_max_size" {
  type    = number
  default = 10
}

variable "autoscaling_min_size" {
  type    = number
  default = 2
}

variable "image_repository_source" {
  type    = string
  default = "public.ecr.aws/aws-containers/hello-app-runner"
}

variable "image_repository_tag" {
  type    = string
  default = "latest"
}

variable "image_repository_type" {
  type    = string
  default = "ECR"
}

variable "port" {
  type    = number
  default = 3000
}

variable "health_check_healthy_treshold" {
  type    = number
  default = 1
}

variable "health_check_interval" {
  type    = number
  default = 15
}

variable "health_check_timeout" {
  type    = number
  default = 10
}

variable "health_check_unhealthy_treshold" {
  type    = number
  default = 3
}

variable "health_check_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_path" {
  type    = string
  default = "/health"
}

variable "service_name" {
  type = string
}

variable "cpu" {
  type        = string
  description = "How many vCPUs to assign for AppRunner"
  default     = "1 vCPU"
}

variable "memory" {
  type        = number
  description = "How much memory to assign for AppRunner"
  default     = 2048
}


variable "vpc_connector_subnets" {
  type    = list(string)
  default = []
}

variable "vpc_connector_security_groups" {
  type    = list(string)
  default = []
}

variable "rds_hostname" {
  type    = string
  default = "infracost-rds-postgresql.ck6wwocmd6od.eu-west-1.rds.amazonaws.com"
}

variable "rds_port" {
  type    = string
  default = "5432"
}

variable "rds_username" {
  type = string
}

variable "rds_db_name" {
  type = string
}

variable "rds_db_type" {
  type    = string
  default = "postgres"
}
