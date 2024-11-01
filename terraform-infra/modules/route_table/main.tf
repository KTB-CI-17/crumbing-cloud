# 공용 라우팅 테이블 생성
resource "aws_route_table" "modules_public_rt" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.cidr

    content {
      cidr_block = route.value
      gateway_id = var.igw_id
    }
  }

  tags = {
    Name = var.route_table_public_name
  }
}

resource "aws_route_table_association" "modules_public_assoc" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.modules_public_rt.id
}

resource "aws_route_table" "modules_private_rt" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.cidr

    content {
      cidr_block           = route.value
      network_interface_id = var.nat_network_interface_id
    }
  }
  tags = {
    Name = var.route_table_private_name
  }
}

resource "aws_route_table_association" "modules_private_assoc" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.modules_private_rt.id
}