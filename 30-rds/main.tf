module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "7.2.1"

  identifier = local.name

  # -------------------------
  # Database
  # -------------------------

  engine         = "mysql"
  engine_version = var.db_engine_version

  instance_class = var.db_instance_class

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage

  db_name  = var.db_name
  username = var.db_username

  port = var.db_port

  # Let AWS manage the master password
  manage_master_user_password = true

  # -------------------------
  # Network
  # -------------------------

  create_db_subnet_group = true

  subnet_ids = split(
    ",",
    data.aws_ssm_parameter.private_subnet_ids.value
  )

  vpc_security_group_ids = [
    data.aws_ssm_parameter.mysql_sg_id.value
  ]

  # -------------------------
  # Availability
  # -------------------------

  multi_az = var.db_multi_az

  # -------------------------
  # Storage
  # -------------------------

  storage_encrypted = var.db_storage_encrypted

  # -------------------------
  # Backup
  # -------------------------

  backup_retention_period = 7

  backup_window      = "03:00-04:00"
  maintenance_window = "sun:04:00-sun:05:00"

  # -------------------------
  # Parameter Group
  # -------------------------

  create_db_parameter_group = true

  family = "mysql8.0"

  # -------------------------
  # Option Group
  # -------------------------

  create_db_option_group = true

  major_engine_version = "8.0"

  # -------------------------
  # Monitoring
  # -------------------------

  monitoring_interval = 0

  # -------------------------
  # Protection
  # -------------------------

  deletion_protection = var.db_deletion_protection
  skip_final_snapshot = var.db_skip_final_snapshot

  # -------------------------
  # Tags
  # -------------------------

  tags = local.db_tags
}


# =========================================================
# Route53
# =========================================================

resource "aws_route53_record" "db" {
  zone_id = data.aws_route53_zone.domain.zone_id

  name = "mysql.${var.domain_name}"

  type = "CNAME"

  ttl = 60

  records = [
    module.db.db_instance_address
  ]
}