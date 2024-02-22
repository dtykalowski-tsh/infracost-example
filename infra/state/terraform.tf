terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
  backend "s3" {
    bucket         = "terraform-state"
    key            = "state/terraform-backend/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    kms_key_id     = "alias/terraform_bucket_key"
    dynamodb_table = "terraform-state"
  }
  required_version = ">= 1.5"
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      "managed_by" = "terraform"
      "source"     = ""
      "owner"      = ""
    }
  }
}
