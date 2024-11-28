output "sg_bastion_id" {
  description = "배스천 보안 그룹의 ID"
  value       = aws_security_group.modules_sg_bastion.id
}

output "sg_master_id" {
  description = "마스터 보안 그룹의 ID"
  value       = aws_security_group.modules_sg_master.id
}

output "sg_worker_id" {
  description = "worker 보안 그룹 ID"
  value       = aws_security_group.modules_sg_worker.id
}

output "sg_nfs_id" {
  description = "nfs 보안 그룹 ID"
  value       = aws_security_group.modules_sg_nfs.id
}
