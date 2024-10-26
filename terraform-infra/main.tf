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
  source    = "./modules/subnet"
  vpc_id    = module.vpc.vpc_id
  subnet_fe = var.subnet_fe
  subnet_be = var.subnet_be
  subnet_ai = var.subnet_ai
  subnet_cloud = var.subnet_cloud
}

module "nat_gateway" {
  source          = "./modules/nat_gateway"
  subnet_temp_id  = module.subnet.subnet_temp_id
  name            = var.nat_name
}

module "route_table" {
  source                    = "./modules/route_table"
  vpc_id                    = module.vpc.vpc_id
  igw_id                    = module.internet_gateway.igw_id
  nat_id                    = module.nat_gateway.nat_id
  subnet_temp_id            = module.subnet.subnet_temp_id
  subnet_fe_id              = module.subnet.subnet_fe_id
  subnet_be_id              = module.subnet.subnet_be_id
  subnet_ai_id              = module.subnet.subnet_ai_id
  subnet_cloud_id           = module.subnet.subnet_cloud_id
  route_table_private_name  = var.route_table_private_name
}

module "security_group" {
  source      = "./modules/security_group"
  vpc_id      = module.vpc.vpc_id
  name_fe     = var.sg_fe_name
  ingress_fe  = var.ingress_fe
  name_be     = var.sg_be_name
  ingress_be  = var.ingress_be
  name_ai     = var.sg_ai_name
  ingress_ai  = var.ingress_ai
  name_cloud     = var.sg_cloud_name
  ingress_cloud  = var.ingress_cloud
  egress      = var.egress
}

module "instance" {
  source                  = "./modules/instance"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  public_instances = {
#     temp = {
#       subnet_id           = module.subnet.subnet_temp_id
#       security_group_ids  = [module.security_group.sg_fe_id]
#       instance_name       = "ktb-cruming-temp"
#       associate_public_ip = true
#     }
    cloud = {
      subnet_id           = module.subnet.subnet_cloud_id
      security_group_ids  = [module.security_group.sg_cloud_id]
      instance_name       = "ktb-cruming-temp"
      associate_public_ip = true
    }
  }

  private_instances = {
    fe = {
      subnet_id          = module.subnet.subnet_fe_id
      security_group_ids = [module.security_group.sg_fe_id]
      instance_name      = var.instance_fe_name
    }
    be = {
      subnet_id          = module.subnet.subnet_be_id
      security_group_ids = [module.security_group.sg_be_id]
      instance_name      = var.instance_be_name
    }
    ai = {
      subnet_id           = module.subnet.subnet_ai_id
      security_group_ids  = [module.security_group.sg_ai_id]
      instance_name       = var.instance_ai_name
    }
  }
}

module "s3" {
  source        = "./modules/s3"

  bucket_names  = {
    app = var.s3_app_name
  }
}
