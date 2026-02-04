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



module "network" {
  source = "./modules/network"
  
}

output "my_sg_Name_from_child" {
  value = module.network.my_sg_Name
}
