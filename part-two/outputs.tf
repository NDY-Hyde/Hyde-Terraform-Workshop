# Outputs
output "bucket" {
  value = aws_s3_bucket.name.id
}

output "lambda_function_url" {
  value = aws_lambda_function_url.example.function_url
}
