resource "aws_subnet" "modules_subnet_ai" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_ai.cidr
  availability_zone       = var.subnet_ai.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_ai.name
  }
}

resource "aws_subnet" "modules_subnet_cloud" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cloud.cidr
  availability_zone       = var.subnet_cloud.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_cloud.name
  }
}

resource "aws_subnet" "modules_subnet_temp" {
  vpc_id                  = var.vpc_id
  cidr_block              = "192.168.10.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "ktb_cruming_temp_subnet"
  }
}