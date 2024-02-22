terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      "managed_by" = "terraform"
      "source"     = "https://bitbucket.org/thesoftwarehouse/infracost-backend-serverless/src/master/"
      "owner"      = "The Software House"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"

  default_tags {
    tags = {
      "managed_by" = "terraform"
      "source"     = "https://bitbucket.org/thesoftwarehouse/infracost-backend-serverless/src/master/"
      "owner"      = "The Software House"
    }
  }
}
