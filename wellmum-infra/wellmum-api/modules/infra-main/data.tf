data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_vpc" "rex-wellmum" {
  tags = {
    Name = "REX WELLMUM VPC infrastructure"
  }
}

data "aws_ecs_cluster" "rex-wellmum" {
  cluster_name = "rex-wellmum"
}

data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["REX WELLMUM VPC infrastructure-public-a"]
  }
}

data "aws_subnet" "public_subnet1" {
  filter {
    name   = "tag:Name"
    values = ["REX WELLMUM VPC infrastructure-public-b"]
  }
}

data "aws_subnet" "private_subnet" {
  tags = {
    Name = "REX WELLMUM VPC infrastructure-private-a"
  }
}

data "aws_subnet" "private_subnet1" {
  filter {
    name   = "tag:Name"
    values = ["REX WELLMUM VPC infrastructure-private-b"]
  }
}

data "aws_iam_role" "rex-wellmum-api-and-ai" {
  name = "rex-wellmum-api-and-ai-ecs-task-role"
}

data "aws_efs_file_system" "rex-wellmum_efs" {
  tags = {
    Name = "rex-wellmum-efs"
  }
}


data "aws_efs_access_points" "rex-wellmum" {
  file_system_id = data.aws_efs_file_system.rex-wellmum_efs.id
}


data "aws_efs_access_point" "all_aps" {
  for_each        = toset(data.aws_efs_access_points.rex-wellmum.ids)
  access_point_id = each.key
}

data "aws_efs_access_point" "minio_efs_access_point" {
  access_point_id = local.minio_access_point_id
}

data "aws_secretsmanager_secret" "minio_credentials" {
  name = "rex-wellmum/minio/auth"
}

data "aws_secretsmanager_secret" "jwt_secret" {
  name = "rex-wellmum/jwt/secrets"
}

data "aws_secretsmanager_secret" "swagger_credentials" {
  name = "rex-wellmum/swagger/auth"
}

data "aws_secretsmanager_secret" "google_oauth" {
  name = "rex-wellmum/google/auth"
}

data "aws_secretsmanager_secret" "otp_secret" {
  name = "rex-wellmum/otp/secrets"
}

data "aws_secretsmanager_secret" "smtp_password" {
  name = "rex-wellmum/smtp/pass"
}

data "aws_secretsmanager_secret" "session_secret" {
  name = "rex-wellmum/session/secrets"
}

data "aws_iam_role" "rds_monitoring_role" {
  name = "rex-wellmum-api-rds-monitoring-role"
}

data "aws_service_discovery_dns_namespace" "wellmum_ai" {
  name = "${local.resource_prefix}-wellmum-ai"
  type = "DNS_PRIVATE"
}

data "aws_service_discovery_service" "chat" {
  name         = "chat"
  namespace_id = data.aws_service_discovery_dns_namespace.wellmum_ai.id
}

data "aws_service_discovery_service" "food_detector" {
  name         = "food_detector"
  namespace_id = data.aws_service_discovery_dns_namespace.wellmum_ai.id
}

data "aws_service_discovery_service" "nutrition" {
  name         = "nutrition"
  namespace_id = data.aws_service_discovery_dns_namespace.wellmum_ai.id
}

data "aws_service_discovery_service" "routines" {
  name         = "routines"
  namespace_id = data.aws_service_discovery_dns_namespace.wellmum_ai.id
}

data "aws_service_discovery_service" "social" {
  name         = "social"
  namespace_id = data.aws_service_discovery_dns_namespace.wellmum_ai.id
}

# ECR Repository
data "aws_ecr_repository" "rex-wellmum-api" {
  name = "rex-wellmum-api"
}

data "aws_secretsmanager_secret" "pgadmin_credentials" {
  name = "rex-wellmum/pgadmin/auth" 
}

data "aws_efs_access_point" "pgadmin_efs_access_point" {
  count           = local.pgadmin_access_point_id != null ? 1 : 0
  access_point_id = local.pgadmin_access_point_id
}

data "aws_acm_certificate" "prod_api_acm" {
  domain      = "api.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "dev_api_acm" {
  domain      = "dev.api.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "prod_minio_acm" {
  domain      = "minio.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "dev_minio_acm" {
  domain      = "dev.minio.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "prod_mailhog_acm" {
  domain      = "mailhog.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "dev_mailhog_acm" {
  domain      = "dev.mailhog.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "prod_bastion_acm" {
  domain      = "database.${var.domain_name_wellmum}"
}

data "aws_acm_certificate" "dev_bastion_acm" {
  domain      = "dev.database.${var.domain_name_wellmum}"
}