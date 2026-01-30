resource "aws_ecr_repository" "rex-wellmum" {
  name                 = "rex-wellmum"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "rex-wellmum"
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

resource "aws_ecr_lifecycle_policy" "rex-wellmum_policy" {
  
  repository = aws_ecr_repository.rex-wellmum.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 20 images"
        selection = {
          tagStatus     = "any"
          countType     = "imageCountMoreThan"
          countNumber   = 20
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}
