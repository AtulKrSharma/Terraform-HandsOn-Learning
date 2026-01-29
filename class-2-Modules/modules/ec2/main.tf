# terraform {
#   required_version = "~>1.14.3"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~>6.28.0"
#     }
#   }
# }

resource "aws_instance" "myEC2" {
  ami                         = var.var_ami
  instance_type               = var.var_instance_type
  region                      = var.var_region
  associate_public_ip_address = var.var_associate_public_ip_address
}
