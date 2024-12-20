terraform {
  backend "s3" {
    bucket          = "ktb-cruming-terraform"
    key             = "terraform.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "terraform-lock-table"
    encrypt         = true
    profile         = "ktb-cruming"
#     versioning      = true
  }
}

provider "aws" {
  region  = var.region
  profile = "ktb-cruming"
}

module "vpc" {
  source  = "./modules/vpc"
  cidr    = var.vpc_cidr
  name    = var.vpc_name
}

module "internet_gateway" {
  source  = "./modules/internet_gateway"
  vpc_id  = module.vpc.vpc_id
  name    = var.igw_name
}

module "subnet" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "nat_instance" {
  source            = "./modules/nat_instance"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.subnet.public_subnet_ids[0]
  ami               = var.nat_ami
  instance_type     = var.instance_public_type
  key_name          = var.key_name
  name              = var.nat_name
  sg_name           = var.nat_sg_name
  ingress           = var.nat_ingress
  egress            = var.sg_egress
}

module "route_table" {
  source                    = "./modules/route_table"
  vpc_id                    = module.vpc.vpc_id
  igw_id                    = module.internet_gateway.igw_id
  nat_network_interface_id  = module.nat_instance.nat_network_interface_id
  public_subnet_ids         = module.subnet.public_subnet_ids
  private_subnet_ids        = module.subnet.private_subnet_ids
  cidr                      = var.route_table_cidr_blocks
  route_table_public_name   = var.route_table_public_name
  route_table_private_name  = var.route_table_private_name
}

module "security_group" {
  source          = "./modules/security_group"
  vpc_id          = module.vpc.vpc_id
  master_name     = var.sg_master_name
  master_ingress  = var.sg_master_ingress
  worker_name     = var.sg_worker_name
  worker_ingress  = var.sg_worker_ingress
  bastion_name    = var.sg_bastion_name
  bastion_ingress = var.sg_bastion_ingress
  nfs_name        = var.sg_nfs_name
  nfs_ingress     = var.sg_nfs_ingress
  egress          = var.sg_egress
}

module "instance" {
  source                      = "./modules/instance"
  ami                         = var.ami
  instance_public_type        = var.instance_public_type
  instance_master_node_type   = var.instance_master_node_type
  instance_node_type          = var.instance_node_type
  instance_ai_type            = var.instance_ai_type
  instance_nfs_type           = var.instance_nfs_type
  key_name                    = var.key_name

  public_instances = {
    bastion = {
      subnet_id           = module.subnet.public_subnet_ids[0]
      security_group_ids  = [module.security_group.sg_bastion_id]
      instance_name       = var.instance_bastion_name
      associate_public_ip = true
    }
  }

  private_instances = {
    master = {
      subnet_id          = module.subnet.private_subnet_ids[0]
      security_group_ids = [module.security_group.sg_master_id]
      instance_name      = var.instance_master_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    worker-1 = {
      subnet_id          = module.subnet.private_subnet_ids[0]
      security_group_ids = [module.security_group.sg_worker_id]
      instance_name      = var.instance_worker_1_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    worker-2 = {
      subnet_id          = module.subnet.private_subnet_ids[1]
      security_group_ids = [module.security_group.sg_worker_id]
      instance_name      = var.instance_worker_2_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    worker-3 = {
      subnet_id          = module.subnet.private_subnet_ids[0]
      security_group_ids = [module.security_group.sg_worker_id]
      instance_name      = var.instance_worker_3_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    worker-4 = {
      subnet_id          = module.subnet.private_subnet_ids[1]
      security_group_ids = [module.security_group.sg_worker_id]
      instance_name      = var.instance_worker_4_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    worker-5 = {
      subnet_id          = module.subnet.private_subnet_ids[1]
      security_group_ids = [module.security_group.sg_worker_id]
      instance_name      = var.instance_worker_5_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    worker-ai = {
      subnet_id           = module.subnet.private_subnet_ids[0]
      security_group_ids  = [module.security_group.sg_worker_id]
      instance_name       = var.instance_worker_ai_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
    nfs = {
      subnet_id          = module.subnet.private_subnet_ids[1]
      security_group_ids = [module.security_group.sg_nfs_id]
      instance_name      = var.instance_nfs_name
      volume_size        = var.volume_size
      volume_type        = var.volume_type
    }
  }
}

module "s3" {
  source        = "./modules/s3"

  bucket_names  = {
    app = var.s3_app_name
  }
}
