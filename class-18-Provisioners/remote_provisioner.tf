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

resource "aws_instance" "mine_ec22" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  # this key is important
  vpc_security_group_ids = [aws_security_group.my_sg1.id]
  tags = {
    Name = "mine_ec22"
  }
  key_name = "tf_key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/tf_key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    when = create
    //Heredoc syntax
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}

