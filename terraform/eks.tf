module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = "mlops-eks"
  cluster_version = "1.27"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
      disk_size      = 20
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
