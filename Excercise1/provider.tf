terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}
provider "aws" {
  region = "ap-south-1"
}
 
resource "aws_s3_bucket" "minfy_bucket" {
  bucket = "minfy-training-yashwanth-s3-1599"
}

