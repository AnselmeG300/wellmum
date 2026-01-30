variable "environment" {
  type        = string
  description = "Environment for tagging"
  default     = "production"
  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be one of 'development', 'staging', or 'production'."
  }
}