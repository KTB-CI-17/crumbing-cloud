output "public_instance_ips" {
  description = "퍼블릭 인스턴스들의 IP"
  value = {
    for k, v in aws_instance.modules_instance_public : k => v.public_ip
  }
}

output "private_instance_ips" {
  description = "프라이빗 인스턴스들의 IP"
  value = {
    for k, v in aws_instance.modules_instance_private : k => v.private_ip
  }
}
