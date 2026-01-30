resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.nat_eip.allocation_id
}


resource "aws_nat_gateway" "nat_gateway1" {
  subnet_id     = aws_subnet.public_subnet1.id
  allocation_id = aws_eip.nat_eip1.allocation_id
}