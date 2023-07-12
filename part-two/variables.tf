variable "region" {
  type        = string
  description = "AWS Region to deploy to"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Environment to deploy to"
}

variable "business_unit" {
  type        = string
  description = "Business unit responsible for the project"
}

variable "owners_email" {
  type        = string
  description = "Email address of the project owner"
}

variable "hyde_security_contact" {
  type        = string
  description = "Email address of the Hyde Security contact"
}

variable "iac" {
  type        = string
  description = "Name of the IaC tool used to deploy the project"
}

locals {
  default_tags = {
    Name                  = "${var.project_name}-${var.environment}"
    iac                   = var.iac
    environment           = var.environment
    business-unit         = var.business_unit
    owners-email          = var.owners_email
    hyde-security-contact = var.hyde_security_contact
  }
}
