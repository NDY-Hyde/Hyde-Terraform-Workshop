
# Lambda function using the comunity lambda module.
module "lambda_function" {
  count = var.instance_count

  source = "terraform-aws-modules/lambda/aws"

  function_name         = "my-lambda-${count.index}"
  description           = "My awesome lambda function"
  handler               = "index.lambda_handler"
  runtime               = "python3.9"
  source_path           = "./my_lambda_function/lambda_function.py"
  environment_variables = var.lambda_environment_variables[count.index]

  tags = var.default_tags
}

