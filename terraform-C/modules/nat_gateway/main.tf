resource "aws_eip" "modules-eip" {
  domain = "vpc"

  tags = {
    Name = var.name
  }
}

resource "aws_nat_gateway" "modules-nat" {
  allocation_id = aws_eip.modules-eip.id
  subnet_id     = var.temp_subnet_id

  tags = {
    Name = var.name
  }
}