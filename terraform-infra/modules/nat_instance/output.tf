output "nat_network_interface_id" {
  description = "NAT 인스턴스의 네트워크 인터페이스 ID"
  value       = aws_instance.modules_nat_instance.primary_network_interface_id
}

output "nat_eip_id" {
  description = "NAT 인스턴스의 탄력적 IP ID"
  value       = aws_eip.modules_nat_eip.id
}