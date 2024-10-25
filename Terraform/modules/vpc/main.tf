resource "aws_vpc" "modules_vpc" {
  cidr_block            = var.cidr

  tags = {
    Name = var.name
  }
}