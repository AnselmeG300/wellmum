variable "github_token" {
  description = "Personal Access Token GitHub"
  type        = string
  sensitive   = true
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