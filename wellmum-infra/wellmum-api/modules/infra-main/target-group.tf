resource "aws_lb_target_group" "mailhog" {
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}"
  vpc_id      = data.aws_vpc.rex-wellmum.id
  target_type = "ip"
  port        = 8025
  protocol    = "HTTP"
  health_check {
    port = 8025
    path = "/"
  }
  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}"
    Environment = var.environment
  }
}


resource "aws_lb_target_group" "minio" {
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}"
  vpc_id      = data.aws_vpc.rex-wellmum.id
  target_type = "ip"
  port        = 10001
  protocol    = "HTTP"
  health_check {
    port = 10001
    path = "/"
  }
  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "api" {
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}"
  vpc_id      = data.aws_vpc.rex-wellmum.id
  target_type = "ip"
  port        = 3000
  protocol    = "HTTP"
  health_check {
    port                = 3000
    path                = "/api/healthcheck"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher             = "200"
  }
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}"
    Environment = var.environment
    Service     = "api"
  }
}


# Target Group for Load Balancer
resource "aws_lb_target_group" "bastion" {
  name        = "${local.resource_prefix}-${var.project_name}-bastion-tg"
  vpc_id      = data.aws_vpc.rex-wellmum.id
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/misc/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-bastion-tg"
    Environment = var.environment
  }
}