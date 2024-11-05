variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "subnets" {
  description = "서브넷 설정 목록"
  type = map(object({
    az   = string
    cidr = string
    name = string
  }))
}
