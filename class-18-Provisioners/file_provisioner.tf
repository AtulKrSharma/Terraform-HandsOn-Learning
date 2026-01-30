resource "aws_instance" "mine_ec122" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  # this key is important
  vpc_security_group_ids = [aws_security_group.my_sg1.id]
  tags = {
    Name = "mine_ec122"
  }
  key_name = "tf_key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./tf_key.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "./server_ip_ec1.txt"
    destination = "/tmp/server_ip_ec1.txt"
    on_failure  = fail
  }
}

data "aws_vpc" "main" {
  default = true
}

resource "aws_security_group" "my_sg1" {
  name        = "my_sg_name"
  description = "Allow TLS inbound traffic at 80 and all outbound traffic"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "my_sg_tag"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_80_http" {
  security_group_id = aws_security_group.my_sg1.id
  cidr_ipv4         = "0.0.0.0/0" #data.aws_vpc.main.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_22_ssh" {
  security_group_id = aws_security_group.my_sg1.id
  cidr_ipv4         = "0.0.0.0/0" #data.aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_all" {
  security_group_id = aws_security_group.my_sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports


}
