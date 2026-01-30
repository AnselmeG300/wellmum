resource "aws_service_discovery_private_dns_namespace" "rex-wellmum" {
  name        = "${local.resource_prefix}-wellmum-api"
  description = "Private dns namespace for service discovery"
  vpc         = data.aws_vpc.rex-wellmum.id

  tags = {
    Name        = "${local.resource_prefix}-wellmum-ai-namespace"
    Environment = var.environment
  }
}

resource "aws_service_discovery_service" "minio" {
  name = "minio"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.rex-wellmum.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_service_discovery_service" "mailhog" {
  name = "mailhog"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.rex-wellmum.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  tags = {
    Environment = var.environment
  }
}
