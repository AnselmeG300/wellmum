resource "aws_ecs_service" "mailhog" {

  name             = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-service"
  cluster          = data.aws_ecs_cluster.rex-wellmum.id
  task_definition  = aws_ecs_task_definition.mailhog.arn
  desired_count    = var.mailhog_service_scale_desired_count
  launch_type      = "FARGATE"
  platform_version = "1.4.0"


  network_configuration {
    security_groups = [
      aws_security_group.mailhog_task_sg.id
    ]
    subnets = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.mailhog.arn
    container_name   = "mailhog"
    container_port   = 8025
  }

  service_registries {
    registry_arn = aws_service_discovery_service.mailhog.arn
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  depends_on = [
    aws_lb_listener.mailhog_listener_http
  ]

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-service"
    Environment = var.environment
    Service     = "mailhog"
  }
}


resource "aws_ecs_service" "minio" {
  name             = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-service"
  cluster          = data.aws_ecs_cluster.rex-wellmum.id
  task_definition  = aws_ecs_task_definition.minio.arn
  desired_count    = var.minio_service_scale_desired_count
  launch_type      = "FARGATE"
  platform_version = "1.4.0"

  network_configuration {
    security_groups = [
      aws_security_group.minio_task_sg.id
    ]
    subnets = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.minio.arn
    container_name   = "minio"
    container_port   = 10001
  }

  service_registries {
    registry_arn = aws_service_discovery_service.minio.arn
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  depends_on = [
    aws_lb_listener.minio_listener_http
  ]

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-service"
    Environment = var.environment
    Service     = "minio"
  }
}

resource "aws_ecs_service" "api" {
  name             = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-service"
  cluster          = data.aws_ecs_cluster.rex-wellmum.id
  task_definition  = aws_ecs_task_definition.api.arn
  desired_count    = var.api_service_scale_desired_count
  launch_type      = "FARGATE"
  platform_version = "1.4.0"

  network_configuration {
    security_groups = [
      aws_security_group.api_task_sg.id
    ]
    subnets = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.api.arn
    container_name   = "api"
    container_port   = 3000
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  enable_execute_command = true

  depends_on = [
    aws_lb_listener.api_listener_http,
    aws_rds_cluster.aurora_postgres
  ]

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-service"
    Environment = var.environment
    Service     = "api"
  }
}
resource "aws_ecs_service" "bastion" {
  name             = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}-service"
  cluster          = data.aws_ecs_cluster.rex-wellmum.id
  task_definition  = aws_ecs_task_definition.bastion.arn
  desired_count    = var.pgadmin_service_scale_desired_count
  launch_type      = "FARGATE"
  platform_version = "1.4.0"

  network_configuration {
    security_groups = [
      aws_security_group.bastion_task_sg.id
    ]
    subnets = [
      data.aws_subnet.private_subnet.id,
      data.aws_subnet.private_subnet1.id,
    ]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.bastion.arn
    container_name   = "pgadmin"
    container_port   = 80
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  enable_execute_command = true

  depends_on = [
    aws_lb_listener.bastion_listener_http
  ]

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}-service"
    Environment = var.environment
    Service     = "bastion"
  }
}