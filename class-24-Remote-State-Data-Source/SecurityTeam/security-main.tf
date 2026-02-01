
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }

}


resource "aws_security_group" "allow_tls_ipv4" {
  name        = "allow_tls_ipv4"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_80" {
  security_group_id = aws_security_group.allow_tls_ipv4.id
  cidr_ipv4         = "${data.terraform_remote_state.vpc.outputs.eip_address}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


output my_cidr_ipv4{
 value = aws_vpc_security_group_ingress_rule.allow_tls_80.cidr_ipv4

}