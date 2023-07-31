terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.10.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" 
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "VPC-18"
  cidr = "10.0.0.0/16"
  public_subnets = {
    "us-east-1a" = "10.0.1.0/24"
  }
  private_subnets = {
    "us-east-1b" = "10.0.3.0/24"
  }
}

module "ec2" {
  source = "./modules/ec2"

  ami = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"
  instances = {
    "my-instance-public" = module.vpc.public_subnet_ids["us-east-1a"]
    "my-instance-private" = module.vpc.private_subnet_ids["us-east-1b"]
  }
}
