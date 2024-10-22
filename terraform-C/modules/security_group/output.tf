output "security_group_id-fe" {
  description = "프론트 보안 그룹의 ID"
  value       = aws_security_group.ktb-cruming-sg-FE.id
}

output "security_group_id-be" {
  description = "백 보안 그룹의 ID"
  value       = aws_security_group.ktb-cruming-sg-BE.id
}
