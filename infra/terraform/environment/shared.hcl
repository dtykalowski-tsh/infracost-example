bucket         = "infracost-terraform-state"
key            = "state/backend-shared/terraform.tfstate"
dynamodb_table = "infracost-terraform-state"
region         = "eu-west-1"
max_retries    = 3
session_name   = "infracost-shared"
