resource "aws_route_table" "modules_public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "ktb-cruming-temp-rt"
  }
}

resource "aws_route_table_association" "modules_public_rta" {
  subnet_id      = var.temp_subnet_id
  route_table_id = aws_route_table.modules_public_rt.id
}

resource "aws_route_table" "modules_private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block    = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "ktb-cruming-private-rt"
  }
}

resource "aws_route_table_association" "fe_private" {
  subnet_id     = var.fe_subnet_id
  route_table_id = aws_route_table.modules_private_rt.id
}

resource "aws_route_table_association" "fe_private" {
  subnet_id     = var.be_subnet_id
  route_table_id = aws_route_table.modules_private_rt.id
}