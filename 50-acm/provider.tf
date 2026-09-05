terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "81s-remote-state-dev-hyd"
    key    = "roboshop-dev-acm"
    region = "us-east-1"
    dynamodb_table = "81s-locking-dev-hyd"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}