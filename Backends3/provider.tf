provider "aws" {
  region = "ap-south-1"
  profile = "AdminAccess-738232692277"

}
 
resource "aws_s3_bucket" "minfy_bucket" {
  bucket = "minfy-training-yashwanth-s3-1599"
}

terraform {
  backend "s3" {
    bucket = "minfy-training-yashwanth-s3-1599"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}