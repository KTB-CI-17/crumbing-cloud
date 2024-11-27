resource "aws_security_group" "modules_sg_bastion" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.bastion_ingress
    content {
      description = ingress.value.description
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
    Name = var.bastion_name
  }
}

locals {
  bastion_ssh = {
    description     = "bastion sg"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.modules_sg_bastion.id]
  }
}

resource "aws_security_group" "modules_sg_master" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.master_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  ingress {
    description     = local.bastion_ssh.description
    from_port       = local.bastion_ssh.from_port
    to_port         = local.bastion_ssh.to_port
    protocol        = local.bastion_ssh.protocol
    security_groups = local.bastion_ssh.security_groups
  }

  egress {
    from_port   = var.egress.from_port
    to_port     = var.egress.to_port
    protocol    = var.egress.protocol
    cidr_blocks = var.egress.cidr_blocks
  }

  tags = {
    Name = var.master_name
  }
}

resource "aws_security_group" "modules_sg_worker" {
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.worker_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  ingress {
    description     = local.bastion_ssh.description
    from_port       = local.bastion_ssh.from_port
    to_port         = local.bastion_ssh.to_port
    protocol        = local.bastion_ssh.protocol
    security_groups = local.bastion_ssh.security_groups
  }

  egress {
    from_port   = var.egress.from_port
    to_port     = var.egress.to_port
    protocol    = var.egress.protocol
    cidr_blocks = var.egress.cidr_blocks
  }

  tags = {
    Name = var.worker_name
  }
}
