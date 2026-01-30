resource "aws_security_group" "mailhog_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-Task-ECS-SG"
  description = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]} TASK ECS SG"
  
  ingress {
    protocol    = "tcp"
    from_port   = 8025
    to_port     = 8025
    security_groups = [ aws_security_group.mailhog_alb_sg.id ]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 1025
    to_port     = 1025
    cidr_blocks = [ data.aws_subnet.private_subnet.cidr_block, data.aws_subnet.private_subnet1.cidr_block ]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-SG"
    Environment = var.environment
    Service     = "mailhog"
  }
}


resource "aws_security_group" "mailhog_alb_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["mailhog"]}-ALB-SG"
  description = "mailhog ALB SG to allow connections from http clients"
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "minio_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-Task-ECS-SG"
  description = "${var.project_name}-${var.services_apps["minio"]} Task ECS SG"
  
  ingress {
    protocol        = "tcp"
    from_port       = 10001
    to_port         = 10001
    security_groups = [aws_security_group.minio_alb_sg.id]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 10000
    to_port     = 10000
    cidr_blocks = [data.aws_vpc.rex-wellmum.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-SG"
    Environment = var.environment
    Service     = "minio"
  }
}


resource "aws_security_group" "minio_alb_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-ALB-SG"
  description = "minio ALB SG to allow connections from http clients"
  
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["minio"]}-ALB-SG"
    Environment = var.environment
    Service     = "minio"
  }
}

resource "aws_security_group" "api_task_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-Task-ECS-SG"
  description = "${var.project_name}-${var.services_apps["api"]} Task ECS SG"
  
  ingress {
    protocol    = "tcp"
    from_port   = 3000
    to_port     = 3000
    security_groups = [ aws_security_group.api_alb_sg.id ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-SG"
    Environment = var.environment
    Service     = "api"
  }
}

resource "aws_security_group" "api_alb_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-ALB-SG"
  description = "API ALB SG to allow connections from http clients"
  
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["api"]}-ALB-SG"
    Environment = var.environment
    Service     = "api"
  }
}


resource "aws_security_group" "aurora_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-aurora-sg"
  description = "Security Group for Aurora PostgreSQL - allows access from private subnets"

  ingress {
    description = "PostgreSQL from private subnets"
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = [
      data.aws_subnet.private_subnet.cidr_block,
      data.aws_subnet.private_subnet1.cidr_block
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-aurora-sg"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "${local.resource_prefix}-${var.project_name}-aurora-subnet-group"
  subnet_ids = [
    data.aws_subnet.private_subnet.id,
    data.aws_subnet.private_subnet1.id
  ]

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-aurora-subnet-group"
    Environment = var.environment
  }
}

resource "aws_security_group" "bastion_alb_sg" {
  vpc_id      = data.aws_vpc.rex-wellmum.id
  name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}-ALB-SG"
  description = "BASTION ALB SG to allow connections from http clients"
  
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-${var.services_apps["bastion"]}-ALB-SG"
    Environment = var.environment
    Service     = "bastion"
  }
}

# Security Group for Bastion Task
resource "aws_security_group" "bastion_task_sg" {
  name        = "${local.resource_prefix}-${var.project_name}-bastion-task-sg"
  vpc_id      = data.aws_vpc.rex-wellmum.id
  description = "Security group for bastion ECS task"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    security_groups = [ aws_security_group.bastion_alb_sg.id ]
  }

  # Add your ingress/egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.resource_prefix}-${var.project_name}-bastion-task-sg"
    Environment = var.environment
  }
}
