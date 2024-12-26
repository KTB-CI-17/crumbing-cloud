variable "allocated_storage" {
  description = "DB 인스턴스에 할당된 스토리지"
  type        = number
}

variable "max_allocated_storage" {
  description = "DB 인스턴스에 최대 할당된 스토리지"
  type        = number
}

variable "engine" {
  description = "데이터베이스 엔진"
  type        = string
}

variable "engine_version" {
  description = "데이터베이스 엔진 버전"
  type        = string
}

variable "instance_class" {
  description = "DB 인스턴스 클래스"
  type        = string
}

variable "db_name" {
  description = "데이터베이스 이름"
  type        = string
}

variable "username" {
  description = "데이터베이스 사용자 이름"
  type        = string
}

variable "password" {
  description = "데이터베이스 비밀번호"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "DB 파라미터 그룹 이름"
  type        = string
}

variable "skip_final_snapshot" {
  description = "삭제 전 최종 스냅샷을 건너뛸지 여부"
  type        = bool
}

variable "publicly_accessible" {
  description = "DB 인스턴스를 퍼블릭하게 접근할 수 있는지 여부"
  type        = bool
}

variable "db_subnet_group_name" {
  description = "DB 서브넷 그룹 이름"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "VPC 보안 그룹 ID들의 목록"
  type        = list(string)
}

variable "db_instance_name" {
  description = "DB 인스턴스에 대한 태그 이름"
  type        = string
}
