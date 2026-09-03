terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }

  backend "s3" {
    bucket         = "81s-roboshop-dev-hyd"
    key            = "30-rds/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "81s-locking-dev-hyd"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}