variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "인스턴스 타입"
  type        = string
}

variable "key_name" {
  description = "SSH 키 이름"
  type        = string
}

variable "public_instances" {
  description = "퍼블릭 인스턴스 설정"
  type = map(object({
    subnet_id            = string
    security_group_ids   = list(string)
    instance_name        = string
    associate_public_ip  = bool
  }))
  default = {}
}

variable "private_instances" {
  description = "프라이빗 인스턴스 설정"
  type = map(object({
    subnet_id          = string
    security_group_ids = list(string)
    instance_name      = string
  }))
}