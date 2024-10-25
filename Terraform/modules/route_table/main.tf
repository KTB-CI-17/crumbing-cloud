resource "aws_route_table" "modules_rt_public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "ktb-cruming-rt"
  }
}

resource "aws_route_table_association" "modules_rta_public" {
  subnet_id      = var.subnet_cloud_id
  route_table_id = aws_route_table.modules_rt_public.id
}

resource "aws_route_table" "modules_rt_private" {
  vpc_id = var.vpc_id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = var.nat_id
  }

  tags = {
    Name = var.route_table_private_name
  }
}

resource "aws_route_table_association" "modules_rta_private" {
  for_each = {
    ai_subnet_id = var.subnet_ai_id
    cloud_subnet_id = var.subnet_cloud_id
  }
  subnet_id       = each.value
  route_table_id  = aws_route_table.modules_rt_private.id
}