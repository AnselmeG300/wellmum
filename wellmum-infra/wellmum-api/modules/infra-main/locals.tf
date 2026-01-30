locals {
  # ACM Certificates ARNs for SSL/TLS
  certificates = {
    # Development certificates
    dev_api = {
      arn    = data.aws_acm_certificate.dev_api_acm.arn
      domain = "dev.api.${var.domain_name_wellmum}"
    }
    dev_minio = {
      arn    = data.aws_acm_certificate.dev_minio_acm.arn
      domain = "dev.minio.${var.domain_name_wellmum}"
    }
    dev_bastion = {
      arn    = data.aws_acm_certificate.dev_bastion_acm.arn
      domain = "dev.database.${var.domain_name_wellmum}"
    }
    dev_mailhog = {
      arn    = data.aws_acm_certificate.dev_mailhog_acm.arn
      domain = "dev.malhog.${var.domain_name_wellmum}"
    }
    
    # Production certificates
    prod_minio = {
      arn    = data.aws_acm_certificate.prod_minio_acm.arn
      domain = "minio.${var.domain_name_wellmum}"
    }
    prod_api = {
      arn    = data.aws_acm_certificate.prod_api_acm.arn
      domain = "api.${var.domain_name_wellmum}"
    }
    prod_bastion = {
      arn    = data.aws_acm_certificate.prod_bastion_acm.arn
      domain = "database.${var.domain_name_wellmum}"
    }
    prod_mailhog = {
      arn    = data.aws_acm_certificate.prod_mailhog_acm.arn
      domain = "malhog.${var.domain_name_wellmum}"
    }

  }

  # Select certificate based on environment
  current_api_certificate      = var.environment == "production" ? local.certificates.prod_api : local.certificates.dev_api
  current_minio_certificate    = var.environment == "production" ? local.certificates.prod_minio : local.certificates.dev_minio
  current_database_certificate = var.environment == "production" ? local.certificates.prod_bastion : local.certificates.dev_bastion
  current_mailhog_certificate  = var.environment == "production" ? local.certificates.prod_mailhog : local.certificates.dev_mailhog
}

locals {
  # Préfixe pour les ressources basé sur l'environnement
  resource_prefix = var.environment == "development" ? "dev" : "prod"
  image_tag_api = var.environment == "development" ? "develop" : "main"
}

locals {
  minio_access_point_id = try(one([
    for id, ap in data.aws_efs_access_point.all_aps : id
    if lower(lookup(ap.tags, "Service", "")) == "minio"
  ]), null)
}

locals {
  pgadmin_access_point_id = try(one([
    for id, ap in data.aws_efs_access_point.all_aps : id
    if lower(lookup(ap.tags, "Service", "")) == "pgadmin"
  ]), null)
}



