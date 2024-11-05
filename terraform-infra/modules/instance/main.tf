resource "aws_instance" "modules_instance_public" {
  for_each = var.public_instances

  ami                    = var.ami
  instance_type          = var.instance_public_type
  key_name               = var.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.security_group_ids
  associate_public_ip_address = each.value.associate_public_ip

  tags = {
    Name = each.value.instance_name
  }
}

resource "aws_instance" "modules_instance_private" {
  for_each = var.private_instances

  ami                    = var.ami
  instance_type          = contains(split("-", each.value.instance_name), "ai") ? var.instance_ai_type : var.instance_node_type
  key_name               = var.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.security_group_ids

  associate_public_ip_address = false

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = each.value.instance_name
  }
}
