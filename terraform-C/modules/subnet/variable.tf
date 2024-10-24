variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "subnet_fe" {
  description = "프론트 서브넷"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}

variable "subnet_be" {
  description = "백 서브넷"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}