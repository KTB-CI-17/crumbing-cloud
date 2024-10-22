# Region
region = "ap-northeast-2"


# VPC
vpc_cidr = "192.168.0.0/16"
vpc_name = "ktb_cruming_vpc"


# Internet Gateway
igw_name = "ktb-cruming-igw"


# Subnet
fe_subnet = {
    cidr = "192.168.2.0/24"
    az   = "ap-northeast-2a"
    name = "ktb_cruming_fe_subnet"
}

be_subnet = {
    cidr = "192.168.3.0/24"
    az   = "ap-northeast-2c"
    name = "ktb_cruming_be_subnet"
}


# Nat Gateway
nat_name = "ktb-cruming-nat"



# Route Table
fe_route_table_name  = "ktb-cruming-fe-rt"
be_route_table_name = "ktb-cruming-be-rt"


# Security Group
sg_name_fe = "ktb-cruming-sg_fe"
sg_name_be = "ktb-cruming-sg_be"

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
ami                    = "ami-062cf18d655c0b1e8"
instance_type          = "t3.medium"
key_name               = "ktb-cruming-key"

instance_public_count  = 1
instance_private_count = 2

fe_instance_name = "ktb-cruming-fe"
be_instance_name = "ktb-cruming-be"