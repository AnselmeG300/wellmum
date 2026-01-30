resource "aws_ecs_service" "chat" {
  name            = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]}"
  cluster         = data.aws_ecs_cluster.rex-wellmum.arn
  task_definition = aws_ecs_task_definition.chat.arn
  desired_count   = var.chat_service_scale_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    security_groups  = [aws_security_group.chat_task_sg.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.chat.arn
  }

  enable_execute_command = true

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]}"
    Environment = var.environment
    Service     = "chat"
  }
}

resource "aws_ecs_service" "food_detector" {
  name            = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]}"
  cluster         = data.aws_ecs_cluster.rex-wellmum.arn
  task_definition = aws_ecs_task_definition.food_detector.arn
  desired_count   = var.food_detector_service_scale_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    security_groups  = [aws_security_group.food_detector_task_sg.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.food_detector.arn
  }

  enable_execute_command = true

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]}"
    Environment = var.environment
    Service     = "food_detector"
  }
}

resource "aws_ecs_service" "nutrition" {
  name            = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]}"
  cluster         = data.aws_ecs_cluster.rex-wellmum.arn
  task_definition = aws_ecs_task_definition.nutrition.arn
  desired_count   = var.nutrition_service_scale_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    security_groups  = [aws_security_group.nutrition_task_sg.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.nutrition.arn
  }

  enable_execute_command = true

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]}"
    Environment = var.environment
    Service     = "nutrition"
  }
}

resource "aws_ecs_service" "routines" {
  name            = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]}"
  cluster         = data.aws_ecs_cluster.rex-wellmum.arn
  task_definition = aws_ecs_task_definition.routines.arn
  desired_count   = var.routines_service_scale_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    security_groups  = [aws_security_group.routines_task_sg.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.routines.arn
  }

  enable_execute_command = true

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]}"
    Environment = var.environment
    Service     = "routines"
  }
}

resource "aws_ecs_service" "social" {
  name            = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]}"
  cluster         = data.aws_ecs_cluster.rex-wellmum.arn
  task_definition = aws_ecs_task_definition.social.arn
  desired_count   = var.social_service_scale_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    security_groups  = [aws_security_group.social_task_sg.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.social.arn
  }

  enable_execute_command = true

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]}"
    Environment = var.environment
    Service     = "social"
  }
}