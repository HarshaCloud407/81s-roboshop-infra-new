data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/roboshop/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/roboshop/${var.environment}/private_subnet_ids"
}

data "aws_route53_zone" "domain" {
  name         = "${var.domain_name}."
  private_zone = false
}