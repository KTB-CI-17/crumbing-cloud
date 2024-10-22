resource "aws_security_group" "ktb-cruming-sg-FE" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_fe
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = var.egress.from_port
    to_port     = var.egress.to_port
    protocol    = var.egress.protocol
    cidr_blocks = var.egress.cidr_blocks
  }

  tags = {
    Name = var.name_fe
  }
}

resource "aws_security_group" "ktb-cruming-sg-BE" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_be
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = var.egress.from_port
    to_port     = var.egress.to_port
    protocol    = var.egress.protocol
    cidr_blocks = var.egress.cidr_blocks
  }

  tags = {
    Name = var.name_be
  }
}
