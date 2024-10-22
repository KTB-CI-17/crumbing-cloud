variable "ecr_fe_name" {
  description = "ECR 리포지토리 이름 - 프론트엔드"
  type        = string
}

variable "ecr_be_name" {
  description = "ECR 리포지토리 이름 - 백엔드"
  type        = string
}

variable "ecr_fe_tag" {
  description = "ECR 태그 변경 여부 - 프론트엔드"
  type        = string
}

variable "ecr_be_tag" {
  description = "ECR 태그 변경 여부 - 백엔드"
  type        = string
}

variable "ecr_scan" {
  description = "ECR 태그 변경 여부 - 백엔드"
  type        = bool
}
