# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "6.28.0"
#     }
#   }

  # backend "local" {
  #   path = "atul/atul.tfstate"
    
  # }
# }

# provider "aws" {
#   region = "us-east-1"
# }




# data "aws_vpc" "main" {
#   default = true
# }

# resource "aws_security_group" "my_sg" {
#   name        = "my_sg_name"
#   description = "Allow TLS inbound traffic at 80 and all outbound traffic"
#   vpc_id      = data.aws_vpc.main.id

#   tags = {
#     Name = "my_sg_tag"
#   }
# }

