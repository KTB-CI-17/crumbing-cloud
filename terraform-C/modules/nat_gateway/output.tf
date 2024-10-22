output "nat_id" {
  description = "NAT 게이트웨이의 ID"
  value       = aws_nat_gateway.modules_nat.id
}