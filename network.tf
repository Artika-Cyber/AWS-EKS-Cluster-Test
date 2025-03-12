data "aws_subnets" "cluster_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_cluster_id]
  }

  filter {
    name   = "tag:network:subnet:type"
    values = ["public"]
  }

}
