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

data "aws_ec2_instance_type" "my_instance_type" {
  instance_type = "t3.micro"
}

# resource "aws_instance" "mine_ec2" {
#   ami           = "ami-07ff62358b87c7116"
#   instance_type = "t3.micro"
#   lifecycle {

#     precondition {
#       condition     = data.aws_ec2_instance_type.my_instance_type.free_tier_eligible
#       error_message = "Sorry, it's not free tier"
#     }

#     postcondition {
#       condition     = self.availability_zone == null
#       error_message = "sorry"
#     }
#     postcondition {
#       condition     = self.public_dns == ""
#       error_message = "Public IPV4 or DNS is mandatory for this server"
#     }
#   }
# }



output "default_vcpus" {
  value = data.aws_ec2_instance_type.my_instance_type.default_vcpus
  precondition {
    condition     = data.aws_ec2_instance_type.my_instance_type.default_vcpus >= 11
    error_message = "Sorry, it's not free tier"
  }
}
