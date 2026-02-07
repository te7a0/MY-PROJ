output "cluster_name" {
  value = var.cluster_name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}
output "cluster_ca" {
  description = "Certificate Authority Data"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}