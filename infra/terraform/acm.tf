resource "aws_acm_certificate" "api_dev" {
  provider = aws.virginia

  domain_name       = ""
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "api_stage" {
  provider = aws.virginia

  domain_name       = ""
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "api_prod" {
  provider = aws.virginia

  domain_name       = ""
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "cf_dev" {
  provider = aws.virginia

  domain_name       = ""
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "cf_stage" {
  provider = aws.virginia

  domain_name       = ""
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "cf_prod" {
  provider = aws.virginia

  domain_name       = ""
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
