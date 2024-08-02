terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }

  backend "s3" {
    bucket = "devopspractice9"
    key    = "provisioner"
    region = "us-east-1"
    dynamodb_table = "devopspractice9"
  }
}

provider "aws" {
  region = "us-east-1"
}