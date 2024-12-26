variable "vpc_id" {
  description = "VPC의 ID"
  type        = string
}

variable "master_name" {
  description = "마스터 보안 그룹 이름"
  type        = string
}

variable "master_ingress" {
  description = "마스터 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "worker_name" {
  description = "워커 보안 그룹 이름"
  type        = string
}

variable "worker_ingress" {
  description = "워커 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "bastion_name" {
  description = "bastion 보안 그룹 이름"
  type        = string
}

variable "bastion_ingress" {
  description = "bastion 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "nfs_name" {
  description = "nfs 보안 그룹 이름"
  type        = string
}

variable "nfs_ingress" {
  description = "NFS 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "db_name" {
  description = "db 보안 그룹 이름"
  type        = string
}

variable "egress" {
  description = "모든 이그레스 규칙"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}
