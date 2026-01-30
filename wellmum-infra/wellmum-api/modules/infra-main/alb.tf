resource "aws_lb" "mailhog" {
  name               = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}"
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.mailhog_alb_sg.id
  ]
  subnets = [
    data.aws_subnet.public_subnet.id,
    data.aws_subnet.public_subnet1.id
  ]

  idle_timeout = 1200
  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}"
    Environment = var.environment
  }
}

resource "aws_lb" "minio" {
  name               = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}"
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.minio_alb_sg.id
  ]
  subnets = [
    data.aws_subnet.public_subnet.id,
    data.aws_subnet.public_subnet1.id
  ]

  idle_timeout = 1200
  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}"
    Environment = var.environment
  }
}

resource "aws_lb" "api" {
  name               = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}"
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.api_alb_sg.id
  ]
  subnets = [
    data.aws_subnet.public_subnet.id,
    data.aws_subnet.public_subnet1.id
  ]

  idle_timeout = 1200
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}"
    Environment = var.environment
    Service     = "api"
  }
}

# Application Load Balancer
resource "aws_lb" "bastion" {
  name               = "${local.resource_prefix}-${var.project_name}-bastion-alb"
  internal           = false  # Set to true if you want internal-only access
  load_balancer_type = "application"
  security_groups    = [aws_security_group.bastion_alb_sg.id]
  subnets            = [
    data.aws_subnet.public_subnet.id,      # ALB needs public subnets
    data.aws_subnet.public_subnet1.id,
  ]

  enable_deletion_protection = false  # Set to true for production

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-bastion-alb"
    Environment = var.environment
    Service     = "pgadmin"
  }
}



