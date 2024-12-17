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
sg_nfs_name     = "ktb-cruming-sg-nfs"

sg_bastion_ingress = [
  {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Http - test"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Https - test"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "nginx - test"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  },
]

sg_master_ingress = [
  {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  },
]

sg_worker_ingress = [
  {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  },
]

sg_nfs_ingress = [
  {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  },
]
#
#sg_master_ingress = [
#  # Kubernetes API Server
#  {
#    description = "Kubernetes API Server"
#    from_port   = 6443
#    to_port     = 6443
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # etcd server client API
#  {
#    description = "etcd server client API"
#    from_port   = 2379
#    to_port     = 2380
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # kubelet API
#  {
#    description = "kubelet API"
#    from_port   = 10250
#    to_port     = 10250
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # kube-scheduler API
#  {
#    description = "kube-scheduler API"
#    from_port   = 10259
#    to_port     = 10259
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # kube-controller-manager API
#  {
#    description = "kube-controller-manager API"
#    from_port   = 10257
#    to_port     = 10257
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # Kubernetes Controller Manager Health
#  {
#    description = "kube-controller-manager Health API"
#    from_port   = 10258
#    to_port     = 10258
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # Flannel VXLAN UDP
#  {
#    description = "Flannel VXLAN UDP"
#    from_port   = 8472
#    to_port     = 8472
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # DNS Service - UDP
#  {
#    description = "DNS Service - udp"
#    from_port   = 53
#    to_port     = 53
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # DNS Service - TCP
#  {
#    description = "DNS Service - tcp"
#    from_port   = 53
#    to_port     = 53
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # NodePort Range
#  {
#    description = "NodePort Services"
#    from_port   = 30000
#    to_port     = 32767
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # Ingress Controller Liveness/Readiness Probe
#  {
#    description = "Ingress Controller Liveness/Readiness"
#    from_port   = 10254
#    to_port     = 10254
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # NFS - TCP
#  {
#    description = "NFS - TCP"
#    from_port   = 2049
#    to_port     = 2049
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # NFS rpcbind - TCP and UDP
#  {
#    description = "NFS rpcbind - TCP"
#    from_port   = 111
#    to_port     = 111
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  {
#    description = "NFS rpcbind - UDP"
#    from_port   = 111
#    to_port     = 111
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # NFS statd - TCP and UDP
#  {
#    description = "NFS statd - TCP"
#    from_port   = 662
#    to_port     = 662
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  {
#    description = "NFS statd - UDP"
#    from_port   = 662
#    to_port     = 662
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # NFS mountd - TCP and UDP
#  {
#    description = "NFS mountd - TCP"
#    from_port   = 892
#    to_port     = 892
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  {
#    description = "NFS mountd - UDP"
#    from_port   = 892
#    to_port     = 892
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # AWS Load Balancer Controller Metrics
#  {
#    description = "AWS Load Balancer Controller Metrics"
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # ICMP (Ping)
#  {
#    description = "ICMP (Ping)"
#    from_port   = -1
#    to_port     = -1
#    protocol    = "icmp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # HTTP
#  {
#    description = "Http - test"
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#
#  # HTTPS
#  {
#    description = "Https - test"
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#]
#
#sg_worker_ingress = [
#  # Kubernetes API Server
#  {
#    description = "Kubernetes API Server"
#    from_port   = 6443
#    to_port     = 6443
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # etcd server client API
#  {
#    description = "etcd server client API"
#    from_port   = 2379
#    to_port     = 2380
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # kubelet API
#  {
#    description = "kubelet API"
#    from_port   = 10250
#    to_port     = 10250
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # kube-scheduler API
#  {
#    description = "kube-scheduler API"
#    from_port   = 10259
#    to_port     = 10259
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # kube-controller-manager API
#  {
#    description = "kube-controller-manager API"
#    from_port   = 10257
#    to_port     = 10257
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # NodePort Services
#  {
#    description = "NodePort Services"
#    from_port   = 30000
#    to_port     = 32767
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # Flannel VXLAN UDP
#  {
#    description = "Flannel VXLAN UDP"
#    from_port   = 8472
#    to_port     = 8472
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # DNS Service - udp
#  {
#    description = "DNS Service - udp"
#    from_port   = 53
#    to_port     = 53
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # DNS Service - tcp
#  {
#    description = "DNS Service - tcp"
#    from_port   = 53
#    to_port     = 53
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # Ingress Controller Liveness/Readiness Probe
#  {
#    description = "Ingress Controller Liveness/Readiness"
#    from_port   = 10254
#    to_port     = 10254
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # AWS Load Balancer Controller Metrics
#  {
#    description = "AWS Load Balancer Controller Metrics"
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # NFS TCP
#  {
#    description = "NFS TCP port 2049"
#    from_port   = 2049
#    to_port     = 2049
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # NFS UDP
#  {
#    description = "NFS UDP port 2049"
#    from_port   = 2049
#    to_port     = 2049
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # rpcbind TCP
#  {
#    description = "rpcbind TCP port 111"
#    from_port   = 111
#    to_port     = 111
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # rpcbind UDP
#  {
#    description = "rpcbind UDP port 111"
#    from_port   = 111
#    to_port     = 111
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # statd TCP
#  {
#    description = "statd TCP port 662"
#    from_port   = 662
#    to_port     = 662
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # statd UDP
#  {
#    description = "statd UDP port 662"
#    from_port   = 662
#    to_port     = 662
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # mountd TCP
#  {
#    description = "mountd TCP port 875"
#    from_port   = 875
#    to_port     = 875
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # mountd UDP
#  {
#    description = "mountd UDP port 875"
#    from_port   = 875
#    to_port     = 875
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # rquotad TCP
#  {
#    description = "rquotad TCP port 892"
#    from_port   = 892
#    to_port     = 892
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # rquotad UDP
#  {
#    description = "rquotad UDP port 892"
#    from_port   = 892
#    to_port     = 892
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # ICMP (Ping)
#  {
#    description = "ping"
#    from_port   = -1
#    to_port     = -1
#    protocol    = "icmp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # HTTP
#  {
#    description = "Http - test"
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # HTTPS
#  {
#    description = "Https - test"
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  }
#]
#
#sg_nfs_ingress = [
#  # NFS TCP
#  {
#    description = "NFS TCP port 2049"
#    from_port   = 2049
#    to_port     = 2049
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # NFS UDP
#  {
#    description = "NFS UDP port 2049"
#    from_port   = 2049
#    to_port     = 2049
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # RPC TCP
#  {
#    description = "RPC TCP port 111"
#    from_port   = 111
#    to_port     = 111
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # RPC UDP
#  {
#    description = "RPC UDP port 111"
#    from_port   = 111
#    to_port     = 111
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # rquotad TCP
#  {
#    description = "rquotad TCP port 892"
#    from_port   = 892
#    to_port     = 892
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # rquotad UDP
#  {
#    description = "rquotad UDP port 892"
#    from_port   = 892
#    to_port     = 892
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # mountd TCP
#  {
#    description = "mountd TCP port 875"
#    from_port   = 875
#    to_port     = 875
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # mountd UDP
#  {
#    description = "mountd UDP port 875"
#    from_port   = 875
#    to_port     = 875
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # statd TCP
#  {
#    description = "statd TCP port 662"
#    from_port   = 662
#    to_port     = 662
#    protocol    = "tcp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # statd UDP
#  {
#    description = "statd UDP port 662"
#    from_port   = 662
#    to_port     = 662
#    protocol    = "udp"
#    cidr_blocks = ["10.0.0.0/16"]
#  },
#  # ICMP (ping)
#  {
#    description = "ping"
#    from_port   = -1
#    to_port     = -1
#    protocol    = "icmp"
#    cidr_blocks = ["10.0.0.0/16"]
#  }
#]

sg_egress = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}



# Instance
ami                       = "ami-040c33c6a51fd5d96"
instance_public_type      = "t3.micro"
instance_master_node_type = "t3.xlarge"
instance_node_type        = "t3.large"
instance_nfs_type         = "t3.small"

key_name              = "ktb-cruming-key"
volume_size           = 30
volume_type           = "gp3"

instance_bastion_name   = "ktb-cruming-bastion"
instance_master_name    = "ktb-cruming-master"
instance_worker_1_name  = "ktb-cruming-worker-1"
instance_worker_2_name  = "ktb-cruming-worker-2"
instance_worker_3_name  = "ktb-cruming-worker-3"
instance_worker_4_name  = "ktb-cruming-worker-4"
instance_worker_ai_name = "ktb-cruming-worker-ai"
instance_nfs_name       = "ktb-cruming-nfs"

# S3
s3_app_name = "ktb-cruming-app"
