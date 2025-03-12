variable "region" {
  default     = "eu-west-1"
  description = "Region to use"
}

variable "cluster_name" {
  default     = "security-cluster"
  description = "Name of the cluster"
}

variable "cluster_role_name" {
  default     = "eksClusterRole"
  description = "Name of the cluster role"
}

variable "vpc_cluster_id" {
  default     = "test-vpc"
  description = "Name of the VPC"
}

variable "node_group_name" {
  default     = "security-nodegroup"
  description = "Name of the node group"
}

variable "nodegroup_role_name" {
  default     = "eksNodeGroupRole"
  description = "Name of the node group role"
}

variable "cloudwatch_user"{
  default = "cloudwatch_user"
  description = "User to query CloudWatch logs"
}