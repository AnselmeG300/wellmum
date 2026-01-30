# Application Auto Scaling Target for Chat Service
resource "aws_appautoscaling_target" "chat_ecs_target" {
  max_capacity       = var.chat_autoscaling_max_capacity
  min_capacity       = var.chat_autoscaling_min_capacity
  resource_id        = "service/${data.aws_ecs_cluster.rex-wellmum.cluster_name}/${aws_ecs_service.chat.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.chat]
}

resource "aws_appautoscaling_policy" "chat_cpu_scaling" {
  name               = "${var.project_name}-chat-cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.chat_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.chat_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.chat_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.ai_cpu_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

resource "aws_appautoscaling_policy" "chat_memory_scaling" {
  name               = "${var.project_name}-chat-memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.chat_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.chat_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.chat_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.ai_memory_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

# Application Auto Scaling Target for Nutrition Service
resource "aws_appautoscaling_target" "nutrition_ecs_target" {
  max_capacity       = var.nutrition_autoscaling_max_capacity
  min_capacity       = var.nutrition_autoscaling_min_capacity
  resource_id        = "service/${data.aws_ecs_cluster.rex-wellmum.cluster_name}/${aws_ecs_service.nutrition.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.nutrition]
}

resource "aws_appautoscaling_policy" "nutrition_cpu_scaling" {
  name               = "${var.project_name}-nutrition-cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.nutrition_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.nutrition_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.nutrition_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.ai_cpu_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

resource "aws_appautoscaling_policy" "nutrition_memory_scaling" {
  name               = "${var.project_name}-nutrition-memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.nutrition_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.nutrition_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.nutrition_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.ai_memory_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

# Application Auto Scaling Target for Routines Service
resource "aws_appautoscaling_target" "routines_ecs_target" {
  max_capacity       = var.routines_autoscaling_max_capacity
  min_capacity       = var.routines_autoscaling_min_capacity
  resource_id        = "service/${data.aws_ecs_cluster.rex-wellmum.cluster_name}/${aws_ecs_service.routines.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.routines]
}

resource "aws_appautoscaling_policy" "routines_cpu_scaling" {
  name               = "${var.project_name}-routines-cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.routines_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.routines_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.routines_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.ai_cpu_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

resource "aws_appautoscaling_policy" "routines_memory_scaling" {
  name               = "${var.project_name}-routines-memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.routines_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.routines_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.routines_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.ai_memory_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

# Application Auto Scaling Target for Social Service
resource "aws_appautoscaling_target" "social_ecs_target" {
  max_capacity       = var.social_autoscaling_max_capacity
  min_capacity       = var.social_autoscaling_min_capacity
  resource_id        = "service/${data.aws_ecs_cluster.rex-wellmum.cluster_name}/${aws_ecs_service.social.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.social]
}

resource "aws_appautoscaling_policy" "social_cpu_scaling" {
  name               = "${var.project_name}-social-cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.social_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.social_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.social_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.ai_cpu_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}

resource "aws_appautoscaling_policy" "social_memory_scaling" {
  name               = "${var.project_name}-social-memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.social_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.social_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.social_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.ai_memory_target_value
    scale_in_cooldown  = var.ai_scale_in_cooldown
    scale_out_cooldown = var.ai_scale_out_cooldown
  }
}