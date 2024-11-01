variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "public_subnet_id" {
  description = "퍼블릭 서브넷 ID"
  type        = string
}

variable "ami" {
  description = "NAT 인스턴스용 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "NAT 인스턴스 타입"
  type        = string
}

variable "key_name" {
  description = "키 이름"
  type        = string
}

variable "name" {
  description = "NAT 리소스의 이름"
  type        = string
}

variable "sg_name" {
  description = "NAT 보안그룹 이름"
  type        = string
}

variable "ingress" {
  description = "인그레스 규칙"
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
