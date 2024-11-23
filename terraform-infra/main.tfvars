# Region
region = "ap-northeast-2"



# VPC
vpc_cidr = "10.0.0.0/16"
vpc_name = "ktb-cruming-vpc"



# Internet Gateway
igw_name = "ktb-cruming-igw"



# Subnet
subnets = {
  public_a = {
    az   = "ap-northeast-2a"
    cidr = "10.0.1.0/24"
    name = "ktb-cruming-subnet-public-a"
  }
  public_c = {
    az   = "ap-northeast-2c"
    cidr = "10.0.2.0/24"
    name = "ktb-cruming-subnet-public-c"
  }
  private_a = {
    az   = "ap-northeast-2a"
    cidr = "10.0.11.0/24"
    name = "ktb-cruming-subnet-private-a"
  }
  private_c = {
    az   = "ap-northeast-2c"
    cidr = "10.0.12.0/24"
    name = "ktb-cruming-subnet-private-c"
  }
}



# Nat Instance
nat_name              = "ktb-cruming-nat-instance"
nat_sg_name           = "ktb-cruming-sg-nat"
nat_ami               = "ami-01ad0c7a4930f0e43"
nat_ingress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  },
]



# Route Table
route_table_public_name   = "ktb-cruming-rt-public"
route_table_private_name  = "ktb-cruming-rt-private"
route_table_cidr_blocks   = ["0.0.0.0/0"]



# Security Group
sg_master_name  = "ktb-cruming-sg-master"
sg_worker_name  = "ktb-cruming-sg-worker"
sg_bastion_name = "ktb-cruming-sg-bastion"

sg_bastion_ingress = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

sg_master_ingress = [
  {
    description = "Kubernetes API Server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  },
  {
    description = "etcd server client API"
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  },
  {
    description = "Flannel VXLAN UDP"
    from_port   = 8472
    to_port     = 8472
    protocol    = "udp"
    cidr_blocks = ["10.0.0.0/16"]
  },
]

sg_worker_ingress = [
  {
    description = "Kubelet API"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  },
  {
    description = "NodePort Services"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  },
  {
    description = "Flannel VXLAN UDP"
    from_port   = 8472
    to_port     = 8472
    protocol    = "udp"
    cidr_blocks = ["10.0.0.0/16"]
  },
]

sg_egress = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}



# Instance
ami                   = "ami-040c33c6a51fd5d96"
instance_public_type  = "t3.micro"
instance_node_type    = "t3.medium"
#instance_ai_type      = "g4dn.xlarge"
key_name              = "ktb-cruming-key"
volume_size           = 30
volume_type           = "gp3"

instance_bastion_name   = "ktb-cruming-bastion"
instance_master_name    = "ktb-cruming-master"
instance_worker_1_name  = "ktb-cruming-worker-1"
instance_worker_2_name  = "ktb-cruming-worker-2"
instance_worker_ai_name = "ktb-cruming-worker-ai"

# S3
s3_app_name = "ktb-cruming-app"
