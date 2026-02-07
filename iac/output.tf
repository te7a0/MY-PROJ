output "bastion_ip" {
  value = module.ec2.bastion_public_ip
}
output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_ca" {
  value = module.eks.cluster_ca
}
