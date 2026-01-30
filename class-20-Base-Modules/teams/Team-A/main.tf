terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.my_region
}

module "ec2_via_module" {
  source = "../../modules/ec2"
  my_ami = var.my_ami
  # my_instance_type = "t3.micro"
  vol_size         = 9
  vol_type         = "gp3"
  del_on_terminate = true
  my_cpu_options = {
    core_count = 1
    #amd_sev_snp      = "enabled"
    threads_per_core = 1
  }
  my_tags = {
    Home1 = var.tags.value1,
    Home2 = var.tags.value11
    Name  = "Atul_ec2"
    Counter = var.tags.counter
  }



}
