output "public_subnet_ids" {
  description = "퍼블릭 서브넷 ID 리스트"
  value = [
    for k, v in aws_subnet.modules_subnet : v.id
    if startswith(k, "public_")
  ]
}

output "private_subnet_ids" {
  description = "프라이빗 서브넷 ID 리스트"
  value = [
    for k, v in aws_subnet.modules_subnet : v.id
    if startswith(k, "private_")
  ]
}
