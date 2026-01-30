resource "aws_vpc" "rex-wellmum" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = local.mappings["SubnetConfig"]["VPC"]["CIDR"]
  tags = {
    Network = "Public"
    Name    = var.vpc_name
  }
}