output "fe_subnet_id" {
  description = "프론트 서브넷 ID"
  value       = aws_subnet.fe_subnet
}

output "be_subnet_id" {
  description = "백 서브넷 ID"
  value       = aws_subnet.be_subnet.id
}

output "temp_subnet_id" {
  description = "백 서브넷 ID"
  value       = aws_subnet.temp_subnet.id
}