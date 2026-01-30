resource "aws_ecs_task_definition" "mailhog" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  container_definitions    = templatefile("${path.module}/containers-definitions/mailhog.json", {
    AWS_REGION = data.aws_region.current.region
  })

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}"
    Environment = var.environment
    Service     = "mailhog"
  }
}

resource "aws_ecs_task_definition" "minio" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  container_definitions    = templatefile("${path.module}/containers-definitions/minio.json", {
    MINIO_SECRET_ARN         = data.aws_secretsmanager_secret.minio_credentials.arn,
    MINIO_DATA_VOLUME_NAME   = var.minio_data_volume_name,
    AWS_REGION               = data.aws_region.current.region
  })


  volume {
    name = var.minio_data_volume_name

    efs_volume_configuration {
      file_system_id          = data.aws_efs_file_system.rex-wellmum_efs.id
      root_directory          = "/"
      transit_encryption      = "ENABLED"
      transit_encryption_port = 2049
      authorization_config {
        access_point_id = data.aws_efs_access_point.minio_efs_access_point.id
        iam             = "DISABLED"
      }
    }
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}"
    Environment = var.environment
    Service     = "minio"
  }
}

resource "aws_ecs_task_definition" "api" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  
  container_definitions = templatefile("${path.module}/containers-definitions/api.json", {
    IMAGE                      = "${data.aws_ecr_repository.rex-wellmum-api.repository_url}:${local.image_tag_api}"
    AWS_REGION                 = data.aws_region.current.region
    PROJECT_NAME               = var.project_name
    ENVIRONMENT                = var.environment
    APP_BASE_URL               = "https://${local.current_api_certificate.domain}"
    DATABASE_URL               = "postgresql://${var.db_username}:${var.db_password}@${aws_rds_cluster.aurora_postgres.endpoint}:5432/${var.db_name}?schema=public"
    JWT_SECRET_ARN             = data.aws_secretsmanager_secret.jwt_secret.arn
    SWAGGER_USER_ARN           = "${data.aws_secretsmanager_secret.swagger_credentials.arn}:username::"
    SWAGGER_PASSWORD_ARN       = "${data.aws_secretsmanager_secret.swagger_credentials.arn}:password::"
    GOOGLE_CLIENT_ID_ARN       = "${data.aws_secretsmanager_secret.google_oauth.arn}:client_id::"
    GOOGLE_CLIENT_SECRET_ARN   = "${data.aws_secretsmanager_secret.google_oauth.arn}:client_secret::"
    OTP_SECRET_ARN             = data.aws_secretsmanager_secret.otp_secret.arn
    SMTP_PASSWORD_ARN          = data.aws_secretsmanager_secret.smtp_password.arn
    SESSION_SECRET_ARN         = data.aws_secretsmanager_secret.session_secret.arn
    MINIO_SECRET_ARN           = data.aws_secretsmanager_secret.minio_credentials.arn
    JWT_ACCESS_EXPIRATION      = var.jwt_access_expiration
    JWT_REFRESH_EXPIRATION     = var.jwt_refresh_expiration
    GOOGLE_CALLBACK_URL        = var.google_callback_url
    OTP_EXPIRATION             = tostring(var.otp_expiration)
    OTP_STEP                   = tostring(var.otp_step)
    OTP_DIGITS                 = tostring(var.otp_digits)
    SMTP_USER                  = var.smtp_user
    FRONTEND_URL               = "https://${var.domain_name_wellmum}"
    ALLOWED_ORIGINS            = "https://${local.current_api_certificate.domain},http://localhost:3000"
    AWS_S3_BUCKET_NAME         = var.aws_s3_bucket_name
    MINIO_ENDPOINT             = "${aws_service_discovery_service.minio.name}.${aws_service_discovery_private_dns_namespace.rex-wellmum.name}"
    AI_CHAT_URL                = "http://${data.aws_service_discovery_service.chat.name}.${data.aws_service_discovery_dns_namespace.wellmum_ai.name}:8002"
    AI_FOOD_DETECTOR_URL       = "http://${data.aws_service_discovery_service.food_detector.name}.${data.aws_service_discovery_dns_namespace.wellmum_ai.name}:8004"
    AI_NUTRITION_URL           = "http://${data.aws_service_discovery_service.nutrition.name}.${data.aws_service_discovery_dns_namespace.wellmum_ai.name}:8001"
    AI_ROUTINES_URL            = "http://${data.aws_service_discovery_service.routines.name}.${data.aws_service_discovery_dns_namespace.wellmum_ai.name}:8000"
    AI_SOCIAL_URL              = "http://${data.aws_service_discovery_service.social.name}.${data.aws_service_discovery_dns_namespace.wellmum_ai.name}:8003"
  })
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}"
    Environment = var.environment
    Service     = "api"
  }
}

resource "aws_ecs_task_definition" "bastion" {
  family                   = "bastion"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn

  container_definitions = templatefile("${path.module}/containers-definitions/pgadmin.json", {
    PG_ADMIN_SECRET_ARN = data.aws_secretsmanager_secret.pgadmin_credentials.arn,
    AWS_REGION          = data.aws_region.current.region,
    PROJECT_NAME        = var.project_name,
    ENVIRONMENT         = var.environment
  })

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}"
    Environment = var.environment
    Service     = "bastion"
  }
}