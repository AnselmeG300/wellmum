variable "project_name" {
  type        = string
  description = "Project name"
  default     = "wellmum-api"
}

variable "services_apps" {
  type        = map(string)
  description = "application part"
  default = {
    mailhog = "mailhog",
    minio = "minio",
    createbuckets = "createbuckets",
    api = "api",
    bastion = "pgadmin"
  }
}

variable "environment" {
  type        = string
  description = "Environment for tagging"
  default     = "production"
  validation {
    condition     = contains(["development", "production"], var.environment)
    error_message = "Environment must be one of 'development' or 'production'."
  }
}

variable "pgadmin_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale up and run the pgadmin service"
  default     = 1
}

variable "mailhog_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale up and run the mailhog service"
  default     = 1
}

variable "minio_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale up and run the minio service"
  default     = 1
}

variable "api_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale up and run the api service"
  default     = 1
}

# Auto Scaling variables for API service
variable "api_autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of tasks for API service autoscaling"
  default     = 1
}

variable "api_autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of tasks for API service autoscaling"
  default     = 3
}

variable "api_cpu_target_value" {
  type        = number
  description = "Target CPU utilization percentage for API service autoscaling"
  default     = 70
}

variable "api_memory_target_value" {
  type        = number
  description = "Target memory utilization percentage for API service autoscaling"
  default     = 75
}

variable "api_scale_in_cooldown" {
  type        = number
  description = "Cooldown period (in seconds) before scaling in (removing tasks)"
  default     = 300
}

variable "api_scale_out_cooldown" {
  type        = number
  description = "Cooldown period (in seconds) before scaling out (adding tasks)"
  default     = 60
}

variable "minio_data_volume_name" {
  type        = string
  default     = "minio-data"
}

variable "db_name" {
  type        = string
  description = "Database name"
  default     = "wellmum"
}

variable "db_username" {
  type        = string
  description = "Master username for Aurora PostgreSQL"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "Master password for Aurora PostgreSQL"
  sensitive   = true
  # Sera fourni via Terraform Cloud ou variable d'environnement TF_VAR_db_password
}

variable "db_instance_class" {
  type        = string
  description = "Instance class for Aurora PostgreSQL (deprecated for Serverless v2)"
  default     = "db.serverless"
}

variable "serverless_min_capacity" {
  type        = number
  description = "Minimum ACU (Aurora Capacity Units) for Serverless v2"
  default     = 0.5
  # Range: 0.5 to 128 ACUs
}

variable "serverless_max_capacity" {
  type        = number
  description = "Maximum ACU (Aurora Capacity Units) for Serverless v2"
  default     = 1
  # Range: 0.5 to 128 ACUs
}

variable "backup_retention_period" {
  type        = number
  description = "Number of days to retain backups"
  default     = 7
}

variable "enable_read_replica" {
  type        = bool
  description = "Enable read replica instance"
  default     = false
}

# API Configuration Variables
variable "swagger_user" {
  type        = string
  description = "Swagger UI username"
  default     = "admin"
}

variable "swagger_password" {
  type        = string
  description = "Swagger UI password"
  sensitive   = true
  default     = "admin"
}

variable "jwt_access_expiration" {
  type        = string
  description = "JWT access token expiration time"
  default     = "15m"
}

variable "jwt_refresh_expiration" {
  type        = string
  description = "JWT refresh token expiration time"
  default     = "7d"
}

variable "google_client_id" {
  type        = string
  description = "Google OAuth client ID"
  sensitive   = true
  default     = ""
}

variable "google_client_secret" {
  type        = string
  description = "Google OAuth client secret"
  sensitive   = true
  default     = ""
}

variable "google_callback_url" {
  type        = string
  description = "Google OAuth callback URL"
  default     = "http://localhost:3000/auth/google/callback"
}

variable "otp_secret" {
  type        = string
  description = "OTP secret key"
  sensitive   = true
  default     = "change_this_to_a_secure_random_string"
}

variable "otp_expiration" {
  type        = number
  description = "OTP expiration time in minutes"
  default     = 5
}

variable "otp_step" {
  type        = number
  description = "OTP step interval in seconds"
  default     = 30
}

variable "otp_digits" {
  type        = number
  description = "Number of digits in OTP"
  default     = 6
}

variable "smtp_user" {
  type        = string
  description = "SMTP username"
  default     = ""
}

variable "smtp_password" {
  type        = string
  description = "SMTP password"
  sensitive   = true
  default     = ""
}

variable "session_secret" {
  type        = string
  description = "Session secret key"
  sensitive   = true
  default     = "change_this_to_a_secure_session_secret_at_least_32_chars"
}

variable "aws_s3_bucket_name" {
  type        = string
  description = "AWS S3 bucket name for storage"
  default     = ""
}

variable "pgadmin_data_volume_name" {
  description = "Volume name for pgAdmin data"
  type        = string
  default     = "pgadmin-data"
}

variable "domain_name_wellmum"{
  description = "Domain name of wellmum"
  type        = string
  default     = "prod-wordpress.com"
}