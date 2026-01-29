terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "db_password" {
  type = string
  sensitive = true

  validation {
    condition = length(var.db_password) >= 12
    error_message = "Length of Database Password must be equal to or greater than 12 characters"
  }
}


variable "environment" {
  type        = string
  description = "Deployment environment name"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}


variable "my_object" {
  type = object({
    Main = string,
    Tu   = string,
    Dost = bool,
    # Age  = number
  })
  default = {
    Main = "Atul",
    Tu   = "Manju",
    Age  = 14
    Dost = true
  }
}

output "my_object_output" {
  value = var.my_object
  
}