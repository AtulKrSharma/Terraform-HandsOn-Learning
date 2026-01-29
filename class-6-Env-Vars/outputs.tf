output "application_port" {
  value = var.app_port
}

output "map_list" {
  value = {
    "map" : var.student,
    "list" : var.fruits

  }

}
