variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "igw_id" {
  description = "인터넷 게이트웨이의 ID"
  type        = string
}

variable "nat_id" {
  description = "NAT 게이트웨이의 ID"
  type        = string
}

variable "subnet_temp_id" {
  description = "임시 서브넷의 ID"
  type        = string
}

variable "subnet_ai_id" {
  description = "AI 서브넷의 ID"
  type        = string
}

variable "subnet_cloud_id" {
  description = "클라우드 서브넷의 ID"
  type        = string
}

variable "route_table_private_name" {
  description = "프라이빗 라우트 테이블 이름"
  type        = string
}