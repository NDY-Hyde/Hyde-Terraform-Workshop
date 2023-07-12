# Zip the lambda code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "my_lambda_function"
  output_path = "my_lambda_function/lambda_function_payload.zip"
}

# S3 object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.name.id
  key    = "lambda_function_payload.zip"
  source = "my_lambda_function/lambda_function_payload.zip"
  tags   = local.default_tags
}

# Lambda function
resource "aws_lambda_function" "example" {
  function_name    = "hyde-tf-workshop-lambda-${random_pet.this.id}"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  s3_bucket        = aws_s3_bucket.name.id
  s3_key           = aws_s3_object.object.key
  runtime          = "python3.8"
  tags             = local.default_tags
}

# IAM role for Lambda function
resource "aws_iam_role" "iam_for_lambda" {
  name = "hyde-tf-workshop-lambda-role-${random_pet.this.id}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = local.default_tags
}

# Lambda function URL resource
resource "aws_lambda_function_url" "example" {
  function_name      = aws_lambda_function.example.function_name
  authorization_type = "NONE"
}
