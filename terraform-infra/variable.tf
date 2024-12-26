variable "region" {
  description = "AWS 리전"
  type        = string
}



# VPC
variable "vpc_cidr" {
  description = "VPC의 CIDR 블록"
  type        = string
}

variable "vpc_name" {
  description = "VPC 이름"
  type        = string
}



# Internet Gateway
variable "igw_name" {
  description = "인터넷 게이트웨이 이름"
  type        = string
}



# Subnet
variable "subnets" {
  description = "서브넷 설정 목록"
  type = map(object({
    az   = string
    cidr = string
    name = string
  }))
}



# Nat Instance
variable "nat_name" {
  description = "NAT 이름"
  type        = string
}

variable "nat_sg_name" {
  description = "NAT 보안그룹 이름"
  type        = string
}

variable "nat_ami" {
  description = "NAT AMI"
  type        = string
}

variable "nat_ingress" {
  description = "nat 인그레스 규칙"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}



# Route Table
variable "route_table_cidr_blocks" {
  description = "라우트 cidr"
  type        = list(string)
}

variable "route_table_public_name" {
  description = "퍼블릭 라우트 테이블 이름"
  type        = string
}

variable "route_table_private_name" {
  description = "프라이빗 라우트 테이블 이름"
  type        = string
}



# Security Group
variable "sg_master_name" {
  description = "마스터 보안 그룹 이름"
  type        = string
}

variable "sg_worker_name" {
  description = "워커 보안 그룹 이름"
  type        = string
}

variable "sg_bastion_name" {
  description = "배스천 호스트 보안 그룹 이름"
  type        = string
}

variable "sg_nfs_name" {
  description = "NFS 보안 그룹 이름"
  type        = string
}

variable "sg_db_name" {
  description = "DB 보안 그룹 이름"
  type        = string
}


variable "sg_bastion_ingress" {
  description = "배스천 호스트 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_master_ingress" {
  description = "마스터 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_worker_ingress" {
  description = "워커 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_nfs_ingress" {
  description = "NFS 인그레스 규칙"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_egress" {
  description = "이그레스 규칙"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}



# Instance
variable "ami" {
  description = "인스턴스의 AMI ID"
  type        = string
}

variable "instance_public_type" {
  description = "퍼블릭 인스턴스 유형"
  type        = string
}

variable "instance_master_node_type" {
  description = "마스터 노드 인스턴스 유형"
  type        = string
}

variable "instance_node_type" {
  description = "워커 노드 인스턴스 유형"
  type        = string
}

variable "instance_ai_type" {
  description = "ai 인스턴스 유형"
  type        = string
  default     = "t3.medium"
}

variable "instance_nfs_type" {
  description = "nfs 인스턴스 유형"
  type        = string
}

variable "key_name" {
  description = "SSH 키 이름"
  type        = string
  default     = "aws-ktb-key"
}

variable "volume_size" {
  description = "볼륨 크기"
  type        = number
}

variable "volume_type" {
  description = "볼륨 타입"
  type        = string
}

variable "instance_bastion_name" {
  description = "배스천 인스턴스 이름"
  type        = string
}

variable "instance_master_name" {
  description = "마스터 인스턴스 이름"
  type        = string
}

variable "instance_worker_1_name" {
  description = "워커 1 인스턴스 이름"
  type        = string
}

variable "instance_worker_2_name" {
  description = "워커 2 인스턴스 이름"
  type        = string
}

variable "instance_worker_3_name" {
  description = "워커 3 인스턴스 이름"
  type        = string
}

variable "instance_worker_4_name" {
  description = "워커 4 인스턴스 이름"
  type        = string
}

variable "instance_worker_5_name" {
  description = "워커 5 인스턴스 이름"
  type        = string
}

variable "instance_worker_ai_name" {
  description = "워커 ai 인스턴스 이름"
  type        = string
  default     = "ktb-cruming-ai"
}

variable "instance_nfs_name" {
  description = "nfs 인스턴스 이름"
  type        = string
}


variable "s3_app_name" {
  description = "앱 전용 s3 이름"
  type        = string
}

# RDS(Subnet Group)
variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}



# RDS(Instance)
variable "db_allocated_storage" {
  description = "The allocated storage for the DB instance"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "The maximum allocated storage for the DB instance"
  type        = number
}

variable "db_engine" {
  description = "The database engine"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the DB instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The username for the DB instance"
  type        = string
}

variable "db_username" {
  description = "The username for the DB instance"
  type        = string
}

variable "db_password" {
  description = "The password for the DB instance"
  type        = string
}

variable "db_parameter_group_name" {
  description = "The DB parameter group name"
  type        = string
}

variable "db_instance_name" {
  description = "The name of the DB instance"
  type        = string
}