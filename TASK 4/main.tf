module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  az_count     = var.az_count
  availability_zones = var.availability_zones
  tags         = var.tags
}

module "networking" {
  source          = "./modules/networking"
  az_count        = var.az_count
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  db_subnets      = module.vpc.db_subnets
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "computing" {
  source        = "./modules/computing"
  vpc_id        = module.vpc.vpc_id
  web_subnets   = module.vpc.public_subnets
  app_subnets   = module.vpc.private_subnets
  web_sg        = module.security.web_sg_id
  app_sg        = module.security.app_sg_id
  key_name      = var.key_name
  instance_type = var.instance_type
  ami_id        = var.ami_id
  user_data     = var.user_data
}

module "alb" {
  source          = "./modules/alb"
  //vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  web_sg          = module.security.web_sg_id
  app_sg          = module.security.app_sg_id
  web_target_arn  = module.computing.web_target_group_arn
  app_target_arn  = module.computing.app_target_group_arn
  tags            = var.tags
  certificate_arn = var.certificate_arn
  enable_https    = var.enable_https
  app_port        = var.app_port
}

module "rds" {
  db_pass    = var.db_pass
  source    = "./modules/rds"
  db_subnets = module.vpc.db_subnets
  db_sg     = module.security.db_sg_id
}
