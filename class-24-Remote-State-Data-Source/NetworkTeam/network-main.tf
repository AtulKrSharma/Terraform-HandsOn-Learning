

locals {
  my_region = "us-east-1"
}

provider "aws" {
  region = local.my_region
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

output "eip_address" {
  value = aws_eip.lb.public_ip

}