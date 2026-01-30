resource "aws_network_acl" "public_network_acl" {
  vpc_id = aws_vpc.rex-wellmum.id

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Network = "Public"
    Name    = join("", [var.vpc_name, "-public-nacl"])
  }
}


resource "aws_network_acl_association" "public_subnet_network_acl_association" {
  subnet_id      = aws_subnet.public_subnet.id
  network_acl_id = aws_network_acl.public_network_acl.id
}


resource "aws_network_acl_association" "public_subnet_network_acl_association1" {
  subnet_id      = aws_subnet.public_subnet1.id
  network_acl_id = aws_network_acl.public_network_acl.id
}


resource "aws_network_acl" "private_network_acl" {
  vpc_id = aws_vpc.rex-wellmum.id

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Network = "Private"
    Name    = join("", [var.vpc_name, "-private-nacl"])
  }
}

resource "aws_network_acl_association" "private_subnet_network_acl_association" {
  subnet_id      = aws_subnet.private_subnet.id
  network_acl_id = aws_network_acl.private_network_acl.id
}


resource "aws_network_acl_association" "private_subnet_network_acl_association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  network_acl_id = aws_network_acl.private_network_acl.id
}