resource "aws_security_group" "efs_sg" {
  name        = "rex-wellmum-efs-sg"
  description = "Security group for EFS mount targets"
  vpc_id      = data.aws_vpc.rex-wellmum.id

  ingress {
    description = "NFS from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.rex-wellmum.cidr_block]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rex-wellmum-efs-sg"
  }
}
