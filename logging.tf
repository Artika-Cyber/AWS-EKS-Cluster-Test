resource "aws_cloudwatch_log_group" "cluster_logs" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 1
}

resource "aws_iam_user" "cloudwatch_user" {
  name = var.cloudwatch_user
}

resource "aws_iam_access_key" "cloudwatch_user_key" {
  user = aws_iam_user.cloudwatch_user.name
}

resource "aws_iam_policy" "cloudwatch_logs_policy" {
  name        = "CloudWatchLogsPolicy"
  description = "Policy for querying CloudWatch Logs"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:FilterLogEvents"
      ],
      "Resource": "arn:aws:logs:eu-west-1:582528916400:log-group:/aws/eks/security-cluster/cluster:*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "cloudwatch_logs_policy_attachment" {
  user       = aws_iam_user.cloudwatch_user.name
  policy_arn = aws_iam_policy.cloudwatch_logs_policy.arn
}