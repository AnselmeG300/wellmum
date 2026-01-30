# Data source pour les zones de disponibilité
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_rds_cluster" "aurora_postgres" {
  cluster_identifier      = "${local.resource_prefix}-${var.project_name}-postgres-cluster"
  engine                  = "aurora-postgresql"
  engine_mode             = "provisioned"
  engine_version          = "17.4"
  database_name           = var.db_name
  master_username         = var.db_username
  master_password         = var.db_password
  
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = "03:00-04:00"
  preferred_maintenance_window = "mon:04:00-mon:05:00"
  
  storage_encrypted = true

  availability_zones = [
    "${data.aws_region.current.region}a",
    "${data.aws_region.current.region}b"
  ]
  
  
  skip_final_snapshot       = var.environment == "development" ? true : false
  final_snapshot_identifier = var.environment != "development" ? "${local.resource_prefix}-${var.project_name}-postgres-final-snapshot" : null
  deletion_protection       = var.environment == "production" ? false : false
  
  enabled_cloudwatch_logs_exports = ["postgresql"]
  
  lifecycle {
    ignore_changes = [availability_zones]
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-postgres-cluster"
    Environment = var.environment
  }
}

# Aurora Serverless v2 Writer Instance
resource "aws_rds_cluster_instance" "aurora_serverless_writer" {
  identifier              = "${local.resource_prefix}-${var.project_name}-postgres-writer"
  cluster_identifier      = aws_rds_cluster.aurora_postgres.id
  instance_class          = "db.t4g.medium"
  engine                  = aws_rds_cluster.aurora_postgres.engine
  engine_version          = aws_rds_cluster.aurora_postgres.engine_version
  
  publicly_accessible     = false
  
  performance_insights_enabled = true
  monitoring_interval          = 60
  monitoring_role_arn          = data.aws_iam_role.rds_monitoring_role.arn
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-postgres-writer"
    Environment = var.environment
    Role        = "writer"
  }
}

resource "aws_rds_cluster_instance" "aurora_serverless_reader" {
  count = var.enable_read_replica && var.environment == "production" ? 1 : 0
  
  identifier              = "${local.resource_prefix}-${var.project_name}-postgres-reader"
  cluster_identifier      = aws_rds_cluster.aurora_postgres.id
  instance_class          = "db.t4g.medium"
  engine                  = aws_rds_cluster.aurora_postgres.engine
  engine_version          = aws_rds_cluster.aurora_postgres.engine_version
  
  publicly_accessible     = false
  
  performance_insights_enabled = true
  monitoring_interval          = 60
  monitoring_role_arn          = data.aws_iam_role.rds_monitoring_role.arn
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-postgres-reader"
    Environment = var.environment
    Role        = "reader"
  }
}