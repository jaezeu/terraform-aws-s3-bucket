resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    {
      "ManagedBy" = "terraform"
      "Module"    = "terraform-aws-s3-bucket"
    },
    var.tags
  )
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}