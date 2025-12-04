module "vpc" {
  source        = "./modules/vpc"
  vpc_cidr      = var.vpc_cidr
  subnet_cidrs  = var.subnet_cidrs
  subnet_names  = var.subnet_names
}

module "sg" {
  source  = "./modules/sg"
  sg_name = "web-security-group"
  vpc_id  = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.sg.security_group_id
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = "my-application-lb"
  target_group_name = "my-target-group"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.sg.security_group_id
  instance_ids      = module.ec2.instance_ids
}
