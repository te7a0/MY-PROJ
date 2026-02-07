resource "aws_eks_node_group" "node_eks" {
  cluster_name    = var.cluster_name
  node_group_name = "node_eks"

  node_role_arn = aws_iam_role.node_role.arn
  subnet_ids    = var.private_subnets

  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  remote_access {
    ec2_ssh_key = "te7a_sshkey"
  }
}
