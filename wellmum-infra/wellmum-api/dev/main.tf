module "rex_wellmum_api" {
  source = "../modules/infra-main"

  # Environment configuration
  environment = "development"

  # Project configuration
  project_name = "rex-wellmum-api"


  # Service configuration
  services_apps = {
    mailhog       = "mailhog"
    minio         = "minio"
    createbuckets = "createbuckets"
    api           = "api"
  }

  # Service scaling
  mailhog_service_scale_desired_count = 1
  minio_service_scale_desired_count   = 1
  api_service_scale_desired_count     = 1

  # API Autoscaling
  api_autoscaling_min_capacity = 1
  api_autoscaling_max_capacity = 3
  api_cpu_target_value         = 70
  api_memory_target_value      = 75
  api_scale_in_cooldown        = 300
  api_scale_out_cooldown       = 60

  # Database configuration (Aurora Serverless v2)
  db_name                   = "rex_wellmum_api_dev"
  db_username               = var.db_username
  db_password               = var.db_password
  serverless_min_capacity   = 0.5   
  serverless_max_capacity   = 1   
  backup_retention_period   = 1
  enable_read_replica       = false

  # Application configuration
  jwt_access_expiration  = "15m"
  jwt_refresh_expiration = "7d"
  google_callback_url    = "https://google/auth/google/callback"
  otp_expiration         = 300
  otp_step               = 30
  otp_digits             = 6
  smtp_user              = "noreply@wellmum.com"
  aws_s3_bucket_name     = "rex_wellmum-dev-storage"

  # MinIO configuration
  minio_data_volume_name = "minio-data"
}