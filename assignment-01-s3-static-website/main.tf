
resource "aws_s3_bucket" "s3_bucket_yashwanth_1599" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}
resource "aws_s3_bucket_public_access_block" "S3_Public" {
  bucket = aws_s3_bucket.s3_bucket_yashwanth_1599.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.s3_bucket_yashwanth_1599.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
data "aws_iam_policy_document" "public_read" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket_yashwanth_1599.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "public_policy" {

  bucket = aws_s3_bucket.s3_bucket_yashwanth_1599.id
  policy = data.aws_iam_policy_document.public_read.json
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.s3_bucket_yashwanth_1599.id
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
  etag         = filemd5("${path.module}/index.html")
}
