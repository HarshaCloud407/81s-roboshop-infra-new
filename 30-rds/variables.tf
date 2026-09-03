variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "roboshop"
}

variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = "roboshop"
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "roboshop"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "route53_zone_name" {
  description = "Route53 hosted zone name"
  type        = string
  default     = "roboshop.internal"
}

variable "db_dns_name" {
  description = "DNS name for MySQL RDS"
  type        = string
  default     = "mysql.roboshop.internal"
}