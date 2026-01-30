resource "aws_secretsmanager_secret" "minio_credentials" {
  name        = "rex-wellmum/minio/auth"
  description = "MinIO root credentials for authentication"

  tags = {
    Name        = "minio-credentials"
    Service     = "minio"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "minio_credentials" {
  secret_id = aws_secretsmanager_secret.minio_credentials.id
  secret_string = jsonencode({
    MINIO_ROOT_USER     = var.minio_root_user
    MINIO_ROOT_PASSWORD = var.minio_root_password
  })
}

resource "aws_secretsmanager_secret" "jwt_secret" {
  name        = "rex-wellmum/jwt/secrets"
  description = "JWT secret key for API authentication"

  tags = {
    Name        = "jwt-secret"
    Service     = "api"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "jwt_secret" {
  secret_id     = aws_secretsmanager_secret.jwt_secret.id
  secret_string = var.jwt_secret
}

resource "aws_secretsmanager_secret" "swagger_credentials" {
  name        = "rex-wellmum/swagger/auth"
  description = "Swagger UI credentials"

  tags = {
    Name        = "swagger-credentials"
    Service     = "api"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "swagger_credentials" {
  secret_id = aws_secretsmanager_secret.swagger_credentials.id
  secret_string = jsonencode({
    username = var.swagger_user
    password = var.swagger_password
  })
}

resource "aws_secretsmanager_secret" "google_oauth" {
  name        = "rex-wellmum/google/auth"
  description = "Google OAuth credentials"

  tags = {
    Name        = "google-oauth"
    Service     = "api"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "google_oauth" {
  secret_id = aws_secretsmanager_secret.google_oauth.id
  secret_string = jsonencode({
    client_id     = var.google_client_id
    client_secret = var.google_client_secret
  })
}

resource "aws_secretsmanager_secret" "otp_secret" {
  name        = "rex-wellmum/otp/secrets"
  description = "OTP secret key"

  tags = {
    Name        = "otp-secret"
    Service     = "api"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "otp_secret" {
  secret_id     = aws_secretsmanager_secret.otp_secret.id
  secret_string = var.otp_secret
}

resource "aws_secretsmanager_secret" "smtp_password" {
  name        = "rex-wellmum/smtp/pass"
  description = "SMTP password"

  tags = {
    Name        = "smtp-password"
    Service     = "api"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "smtp_password" {
  secret_id     = aws_secretsmanager_secret.smtp_password.id
  secret_string = var.smtp_password
}

resource "aws_secretsmanager_secret" "session_secret" {
  name        = "rex-wellmum/session/secrets"
  description = "Session secret key"

  tags = {
    Name        = "session-secret"
    Service     = "api"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "session_secret" {
  secret_id     = aws_secretsmanager_secret.session_secret.id
  secret_string = var.session_secret
}


resource "aws_secretsmanager_secret" "pgadmin_credentials" {
  name        = "rex-wellmum/pgadmin/auth"
  description = "PGAdmin root credentials for authentication"

  tags = {
    Name        = "pgadmin-credentials"
    Service     = "pgadmin"
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "pgadmin_credentials" {
  secret_id = aws_secretsmanager_secret.pgadmin_credentials.id
  secret_string = jsonencode({
    PGADMIN_EMAIL    = var.pgadmin_email
    PGADMIN_PASSWORD = var.pgadmin_password
  })
}

