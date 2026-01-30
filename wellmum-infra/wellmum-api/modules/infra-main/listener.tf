resource "aws_lb_listener" "mailhog_listener_http" {
  load_balancer_arn = aws_lb.mailhog.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-listener-http"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "mailhog_listener_https" {
  load_balancer_arn = aws_lb.mailhog.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = local.current_mailhog_certificate.arn

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.mailhog.arn
        weight = 1
      }
    }
  }

  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-listener-https"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "minio_listener_http" {
  load_balancer_arn = aws_lb.minio.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-listener-http"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "minio_listener_https" {
  load_balancer_arn = aws_lb.minio.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = local.current_minio_certificate.arn

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.minio.arn
        weight = 1
      }
    }
  }

  tags = {
    Name = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-listener-https"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "api_listener_http" {
  load_balancer_arn = aws_lb.api.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-listener-http"
    Environment = var.environment
    Service     = "api"
  }
}

resource "aws_lb_listener" "api_listener_https" {
  load_balancer_arn = aws_lb.api.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = local.current_api_certificate.arn

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.api.arn
        weight = 1
      }
    }
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-listener-https"
    Environment = var.environment
    Service     = "api"
  }
}

resource "aws_lb_listener" "bastion_listener_http" {
  load_balancer_arn = aws_lb.bastion.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}-listener-http"
    Environment = var.environment
    Service     = "bastion"
  }
}

resource "aws_lb_listener" "bastion_listener_https"{
  load_balancer_arn = aws_lb.bastion.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = local.current_database_certificate.arn

  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.bastion.arn
        weight = 1
      }
    }
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}-listener-https"
    Environment = var.environment
    Service     = "bastion"
  }
}