module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  name                   = "infracost.aws.tsh.io"
  cidr                   = "172.100.0.0/16"
  enable_dns_hostnames   = true
  enable_dns_support     = true
  single_nat_gateway     = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = false

  vpc_tags = {
    Description = "infracost VPC"
  }

  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  public_subnet_names = [
    "public-1a.infracost.aws.tsh.io",
    "public-1b.infracost.aws.tsh.io",
    "public-1c.infracost.aws.tsh.io"
  ]
  public_subnets = [
    "172.100.0.0/22",
    "172.100.4.0/22",
    "172.100.8.0/22"
  ]
  private_subnet_names = [
    "private-1a.infracost.aws.tsh.io",
    "private-1b.infracost.aws.tsh.io",
    "private-1c.infracost.aws.tsh.io"
  ]
  private_subnets = [
    "172.100.32.0/19",
    "172.100.64.0/19",
    "172.100.96.0/19",
  ]
  database_subnet_names = [
    "database-1a.infracost.aws.tsh.io",
    "database-1b.infracost.aws.tsh.io",
    "database-1c.infracost.aws.tsh.io"
  ]
  database_subnets = [
    "172.100.160.0/24",
    "172.100.161.0/24",
    "172.100.162.0/24",
  ]
}
