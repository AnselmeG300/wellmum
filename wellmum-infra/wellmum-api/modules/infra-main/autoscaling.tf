resource "aws_appautoscaling_target" "api_ecs_target" {
  max_capacity       = var.api_autoscaling_max_capacity
  min_capacity       = var.api_autoscaling_min_capacity
  resource_id        = "service/${data.aws_ecs_cluster.rex-wellmum.cluster_name}/${aws_ecs_service.api.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.api]
}

resource "aws_appautoscaling_policy" "api_cpu_scaling" {
  name               = "${var.project_name}-api-cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.api_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.api_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.api_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.api_cpu_target_value
    scale_in_cooldown  = var.api_scale_in_cooldown
    scale_out_cooldown = var.api_scale_out_cooldown
  }
}

# Auto Scaling Policy - Memory-based (optional, best practice)
resource "aws_appautoscaling_policy" "api_memory_scaling" {
  name               = "${var.project_name}-api-memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.api_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.api_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.api_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.api_memory_target_value
    scale_in_cooldown  = var.api_scale_in_cooldown
    scale_out_cooldown = var.api_scale_out_cooldown
  }
}

resource "aws_cloudwatch_metric_alarm" "api_high_cpu" {
  alarm_name          = "${var.project_name}-api-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors API service CPU utilization"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rex-wellmum.cluster_name
    ServiceName = aws_ecs_service.api.name
  }

  tags = {
    Name        = "${var.project_name}-api-high-cpu-alarm"
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "api_high_memory" {
  alarm_name          = "${var.project_name}-api-high-memory"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors API service memory utilization"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ClusterName = data.aws_ecs_cluster.rex-wellmum.cluster_name
    ServiceName = aws_ecs_service.api.name
  }

  tags = {
    Name        = "${var.project_name}-api-high-memory-alarm"
    Environment = var.environment
  }
}