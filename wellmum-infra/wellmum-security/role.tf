data "aws_iam_policy_document" "rex-wellmum-api-and-ai" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "rex-wellmum-api-and-ai" {
  name               = "rex-wellmum-api-and-ai-ecs-task-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.rex-wellmum-api-and-ai.json
}

resource "aws_iam_role_policy_attachment" "rex-wellmum-api-and-ai_ecs_secrets" {
  role       = aws_iam_role.rex-wellmum-api-and-ai.name
  policy_arn = aws_iam_policy.rex-wellmum-api-and-ai_ecs_secrets_policy.arn
}

resource "aws_iam_role_policy_attachment" "rex-wellmum-api-and-ai_ecs_awslogs" {
  role       = aws_iam_role.rex-wellmum-api-and-ai.name
  policy_arn = aws_iam_policy.rex-wellmum-api-and-ai_ecs_awslogs_policy.arn
}

resource "aws_iam_role_policy_attachment" "rex-wellmum-api-and-ai_ecs_ebs" {
  role       = aws_iam_role.rex-wellmum-api-and-ai.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSInfrastructureRolePolicyForVolumes"
}

data "aws_iam_policy_document" "rex-wellmum-landing" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "rex-wellmum-landing" {
  name               = "rex-wellmum-landing-amplify-service-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.rex-wellmum-landing.json
}

resource "aws_iam_role_policy_attachment" "rex-wellmum-landing_amplify_admin" {
  role       = aws_iam_role.rex-wellmum-landing.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}

# IAM Role pour Enhanced Monitoring
resource "aws_iam_role" "rds_monitoring_role" {
  name = "rex-wellmum-api-rds-monitoring-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "rex-wellmum-api-rds-monitoring-role"
  }
}

resource "aws_iam_role_policy_attachment" "rds_monitoring_policy" {
  role       = aws_iam_role.rds_monitoring_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}