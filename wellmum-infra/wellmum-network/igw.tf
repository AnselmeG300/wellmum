
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.rex-wellmum.id
  tags = {
    Network = "Public"
    Name    = join("", [var.vpc_name, "-IGW"])
  }
}