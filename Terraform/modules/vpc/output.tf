output "vpc_id" {
  value = aws_vpc.modules_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.modules_vpc.cidr_block
}