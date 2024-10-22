output "public_instance_ids" {
  description = "퍼블릭 인스턴스들의 ID"
  value       = [for instance in aws_instance.ktb-cruming-public-instance : instance.id]
}

output "private_instance_ids" {
  description = "프라이빗 인스턴스들의 ID"
  value       = [for instance in aws_instance.ktb-cruming-private-instance : instance.id]
}

output "public_instance_ips" {
  description = "퍼블릭 인스턴스들의 IP"
  value       = [for instance in aws_instance.ktb-cruming-public-instance : instance.public_ip]
}

output "private_instance_ips" {
  description = "프라이빗 인스턴스들의 IP"
  value       = [for instance in aws_instance.ktb-cruming-private-instance : instance.private_ip]
}

output "public_name" {
  description = "퍼블릭 인스턴스 이름"
  value       = var.public_name
}

output "private_name" {
  description = "프라이빗 인스턴스 이름"
  value       = var.private_name
}