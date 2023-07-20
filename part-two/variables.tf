variable "region" {
  type        = string
  description = "AWS Region to deploy to"
  default     = "eu-west-1"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "hyde-tf-workshop"
}

variable "environment" {
  type        = string
  description = "Environment to deploy to"
  default     = "sandbox"
}

variable "business_unit" {
  type        = string
  description = "Business unit responsible for the project"
  default     = "infrastructure"
}

variable "owners_email" {
  type        = string
  description = "Email address of the project owner"
  default     = "itcloudteam@hyde-housing.co.uk"
}

variable "hyde_security_contact" {
  type        = string
  description = "Email address of the Hyde Security contact"
  default     = "neil.day@hyde-housing.co.uk"
}

variable "iac" {
  type        = string
  description = "Name of the IaC tool used to deploy the project"
  default     = "terraform"
}

locals {
  default_tags = {
    Name                  = "hyde-tf-workshop-sandbox"
    iac                   = "terraform"
    environment           = "sandbox"
    business-unit         = "infrastructure"
    owners-email          = "itcloudteam@hyde-housing.co.uk"
    hyde-security-contact = "neil.day@hyde-housing.co.uk"
  }
}

# locals {
#   default_tags = {
#     Name                  = "${var.project_name}-${var.environment}"
#     iac                   = var.iac
#     environment           = var.environment
#     business-unit         = var.business_unit
#     owners-email          = var.owners_email
#     hyde-security-contact = var.hyde_security_contact
#   }
# }




