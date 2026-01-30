resource "aws_iam_policy" "rex-wellmum-api-and-ai_ecs_secrets_policy" {
  name        = "rex-wellmum-api-and-ai-ecs-secrets-policy"
  description = "Allows ECS tasks to access secrets from AWS Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "rex-wellmum-api-and-ai_ecs_awslogs_policy" {
  name        = "rex-wellmum-api-and-ai-ecs-awslogs-policy"
  description = "Allows ECS tasks to access logs from AWS Logs"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup"
        ],
        "Resource" : "*"
      }
    ]
  })
}