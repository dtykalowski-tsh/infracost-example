resource "aws_route53_zone" "api_dev" {
  name = "dev.statz.co"
}

resource "aws_route53_zone" "api_stage" {
  name = "stage.statz.co"
}

resource "aws_route53_zone" "api_prod" {
  name = "prod.statz.co"
}

resource "aws_route53_zone" "cf_dev" {
  name = "dev.gamecity.co"
}

resource "aws_route53_zone" "cf_stage" {
  name = "stage.gamecity.co"
}

resource "aws_route53_zone" "cf_prod" {
  name = "prod.gamecity.co"
}

resource "aws_route53_record" "api_dev_acm" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.api_dev.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.api_dev.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.api_dev.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.api_dev.zone_id
  ttl             = 300
}

resource "aws_route53_record" "api_stage_acm" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.api_stage.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.api_stage.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.api_stage.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.api_stage.zone_id
  ttl             = 300
}

resource "aws_route53_record" "api_prod_acm" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.api_prod.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.api_prod.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.api_prod.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.api_prod.zone_id
  ttl             = 300
}

resource "aws_route53_record" "cf_dev_acm" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.cf_dev.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.cf_dev.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.cf_dev.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.cf_dev.zone_id
  ttl             = 300
}

resource "aws_route53_record" "cf_stage_acm" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.cf_stage.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.cf_stage.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.cf_stage.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.cf_stage.zone_id
  ttl             = 300
}

resource "aws_route53_record" "cf_prod_acm" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.cf_prod.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.cf_prod.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.cf_prod.domain_validation_options)[0].resource_record_type
  zone_id         = aws_route53_zone.cf_prod.zone_id
  ttl             = 300
}

resource "aws_route53_record" "dev_gamecity_co" {
  name = "dev.gamecity.co"
  type = "A"
  alias {
    name                   = "d2eqyh8caxtfwl.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2" # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-recordset-aliastarget.html
    evaluate_target_health = false
  }
  zone_id = aws_route53_zone.cf_dev.zone_id
}

resource "aws_route53_record" "stage_gamecity_co" {
  name = "stage.gamecity.co"
  type = "A"
  alias {
    name                   = "dqh7rcnpme45.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2" # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-recordset-aliastarget.html
    evaluate_target_health = false
  }
  zone_id = aws_route53_zone.cf_stage.zone_id
}

resource "aws_route53_record" "prod_gamecity_co" {
  name = "prod.gamecity.co"
  type = "A"
  alias {
    name                   = "d2mw1kfan6rw28.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2" # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-route53-recordset-aliastarget.html
    evaluate_target_health = false
  }
  zone_id = aws_route53_zone.cf_prod.zone_id
}
