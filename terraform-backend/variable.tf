variable "region" {
  description = "AWS region"
  type        = string
}

variable "state_bucket_name" {
  description = "S3 버킷 이름 (Terraform 상태 파일 저장용)"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB 테이블 이름 (상태 잠금용)"
  type        = string
}