resource "aws_ecs_cluster" "rex-wellmum" {
  name = "rex-wellmum"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}