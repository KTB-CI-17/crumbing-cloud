resource "aws_internet_gateway" "modules_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}