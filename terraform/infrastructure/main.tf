module "network" {
  source = "./modules/network"

  vpc_name             = "${var.cluster_name}-vpc"
  cidr_block           = "10.0.0.0/16"
  nat_gateway          = true
  enable_dns_support   = true
  enable_dns_hostnames = true

  public_subnet_count  = 3
  private_subnet_count = 3
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

module "eks" {
  source = "./modules/eks"

  region          = var.region
  cluster_name    = var.cluster_name
  private_subnets = module.network.private_subnets
  public_subnets  = module.network.public_subnets
  vpc_id          = module.network.vpc_id

  managed_node_groups = {
    worker_group = {
      name           = "worker-node-group"
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      instance_types = ["t3a.small"]
    }
  }
}

module "k8s" {
  source = "./modules/k8s"
  node_group_name = module.eks.node_group.worker_group.node_group_name
  region          = var.region
  vpc_id          = module.network.vpc_id
  cluster_id      = module.eks.cluster_id
  cluster_name    = module.eks.cluster_name
  openid_provider_url = module.eks.openid_provider_url
  openid_provider_arn = module.eks.oidc_provider_arn
}
