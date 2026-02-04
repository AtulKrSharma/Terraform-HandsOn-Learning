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

variable "envs_main" {
  type = string
  default = "-1682-machine"
}

module "network" {
  source = "./modules/network"
  envs_child = var.envs_main
}
#Root → child is always done through module input variables.
