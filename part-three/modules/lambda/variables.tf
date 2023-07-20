variable "instance_count" {
  type        = number
  description = "(required) number of instances to create"
}

variable "lambda_prefix" {
  type        = string
  description = "(required) prefix for lambda function name"
}

variable "default_tags" {
  type        = map(string)
  description = "(required) map of tags to apply to resources"
}

variable "lambda_environment_variables" {
  type        = list(map(string))
  description = "(required) List of maps of environment variables for each instance"
}


