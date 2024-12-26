variable "db_subnet_group_name" {
  description = "DB 서브넷 그룹 이름"
  type        = string
}

variable "private_subnet_ids" {
  description = "프라이빗 서브넷 ID들의 목록"
  type        = list(string)
}
