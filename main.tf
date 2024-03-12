module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = "10.1.0.0/16"
  public_subnets     = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnets    = ["10.1.2.0/24", "10.1.3.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
  region             = "us-east-1"
}

module "ec2" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = module.vpc.public_subnet_ids[1]
  key_name        = var.key_name
  vpc_id          = module.vpc.vpc_id
  instance_name   = var.instance_name
  volume_size     = var.volume_size
  ssh_access_cidr = var.ssh_access_cidr
}

module "asg" {
  source     = "./modules/asg"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  ami_id     = var.ami_id
  key_name   = var.key_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "coalfire-poc-${random_id.suffix.hex}"
  tags = {
    "Environment" = "ProofOfConcept"
  }
}

resource "random_id" "suffix" {
  byte_length = 8
}

