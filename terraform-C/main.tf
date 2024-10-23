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
  route_table_private_name  = var.route_table_private_name
}

module "security_group" {
  source      = "./modules/security_group"
  vpc_id      = module.vpc.vpc_id
  name_fe     = var.sg_fe_name
  ingress_fe  = var.ingress_fe
  name_be     = var.sg_be_name
  ingress_be  = var.ingress_be
  egress      = var.egress
}

module "instance" {
  source                  = "./modules/instance"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  public_instances = {
    temp = {
      subnet_id           = module.subnet.subnet_temp_id
      security_group_ids  = [module.security_group.sg_fe_id]
      instance_name       = "temp_instance"
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
  }
}

module "s3" {
  source        = "./modules/s3"

  bucket_names  = {
    app = var.s3_app_name
    terraform = var.s3_terraform_name
  }
}