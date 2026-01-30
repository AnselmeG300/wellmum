variable "db_username" {
  type        = string
  description = "Master username for Aurora PostgreSQL"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "Master password for Aurora PostgreSQL"
  sensitive   = true
}