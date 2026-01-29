output "current_date_time" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "vpc_name_tag" {
  value = data.aws_vpc.custom_vpc.tags
}

output "default_vpc_name_tag" {
  value = data.aws_vpc.default_vpc.tags
}