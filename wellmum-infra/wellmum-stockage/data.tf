data "aws_vpc" "rex-wellmum" {
  tags = {
    Name = "REX WELLMUM VPC infrastructure"
  }
}

data "aws_subnet" "private_subnet" {
  tags = {
    Name = "REX WELLMUM VPC infrastructure-private-a"
  }
}

data "aws_subnet" "private_subnet1" {
  tags = {
    Name = "REX WELLMUM VPC infrastructure-private-b"
  }
}
