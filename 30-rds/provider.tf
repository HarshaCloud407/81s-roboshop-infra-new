terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }

  backend "s3" {
    bucket = "81s-remote-state-dev-hyd"
    key    = "roboshop-dev-rds"
    region = "us-east-1"
    dynamodb_table = "81s-locking-dev-hyd"
  }
}

provider "aws" {
  region = "us-east-1"
}