resource "aws_subnet" "modules_subnet" {
  for_each                = var.subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = startswith(each.key, "public_")

  tags = {
    Name = each.value.name
  }
}
