# S3 bucket
resource "aws_s3_bucket" "name" {
  bucket = "hyde-tf-workshop-${random_pet.this.id}"
  tags   = local.default_tags
}

# S3 bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.name.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# S3 bucket Access Control List (ACL)
resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.name.id
  acl    = "private"
}
