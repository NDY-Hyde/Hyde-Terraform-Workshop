# Call lambda module from /modules/lambda
module "lambdas" {
  source         = "./modules/lambda"
  instance_count = 1

  lambda_prefix                = random_pet.this.id
  lambda_environment_variables = local.lambda_environemt_variables
  default_tags                 = local.default_tags
}
