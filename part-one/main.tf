terraform {
  required_providers {
    # AWS Provider - give us access to the AWS resources
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.29.0"
    }
  }
}

# Configures the AWS Provider - sets default region
provider "aws" {
  region = "eu-west-1"
}

# Random pet resource - provides a unique, random string to use as a prefix or suffix for other resources
resource "random_pet" "example" {
  length = 2
}

# S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "hyde-tf-workshop-${random_pet.example.id}"
}

# S3 bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# S3 bucket Access Control List (ACL)
resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"
}
