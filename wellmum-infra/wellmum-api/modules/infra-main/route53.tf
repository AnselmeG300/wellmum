# Data source pour récupérer la zone Route 53 ${var.domain_name_wellmum}
data "aws_route53_zone" "rex-wellmum" {
  name         = var.domain_name_wellmum
  private_zone = false
}

# Les enregistrements Route53 utilisent directement la data source

resource "aws_route53_record" "dev_api" {
  count   = var.environment == "development" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "dev.api.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.api.dns_name
    zone_id                = aws_lb.api.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dev_minio" {
  count   = var.environment == "development" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "dev.minio.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.minio.dns_name
    zone_id                = aws_lb.minio.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dev_mailhog" {
  count   = var.environment == "development" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "dev.mailhog.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.mailhog.dns_name
    zone_id                = aws_lb.mailhog.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "prod_api" {
  count   = var.environment == "production" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "api.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.api.dns_name
    zone_id                = aws_lb.api.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "prod_minio" {
  count   = var.environment == "production" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "minio.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.minio.dns_name
    zone_id                = aws_lb.minio.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "prod_mailhog" {
  count   = var.environment == "production" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "mailhog.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.mailhog.dns_name
    zone_id                = aws_lb.mailhog.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "prod_bastion" {
  count   = var.environment == "production" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "database.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.bastion.dns_name
    zone_id                = aws_lb.bastion.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dev_bastion" {
  count   = var.environment == "production" ? 1 : 0
  zone_id = data.aws_route53_zone.rex-wellmum.zone_id
  name    = "dev.database.${var.domain_name_wellmum}"
  type    = "A"

  alias {
    name                   = aws_lb.bastion.dns_name
    zone_id                = aws_lb.bastion.zone_id
    evaluate_target_health = true
  }
}