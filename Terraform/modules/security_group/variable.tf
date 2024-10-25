variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "name_ai" {
  description = "ai 보안 그룹 이름"
  type        = string
}

variable "ingress_ai" {
  description = "AI 인그레스 규칙"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "name_cloud" {
  description = "클라우드 보안 그룹 이름"
  type        = string
}

variable "ingress_cloud" {
  description = "클라우드 인그레스 규칙"
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