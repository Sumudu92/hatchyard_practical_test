data "aws_availability_zones" "available" {}


resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.vpc_private_subnet
  public_subnets       = var.vpc_public_subnet
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  
}

