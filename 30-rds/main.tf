resource "aws_db_subnet_group" "mysql" {
  name = "${local.name}-mysql"

  subnet_ids = split(
    ",",
    data.aws_ssm_parameter.private_subnet_ids.value
  )

  tags = merge(
    local.db_tags,
    {
      Name = "${local.name}-mysql"
    }
  )
}

resource "aws_db_instance" "mysql" {
  identifier = "${local.name}-mysql"

  engine         = "mysql"
  engine_version = var.db_engine_version

  instance_class        = var.db_instance_class
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = 50
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username

  manage_master_user_password = true

  port = 3306

  db_subnet_group_name = aws_db_subnet_group.mysql.name

  vpc_security_group_ids = [
    data.aws_ssm_parameter.mysql_sg_id.value
  ]

  publicly_accessible = false

  multi_az = false

  backup_retention_period = 7

  backup_window = "03:00-04:00"

  maintenance_window = "sun:04:00-sun:05:00"

  auto_minor_version_upgrade = true

  deletion_protection = false

  skip_final_snapshot = true

  apply_immediately = true

  tags = local.db_tags
}

resource "aws_route53_record" "mysql" {
  zone_id = data.aws_route53_zone.internal.zone_id

  name = var.db_dns_name

  type = "CNAME"

  ttl = 30

  records = [
    aws_db_instance.mysql.address
  ]
}