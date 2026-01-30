resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = join("", [var.vpc_name, "-eip-nat-gateway-1"])
  }
}


resource "aws_eip" "nat_eip1" {
  domain = "vpc"
  tags = {
    Name = join("", [var.vpc_name, "-eip-nat-gateway-2"])
  }
}