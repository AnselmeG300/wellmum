data "aws_region" "current" {}

data "aws_vpc" "rex-wellmum" {
  filter {
    name   = "tag:Name"
    values = ["REX WELLMUM VPC infrastructure"]
  }
}

data "aws_ecs_cluster" "rex-wellmum" {
  cluster_name = "rex-wellmum"
}

data "aws_subnet" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = ["REX WELLMUM VPC infrastructure-private-a"]
  }
}

data "aws_subnet" "private_subnet1" {
  filter {
    name   = "tag:Name"
    values = ["REX WELLMUM VPC infrastructure-private-b"]
  }
}

data "aws_iam_role" "rex-wellmum-api-and-ai" {
  name = "rex-wellmum-api-and-ai-ecs-task-role"
}

# ECR Repository
data "aws_ecr_repository" "rex-wellmum-ai-chat" {
  name = "rex-wellmum-ai-chat"
}

# ECR Repository
data "aws_ecr_repository" "rex-wellmum-ai-food-detector" {
  name = "rex-wellmum-ai-food-detector"
}

# ECR Repository
data "aws_ecr_repository" "rex-wellmum-ai-nutrition" {
  name = "rex-wellmum-ai-nutrition"
}

# ECR Repository
data "aws_ecr_repository" "rex-wellmum-ai-routines" {
  name = "rex-wellmum-ai-routines"
}

# ECR Repository
data "aws_ecr_repository" "rex-wellmum-ai-social" {
  name = "rex-wellmum-ai-social"
}
