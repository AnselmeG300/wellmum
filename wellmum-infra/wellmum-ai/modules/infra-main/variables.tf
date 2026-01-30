variable "project_name" {
  type        = string
  description = "Project name"
  default     = "wellmum-ai"
}

variable "services_apps" {
  type        = map(string)
  description = "AI microservices"
  default = {
    chat          = "chat"
    food_detector = "food_detector"
    nutrition     = "nutrition"
    routines      = "routines"
    social        = "social"
  }
}

variable "environment" {
  type        = string
  description = "Environment for tagging"
  default     = "production"
  validation {
    condition     = contains(["development", "production"], var.environment)
    error_message = "Environment must be one of 'development', 'production'."
  }
}



variable "chat_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale and run the chat service"
  default     = 1
}

variable "food_detector_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale and run the food_detector service"
  default     = 1
}

variable "nutrition_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale and run the nutrition service"
  default     = 1
}

variable "routines_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale and run the routines service"
  default     = 1
}

variable "social_service_scale_desired_count" {
  type        = number
  description = "Desired count to scale and run the social service"
  default     = 1
}

# Auto Scaling variables for AI services
variable "chat_autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of tasks for chat service autoscaling"
  default     = 1
}

variable "chat_autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of tasks for chat service autoscaling"
  default     = 3
}

variable "nutrition_autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of tasks for nutrition service autoscaling"
  default     = 1
}

variable "nutrition_autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of tasks for nutrition service autoscaling"
  default     = 3
}

variable "routines_autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of tasks for routines service autoscaling"
  default     = 1
}

variable "routines_autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of tasks for routines service autoscaling"
  default     = 3
}

variable "social_autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of tasks for social service autoscaling"
  default     = 1
}

variable "social_autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of tasks for social service autoscaling"
  default     = 3
}

variable "ai_cpu_target_value" {
  type        = number
  description = "Target CPU utilization percentage for AI services autoscaling"
  default     = 70
}

variable "ai_memory_target_value" {
  type        = number
  description = "Target memory utilization percentage for AI services autoscaling"
  default     = 75
}

variable "ai_scale_in_cooldown" {
  type        = number
  description = "Cooldown period (in seconds) before scaling in (removing tasks)"
  default     = 300
}

variable "ai_scale_out_cooldown" {
  type        = number
  description = "Cooldown period (in seconds) before scaling out (adding tasks)"
  default     = 60
}
