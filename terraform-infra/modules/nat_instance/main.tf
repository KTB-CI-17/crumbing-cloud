resource "aws_eip" "modules_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.name}-EIP"
  }
}

resource "aws_instance" "modules_nat_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  key_name                    = var.key_name
  source_dest_check           = false
  vpc_security_group_ids      = [aws_security_group.modules_nat_sg.id]

  tags = {
    Name = var.name
  }
}

resource "aws_eip_association" "modules_nat_eip_assoc" {
  instance_id    = aws_instance.modules_nat_instance.id
  allocation_id  = aws_eip.modules_nat_eip.id
}

resource "aws_security_group" "modules_nat_sg" {
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
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
    Name = var.sg_name
  }
}
