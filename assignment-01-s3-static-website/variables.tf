variable "bucket_name" {
  description = " unique name for S3 bucket"
  type        = string
  default     = "day2-static-site-yashwanth-2003"  
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
  type        = string
}

variable "aws_profile" {
  description = "AWS profile to use"
  default     = "AdminAccess-738232692277"
  type        = string
}
