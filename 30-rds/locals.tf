locals {
  name = "${var.project}-${var.environment}"

  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }

  db_tags = merge(
    local.common_tags,
    {
      Component = "mysql"
      Name      = "${local.name}-mysql"
    }
  )
}
