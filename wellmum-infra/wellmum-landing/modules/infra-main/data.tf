data "aws_iam_role" "wellmum-landing_role" {
  name = "rex-wellmum-landing-amplify-service-role"
}

data "aws_route53_zone" "wellmum" {
  name         = "prod-wordpress.com"
  private_zone = false
}

data "aws_region" "current" {}