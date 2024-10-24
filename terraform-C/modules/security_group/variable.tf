variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "name_fe" {
  description = "프론트 보안 그룹 이름"
  type        = string
}

variable "ingress_fe" {
  description = "프론트 인그레스 규칙"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "name_be" {
  description = "벡 보안 그룹 이름"
  type        = string
}

variable "ingress_be" {
  description = "백 인그레스 규칙"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress" {
  description = "이그레스 규칙"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}