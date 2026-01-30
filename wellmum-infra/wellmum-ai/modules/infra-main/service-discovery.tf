resource "aws_service_discovery_private_dns_namespace" "wellmum_ai" {
  name        = "${local.resource_prefix}-wellmum-ai"
  description = "Private DNS namespace for Wellmum AI microservices"
  vpc         = data.aws_vpc.rex-wellmum.id

  tags = {
    Name        = "${local.resource_prefix}-wellmum-ai-namespace"
    Environment = var.environment
  }
}

resource "aws_service_discovery_service" "chat" {
  name = "chat"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.wellmum_ai.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Name        = "${var.project_name}-chat-discovery"
    Environment = var.environment
    Service     = "chat"
  }
}

resource "aws_service_discovery_service" "food_detector" {
  name = "food_detector"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.wellmum_ai.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Name        = "${var.project_name}-food_detector-discovery"
    Environment = var.environment
    Service     = "food_detector"
  }
}

resource "aws_service_discovery_service" "nutrition" {
  name = "nutrition"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.wellmum_ai.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Name        = "${var.project_name}-nutrition-discovery"
    Environment = var.environment
    Service     = "nutrition"
  }
}

resource "aws_service_discovery_service" "routines" {
  name = "routines"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.wellmum_ai.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Name        = "${var.project_name}-routines-discovery"
    Environment = var.environment
    Service     = "routines"
  }
}

resource "aws_service_discovery_service" "social" {
  name = "social"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.wellmum_ai.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Name        = "${var.project_name}-social-discovery"
    Environment = var.environment
    Service     = "social"
  }
}
