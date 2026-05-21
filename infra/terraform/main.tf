terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {
    bucket = "skillsplus-tfstate"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source      = "./modules/vpc"
  project     = var.project
  environment = var.environment
  cidr        = var.vpc_cidr
}

module "eks" {
  source          = "./modules/eks"
  project         = var.project
  environment     = var.environment
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  cluster_version = "1.29"
}

module "rds" {
  source      = "./modules/rds"
  project     = var.project
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
  db_password = var.db_password
}
