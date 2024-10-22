resource "aws_vpc" "modules_vpc" {
  cidr_block            = var.cidr
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
    Name = var.name
  }
}