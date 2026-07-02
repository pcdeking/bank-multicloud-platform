module "networking" {
  source = "../../modules/networking"

  environment = "dev"

  vpc_cidr = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnets = [
    "10.0.10.0/24",
    "10.0.20.0/24"
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}

module "security" {
  source = "../../modules/security"

  environment = "dev"
  vpc_id      = module.networking.vpc_id
}

module "ecr" {
  source = "../../modules/ecr"

  environment = "dev"
}

module "eks" {
  source = "../../modules/eks"

  environment  = "dev"
  cluster_name = "dev-bank-cluster"

  private_subnet_ids = module.networking.private_subnet_ids

  cluster_sg_id = module.security.cluster_sg_id
}