data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}
<<<<<<< HEAD
=======
<<<<<<< HEAD
data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}
data "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name = "/${var.project_name}/${var.environment}/eks_control_plane_sg_id"
}
data "aws_ssm_parameter" "eks_node_sg_id" {
  name = "/${var.project_name}/${var.environment}/node_sg_id"
=======
>>>>>>> ffed66343b877995813675084587cc93c11a708c

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name = "/${var.project_name}/${var.environment}/eks_control_plane_sg_id"
}

data "aws_ssm_parameter" "eks_node_sg_id" {
<<<<<<< HEAD
  name = "/${var.project_name}/${var.environment}/node_sg_id"
=======
  name = "/${var.project_name}/${var.environment}/eks_node_sg_id"
>>>>>>> 3125dce2369c948575274853b3ccaf8d5ad51485
>>>>>>> ffed66343b877995813675084587cc93c11a708c
}