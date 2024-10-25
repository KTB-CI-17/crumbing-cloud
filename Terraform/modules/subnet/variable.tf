variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "subnet_ai" {
  description = "AI 서브넷"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}

variable "subnet_cloud" {
  description = "클라우드 서브넷"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}