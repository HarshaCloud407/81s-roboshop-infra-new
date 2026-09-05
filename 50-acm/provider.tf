terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
<<<<<<< HEAD
    bucket = "81s-remote-state-dev-hyd"
    key    = "roboshop-dev-acm"
    region = "us-east-1"
    dynamodb_table = "81s-locking-dev-hyd"
=======
    bucket = "81s-remote-state-dev"
    key    = "roboshop-dev-acm"
    region = "us-east-1"
    dynamodb_table = "81s-locking-dev"
>>>>>>> 3125dce2369c948575274853b3ccaf8d5ad51485
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}