module "vpc" {
  source = "./vpc"
}
module "ec2" {
  source = "./ec2"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets[0]
}
module "eks" {
  source = "./eks"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "nodes" {
  source = "./nodes"

  cluster_name    = module.eks.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

resource "null_resource" "ansible_inventory" {
  provisioner "local-exec" {
    command = <<EOT
echo "[bastion]
${module.ec2.bastion_public_ip} ansible_user=ec2-user
" > ../ansible_conf/inventory
EOT
  }

  depends_on = [module.ec2]
}

