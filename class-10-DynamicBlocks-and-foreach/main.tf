resource "aws_instance" "mine_ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  # this key is important
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  tags = {
    Name = "mine_ec2"
  }
  user_data = file("${path.module}/user_data.sh")
}




resource "aws_security_group" "demo_sg" {
  name        = "sample-sg"
  vpc_id      = data.aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.my_dynamic_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.my_protocol
      cidr_blocks = var.my_cidr_block
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.my_cidr_block
  }

  # ingress {
  #   from_port   = 8201
  #   to_port     = 8201
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 8300
  #   to_port     = 8300
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 9200
  #   to_port     = 9200
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 9500
  #   to_port     = 9500
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
}