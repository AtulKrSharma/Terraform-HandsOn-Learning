output "current_date_time" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "is_production" {
  value = local.is_production
}
