output "db_subnet_group_name" {
  description = "DB 서브넷 그룹 이름"
  value       = aws_db_subnet_group.modules_subnet_group_database.name
}
