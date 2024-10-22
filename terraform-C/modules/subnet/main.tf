resource "aws_subnet" "fe_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.fe_subnet.cidr
  availability_zone       = var.fe_subnet.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.fe_subnet.name
  }
}

resource "aws_subnet" "be_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.be_subnet.cidr
  availability_zone       = var.be_subnet.az
  map_public_ip_on_launch = false

  tags = {
    Name = var.be_subnet.name
  }
}

resource "aws_subnet" "temp_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "192.168.10.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "ktb_cruming_temp_subnet"
  }
}
