locals {
  # This is a map in a local
  my_regions = {
    primary   = "us-east-1"
    secondary = "us-west-2"
  }

  is_production = var.environment == "prod"
}
