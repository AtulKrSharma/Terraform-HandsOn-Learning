resource "aws_instance" "ec2" {
  ami           = var.my_ami
  instance_type = var.my_instance_type
  tags = var.my_tags
  root_block_device {
    volume_size           = var.vol_size
    volume_type           = var.vol_type
    delete_on_termination = var.del_on_terminate
  }
  cpu_options {
    core_count       = var.my_cpu_options.core_count
    amd_sev_snp      = var.my_cpu_options.amd_sev_snp
    threads_per_core = var.my_cpu_options.threads_per_core
  }
}
