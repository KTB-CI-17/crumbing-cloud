output "sg_fe_id" {
  description = "프론트 보안 그룹의 ID"
  value       = aws_security_group.modules_sg_fe.id
}

output "sg_be_id" {
  description = "백 보안 그룹의 ID"
  value       = aws_security_group.modules_sg_be.id
}
