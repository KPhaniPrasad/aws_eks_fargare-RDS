resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.eks_cluster_name}-${terraform.workspace}"
  enabled_cluster_log_types = ["api", "audit", "authenticator","controllerManager","scheduler"]
  iam_role_arn = var.iam_role

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = {
    Name = "eks_cluster_${terraform.workspace}"
  }
}

resource "aws_eks_fargate_profile" "main" {
  cluster_name           = "${var.eks_cluster_name}-${terraform.workspace}"
  fargate_profile_name   = "${var.fargate_profile_name}-${terraform.workspace}"
  pod_execution_role_arn = var.iam_role
  subnet_ids             = var.subnet_ids

  selector {
    namespace = var.kubernetes_namespace
  }
depends_on = [ aws_eks_cluster.eks_cluster ]
}