variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "igw_id" {
  description = "인터넷 게이트웨이의 ID"
  type        = string
}

variable "nat_network_interface_id" {
  description = "NAT 인스턴스의 네트워크 인터페이스 ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "퍼블릭 서브넷의 IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "프라이빗 서브넷의 IDs"
  type        = list(string)
}

variable "cidr" {
  description = "라우트 cidr"
  type        = list(string)
}

variable "route_table_public_name" {
  description = "퍼블릭 라우트 테이블 이름"
  type        = string
}

variable "route_table_private_name" {
  description = "프라이빗 라우트 테이블 이름"
  type        = string
}