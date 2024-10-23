# Region
region = "ap-northeast-2"


# VPC
vpc_cidr = "192.168.0.0/16"
vpc_name = "ktb-cruming-vpc"


# Internet Gateway
igw_name = "ktb-cruming-igw"


# Subnet
subnet_fe = {
    cidr = "192.168.2.0/24"
    az   = "ap-northeast-2a"
    name = "ktb-cruming-subnet-fe"
}

subnet_be = {
    cidr = "192.168.3.0/24"
    az   = "ap-northeast-2c"
    name = "ktb-cruming-subnet-be"
}


# Nat Gateway
nat_name = "ktb-cruming-nat"



# Route Table
route_table_private_name = "ktb-cruming-rt-private"



# Security Group
sg_fe_name = "ktb-cruming-sg-fe"
sg_be_name = "ktb-cruming-sg-be"

ingress_fe = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
]

ingress_be = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
]

egress = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}



# Instance
ami           = "ami-062cf18d655c0b1e8"
instance_type = "t3.medium"
key_name      = "ktb-cruming-key"

instance_public_count  = 1
instance_private_count = 2

instance_fe_name = "ktb-cruming-fe"
instance_be_name = "ktb-cruming-be"

# S3
s3_app_name = "ktb-cruming-app"
s3_terraform_name = "ktb-cruming-terraform"