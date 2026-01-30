variable "minio_root_user" {
  description = "MinIO root user"
  type        = string
  sensitive   = true
}

variable "minio_root_password" {
  description = "MinIO root password"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT secret key for API authentication"
  type        = string
  sensitive   = true
}

variable "swagger_user" {
  description = "Swagger UI username"
  type        = string
  default     = "admin"
}

variable "swagger_password" {
  description = "Swagger UI password"
  type        = string
  sensitive   = true
  default     = "admin"
}

variable "google_client_id" {
  description = "Google OAuth client ID"
  type        = string
  sensitive   = true
  default     = ""
}

variable "google_client_secret" {
  description = "Google OAuth client secret"
  type        = string
  sensitive   = true
  default     = ""
}

variable "otp_secret" {
  description = "OTP secret key"
  type        = string
  sensitive   = true
  default     = "change_this_to_a_secure_random_string"
}

variable "smtp_password" {
  description = "SMTP password"
  type        = string
  sensitive   = true
  default     = ""
}

variable "session_secret" {
  description = "Session secret key"
  type        = string
  sensitive   = true
  default     = "change_this_to_a_secure_session_secret_at_least_32_chars"
}

variable "pgadmin_email" {
  description = "Email pour pgadmin"
  type        = string
  sensitive   = true
}

variable "pgadmin_password" {
  description = "Mot de passe pgadmin"
  type        = string
  sensitive   = true
}

variable "domain_name_wellmum"{
  description = "certificate"
  type        = string
  default     = "prod-wordpress.com"
}