resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids         = var.private_subnets
    security_group_ids = [aws_security_group.eks_sg.id]
  }

  depends_on = [
      aws_iam_role_policy_attachment.admin
  ]
}
