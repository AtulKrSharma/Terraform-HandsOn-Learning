resource "aws_instance" "mine_ec11" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.small"
  # this key is important
  vpc_security_group_ids = [aws_security_group.my_sg1.id]
  tags = {
    Name = "mine_ec11"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> server_ip_ec1.txt"
  }

}


resource "aws_instance" "mine_ec33" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  # this key is important
  vpc_security_group_ids = [aws_security_group.my_sg1.id]
  tags = {
    Name = "mine_ec33"
  }
  provisioner "local-exec" {
    //Heredoc syntax
    command = <<-EOF
    echo "Instance Created"
    echo "IP: ${self.private_ip}" >> server_ip_ec2.txt
    echo "ID: ${self.id}" >> server_details_ec2.txt
    EOF
    on_failure = continue
  }
   provisioner "local-exec" {
    when = destroy
    //Heredoc syntax
    command = "echo 'Instance Destroyed'"
    on_failure= fail

  }
}

