# ami-0ad21ae1d0696ad58

module "networking" {
  source            = "./networking"
  vpc_cidr          = var.vpc_cidr
  vpc_name          = var.vpc_name
  public_subnet     = var.public_subnet
  availability_zone = var.availability_zone
}

module "jenkins" {
  source            = "./jenkins"
  instance_type     = var.instance_type
  key_name          = var.key_name
  ami_id            = var.ami_id
  jenkins_sg        = [module.securitygroups.security_group_id]
  subnet_id         = module.networking.subnet_id_0
  availability_zone = tolist(module.networking.availability_zones)[0]
}


module "apache" {
  source            = "./Apache"
  instance_type     = var.instance_type
  key_name          = var.key_name
  ami_id            = var.ami_id
  apache_sg         = [module.securitygroups.security_group_id]
  subnet_id         = module.networking.subnet_id_1
  availability_zone = tolist(module.networking.availability_zones)[1]

}

module "securitygroups" {
  source = "./securitygroups"
  vpc_id = module.networking.vpc_id
}