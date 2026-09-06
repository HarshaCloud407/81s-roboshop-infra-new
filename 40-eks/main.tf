resource "aws_key_pair" "eks" {
  key_name   = "eks"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAwrcfiQKv9v5spMRPVt0KiP+1LL2F10v3KfOC0P/9GchUoYQIeUVBSCMYBbcQdXp0dueCvo0/Jnu8VoPY6JNxjMp8KPcFPSD820/byrLX+nZSvBUyob+VjTVzaCn7B0bDNGszOfwMN9muq/CTMcMxQOIJ4jFecOgt7SgZbbNh7g6/2q5SJOuFiWZkqgsxvbAytVA3/FL0v5UU+Ba7Kh1Ugu1skQNDClvpZg+NzHHQNP6E4EWAtZSQUflPS83qtvJPF6cXj9bFb7h5kG+i2qWsB6+iujC+964XWImGr8ftVOpe6JWxRcg+C++bTJgz4sdWxCBbo/KtpzjLzVtvOpAI10V9Y+KGkPQuEVYty9Wk1HzLb13TS+iWbXXdrW0eadFl5nGsyrvE1Yen+Tae7J6ayRmjrfYw6Dio1rAmTW1Sms+Df4cESzpVsjEALfoqJmNxDJy6SLpZXQiNXhdeIAxkotnedo0fEHbsx15nx/0EJT9bHCfyh/l6g+l+4O2mjOE= user@AshDexter-T480"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${var.project_name}-${var.environment}"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = data.aws_ssm_parameter.vpc_id.value
  subnet_ids               = local.private_subnet_ids
  control_plane_subnet_ids = local.private_subnet_ids

  create_cluster_security_group = false
  cluster_security_group_id     = local.eks_control_plane_sg_id

  create_node_security_group = false
  node_security_group_id     = local.node_sg_id

  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "t3.medium", "t3.small"]
  }

  eks_managed_node_groups = {
    green = {
      min_size      = 3
      max_size      = 10
      desired_size  = 3
      capacity_type = "SPOT"
      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy          = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
        AmazonElasticFileSystemFullAccess = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
        ElasticLoadBalancingFullAccess    = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
      }
      key_name = aws_key_pair.eks.key_name
    }
  }

  enable_cluster_creator_admin_permissions = true

  tags = var.common_tags
}