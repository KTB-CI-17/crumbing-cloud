variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}


variable "fe_subnet" {
  description = "프론트 서브넷"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}

variable "be_subnet" {
  description = "백 서브넷"
  type = object({
    cidr = string
    az   = string
    name = string
  })
}