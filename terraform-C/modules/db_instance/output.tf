output "db_instance_endpoint" {
  description = "DB 인스턴스의 연결 엔드포인트"
  value       = aws_db_instance.database.endpoint
}

output "db_instance_id" {
  description = "RDS 인스턴스 ID"
  value       = aws_db_instance.database.id
}
