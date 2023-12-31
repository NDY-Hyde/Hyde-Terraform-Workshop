terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.63"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
