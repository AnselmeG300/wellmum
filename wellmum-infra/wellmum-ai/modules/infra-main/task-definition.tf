resource "aws_ecs_task_definition" "chat" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  
  container_definitions = templatefile("${path.module}/containers-definitions/chat.json", {
    AWS_REGION        = data.aws_region.current.region
    PROJECT_NAME      = var.project_name
    ENVIRONMENT       = var.environment
    IMAGE             = "${data.aws_ecr_repository.rex-wellmum-ai-chat.repository_url}:${local.image_tag_chat}"
  })
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]}"
    Environment = var.environment
    Service     = "chat"
  }
}

resource "aws_ecs_task_definition" "food_detector" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  
  container_definitions = templatefile("${path.module}/containers-definitions/food_detector.json", {
    AWS_REGION        = data.aws_region.current.region
    PROJECT_NAME      = var.project_name
    ENVIRONMENT       = var.environment
    IMAGE             = "${data.aws_ecr_repository.rex-wellmum-ai-food-detector.repository_url}:${local.image_tag_food_detector}"
  })
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]}"
    Environment = var.environment
    Service     = "food_detector"
  }
}

resource "aws_ecs_task_definition" "nutrition" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  
  container_definitions = templatefile("${path.module}/containers-definitions/nutrition.json", {
    AWS_REGION        = data.aws_region.current.region
    PROJECT_NAME      = var.project_name
    ENVIRONMENT       = var.environment
    IMAGE             = "${data.aws_ecr_repository.rex-wellmum-ai-nutrition.repository_url}:${local.image_tag_nutrition}"
  })
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]}"
    Environment = var.environment
    Service     = "nutrition"
  }
}

resource "aws_ecs_task_definition" "routines" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  
  container_definitions = templatefile("${path.module}/containers-definitions/routines.json", {
    AWS_REGION        = data.aws_region.current.region
    PROJECT_NAME      = var.project_name
    ENVIRONMENT       = var.environment
    IMAGE             = "${data.aws_ecr_repository.rex-wellmum-ai-routines.repository_url}:${local.image_tag_routines}"
  })
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]}"
    Environment = var.environment
    Service     = "routines"
  }
}

resource "aws_ecs_task_definition" "social" {
  family                   = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  task_role_arn            = data.aws_iam_role.rex-wellmum-api-and-ai.arn
  
  container_definitions = templatefile("${path.module}/containers-definitions/social.json", {
    AWS_REGION        = data.aws_region.current.region
    PROJECT_NAME      = var.project_name
    ENVIRONMENT       = var.environment
    IMAGE             = "${data.aws_ecr_repository.rex-wellmum-ai-social.repository_url}:${local.image_tag_social}"
  })
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]}"
    Environment = var.environment
    Service     = "social"
  }
}
