provider "aws" {
  region = var.region
  profile = "ktb-cruming"
}

module "vpc" {
  source   = "./modules/vpc"
  cidr_block = var.vpc_cidr
  name     = var.vpc_name
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  name   = var.igw_name
}

module "subnet" {
  source          = "./modules/subnet"
  vpc_id          = module.vpc.vpc_id
  fe_subnet = var.fe_subnet
  be_subnet = var.be_subnet
}

module "nat_gateway" {
  source    = "./modules/nat_gateway"
  temp_subnet_id = module.subnet.temp_subnet_id
  name      = var.nat_name
}

module "route_table" {
  source                   = "./modules/route_table"
  vpc_id                   = module.vpc.vpc_id
  igw_id               = module.internet_gateway.igw_id
  nat_gateway_id           = module.nat_gateway.nat_gateway_id
  temp_subnet_id         = module.subnet.temp_subnet_id
  fe_subnet_id         = module.subnet.fe_subnet_id
  be_subnet_id       = module.subnet.be_subnet_id
  fe_route_table_name  = var.fe_route_table_name
  be_route_table_name = var.be_route_table_name
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  name_fe   = var.sg_name_fe
  ingress_fe = var.ingress_fe
  name_be   = var.sg_name_be
  ingress_be = var.ingress_be
  egress  = var.egress
}

module "instance" {
  source                  = "./modules/instance"
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  temp_subnet_id        = module.subnet.temp_subnet_id
  fe_subnet_id        = module.subnet.fe_subnet_id
  be_subnet_id       = module.subnet.be_subnet_id
  fe_security_group_id    = module.security_group.security_group_id-fe
  be_security_group_id    = module.security_group.security_group_id-be
  instance_public_count   = var.instance_public_count
  instance_private_count  = var.instance_private_count
  public_name             = var.fe_instance_name
  private_name            = var.be_instance_name
}