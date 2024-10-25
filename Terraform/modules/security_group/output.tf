output "sg_ai_id" {
  description = "ai 보안 그룹 ID"
  value       = aws_security_group.modules_sg_ai.id
}

output "sg_cloud_id" {
  description = "클라우드 보안 그룹 ID"
  value       = aws_security_group.modules_sg_cloud.id
}