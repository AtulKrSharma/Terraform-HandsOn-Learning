terraform {
  required_version = "~>1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

provider "aws" {
  # Configuration options
  region = "us-west-1"
  alias  = "western1"
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
  alias  = "western2"
}

resource "aws_instance" "ec2" {
  ami           = "ami-07ff62358b87c7116"
  #provider      = aws.western
  instance_type = "t3.micro"
  tags = {
    Name = "ec2_name"
  }
}
