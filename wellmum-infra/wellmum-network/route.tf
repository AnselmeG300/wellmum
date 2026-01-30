resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.rex-wellmum.id
  tags = {
    Network = "Public"
    Name    = join("", [var.vpc_name, "-public-route-table"])
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_route_table_association1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.rex-wellmum.id
  tags = {
    Name = join("", [var.vpc_name, "-private-route-table"])
  }
}


resource "aws_route_table" "private_route_table1" {
  vpc_id = aws_vpc.rex-wellmum.id
  tags = {
    Name = join("", [var.vpc_name, "-private-route-table-1"])
  }
}


resource "aws_route" "private_route_to_internet" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}


resource "aws_route" "private_route_to_internet1" {
  route_table_id         = aws_route_table.private_route_table1.id  
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway1.id
}


resource "aws_route_table_association" "private_subnet_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "private_subnet_route_table_association1" {
#  subnet_id      = aws_subnet.private_subnet1.id
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table1.id
}