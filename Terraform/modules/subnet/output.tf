output "subnet_ai_id" {
  description = "AI 서브넷 ID"
  value       = aws_subnet.modules_subnet_ai.id
}

output "subnet_cloud_id" {
  description = "클라우드 서브넷 ID"
  value       = aws_subnet.modules_subnet_cloud.id
}

output "subnet_temp_id" {
  description = "백 서브넷 ID"
  value       = aws_subnet.modules_subnet_temp.id
}