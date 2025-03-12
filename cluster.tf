resource "aws_eks_cluster" "security_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = data.aws_subnets.cluster_subnets.ids
    endpoint_private_access = true
    endpoint_public_access = true
  }

  enabled_cluster_log_types = ["audit"]

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.cluster_logs
  ]
}