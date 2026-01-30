resource "aws_security_group" "chat_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]}-Task-ECS-SG"
  description = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]} Task ECS SG - Internal communication only"
  
  ingress {
    description = "Chat API from private subnets"
    protocol    = "tcp"
    from_port   = 8002
    to_port     = 8002
    cidr_blocks = [
      data.aws_subnet.private_subnet.cidr_block,
      data.aws_subnet.private_subnet1.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["chat"]}-Task-ECS-SG"
    Environment = var.environment
    Service     = "chat"
  }
}
resource "aws_security_group" "food_detector_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]}-Task-ECS-SG"
  description = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]} Task ECS SG - Internal communication only"
  
  ingress {
    description = "Food Detector API from private subnets"
    protocol    = "tcp"
    from_port   = 8004
    to_port     = 8004
    cidr_blocks = [
      data.aws_subnet.private_subnet.cidr_block,
      data.aws_subnet.private_subnet1.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["food_detector"]}-Task-ECS-SG"
    Environment = var.environment
    Service     = "food_detector"
  }
}
resource "aws_security_group" "nutrition_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]}-Task-ECS-SG"
  description = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]} Task ECS SG - Internal communication only"
  
  ingress {
    description = "Nutrition API from private subnets"
    protocol    = "tcp"
    from_port   = 8001
    to_port     = 8001
    cidr_blocks = [
      data.aws_subnet.private_subnet.cidr_block,
      data.aws_subnet.private_subnet1.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["nutrition"]}-Task-ECS-SG"
    Environment = var.environment
    Service     = "nutrition"
  }
}
resource "aws_security_group" "routines_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]}-Task-ECS-SG"
  description = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]} Task ECS SG - Internal communication only"
  
  ingress {
    description = "Routines API from private subnets"
    protocol    = "tcp"
    from_port   = 8000
    to_port     = 8000
    cidr_blocks = [
      data.aws_subnet.private_subnet.cidr_block,
      data.aws_subnet.private_subnet1.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["routines"]}-Task-ECS-SG"
    Environment = var.environment
    Service     = "routines"
  }
}
resource "aws_security_group" "social_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]}-Task-ECS-SG"
  description = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]} Task ECS SG - Internal communication only"
  
  ingress {
    description = "Social API from private subnets"
    protocol    = "tcp"
    from_port   = 8003
    to_port     = 8003
    cidr_blocks = [
      data.aws_subnet.private_subnet.cidr_block,
      data.aws_subnet.private_subnet1.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["social"]}-Task-ECS-SG"
    Environment = var.environment
    Service     = "social"
  }
}