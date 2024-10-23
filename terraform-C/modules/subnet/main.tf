resource "aws_subnet" "modules_subnet_fe" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_fe.cidr
  availability_zone       = var.subnet_fe.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_fe.name
  }
}

resource "aws_subnet" "modules_subnet_be" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_be.cidr
  availability_zone       = var.subnet_be.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_be.name
  }
}

resource "aws_subnet" "modules_subnet_temp" {
  vpc_id                  = var.vpc_id
  cidr_block              = "192.168.10.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "ktb_cruming_subnet_temp"
  }
}
