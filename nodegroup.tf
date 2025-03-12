resource "aws_eks_node_group" "security_cluster_node_group" {
  cluster_name    = aws_eks_cluster.security_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.nodegroup_role.arn
  subnet_ids      = aws_eks_cluster.security_cluster.vpc_config[0].subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}