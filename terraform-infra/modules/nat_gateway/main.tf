resource "aws_eip" "modules_eip" {
  domain = "vpc"

  tags = {
    Name = var.name
  }
}

resource "aws_nat_gateway" "modules_nat" {
  allocation_id = aws_eip.modules_eip.id
  subnet_id     = var.subnet_temp_id

  tags = {
    Name = var.name
  }
}