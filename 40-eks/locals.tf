<<<<<<< HEAD
locals {
  name                    = "${var.project_name}-${var.environment}"
  vpc_id                  = data.aws_ssm_parameter.vpc_id.value
  private_subnet_ids      = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  eks_control_plane_sg_id = data.aws_ssm_parameter.eks_control_plane_sg_id.value
  eks_node_sg_id          = data.aws_ssm_parameter.eks_node_sg_id.value
=======
locals{
    name = "${var.project_name}-${var.environment}"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
    eks_control_plane_sg_id = data.aws_ssm_parameter.eks_control_plane_sg_id.value
    eks_node_sg_id = data.aws_ssm_parameter.eks_node_sg_id.value
>>>>>>> 3125dce2369c948575274853b3ccaf8d5ad51485
}