
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.rex-wellmum.id
  availability_zone       = "${data.aws_region.current.region}${element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 0)}"
  cidr_block              = local.mappings["SubnetConfig"]["Public0"]["CIDR"]
  map_public_ip_on_launch = "true"
  tags = {
    Network = "Public"
    Name    = join("", [var.vpc_name, "-public-", element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 0)])
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.rex-wellmum.id
  availability_zone       = "${data.aws_region.current.region}${element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 1)}"
  cidr_block              = local.mappings["SubnetConfig"]["Public1"]["CIDR"]
  map_public_ip_on_launch = "true"
  tags = {
    Network = "Public"
    Name    = join("", [var.vpc_name, "-public-", element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 1)])
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.rex-wellmum.id
  availability_zone = "${data.aws_region.current.region}${element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 0)}"
  cidr_block        = local.mappings["SubnetConfig"]["Private0"]["CIDR"]
  tags = {
    Network = "Private"
    Name    = join("", [var.vpc_name, "-private-", element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 0)])
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.rex-wellmum.id
  availability_zone = "${data.aws_region.current.region}${element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 1)}"
  cidr_block        = local.mappings["SubnetConfig"]["Private1"]["CIDR"]
  tags = {
    Network = "Private"
    Name    = join("", [var.vpc_name, "-private-", element(local.mappings["AZRegions"][data.aws_region.current.region]["AZs"], 1)])
  }
}