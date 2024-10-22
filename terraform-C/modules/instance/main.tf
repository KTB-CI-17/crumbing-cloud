resource "aws_instance" "ktb-cruming-public-instance" {
  count                  = var.instance_public_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.temp_subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [var.fe_security_group_id]

  tags = {
    Name = "temp_instance"
  }
}

resource "aws_instance" "ktb-cruming-private-instance_fe" {
  count                  = var.instance_private_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.fe_subnet_id
  vpc_security_group_ids = [var.fe_security_group_id]

  tags = {
    Name = var.public_name
  }
}

resource "aws_instance" "ktb-cruming-private-instance_be" {
  count                  = var.instance_private_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.be_subnet_id
  vpc_security_group_ids = [var.be_security_group_id]

  tags = {
    Name = var.private_name
  }
}