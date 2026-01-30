resource "aws_efs_file_system" "rex-wellmum" {
  creation_token = "rex-wellmum-efs"
  encrypted      = true

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "rex-wellmum-efs"
  }
}

resource "aws_efs_mount_target" "rex-wellmum_az1" {
  file_system_id  = aws_efs_file_system.rex-wellmum.id
  subnet_id       = data.aws_subnet.private_subnet.id
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_efs_mount_target" "rex-wellmum_az2" {
  file_system_id  = aws_efs_file_system.rex-wellmum.id
  subnet_id       = data.aws_subnet.private_subnet1.id
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_efs_access_point" "minio" {
  file_system_id = aws_efs_file_system.rex-wellmum.id

  root_directory {
    path = "/minio"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "755"
    }
  }

  posix_user {
    gid = 1000
    uid = 1000
  }

  tags = {
    Name    = "minio-access-point"
    Service = "minio"
  }
}

resource "aws_efs_access_point" "pgadmin" {
  file_system_id = aws_efs_file_system.rex-wellmum.id

  root_directory {
    path = "/pgadmin"
    creation_info {
      owner_gid   = 5050
      owner_uid   = 5050
      permissions = "755"
    }
  }

  posix_user {
    gid = 5050
    uid = 5050
  }

  tags = {
    Name        = "pgadmin-access-point"
    Service     = "bastion"
  
  }
}