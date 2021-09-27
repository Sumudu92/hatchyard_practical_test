
# ===============================================================================
# Terraform Providers
# ===============================================================================
terraform {
  required_version = ">= 0.12.6"

  #backend "s3" {
  # bucket = "backend"
  #  key    = "a2a/terraform_state"
  #  region = "us-east-1"
  #  profile = ""
  #}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }
    random = "~> 2"
  }
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}