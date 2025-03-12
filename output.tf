output "endpoint" {
  value = aws_eks_cluster.security_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.security_cluster.certificate_authority[0].data
}

output "subnets" {
  value = data.aws_subnets.cluster_subnets.ids
}

output "access_key_id" {
  value = aws_iam_access_key.cloudwatch_user_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.cloudwatch_user_key.secret
  sensitive = true 
}