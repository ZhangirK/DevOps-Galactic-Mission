terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

#module "vpc" {
#  source = "terraform-aws-modules/vpc/aws"
#
#  name = "galaxy"
#  cidr = "10.0.0.0/16"
#
#  azs             = ["eu-central-1a", "eu-central-1b"]  # Specify subnets from two different AZs
#  private_subnets = []                                 # No private subnets in this example
#  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]      # Specify subnets from two different AZs
#
#  enable_nat_gateway = false
#  enable_vpn_gateway = false
#
#  map_public_ip_on_launch = true  # Add this line to enable auto-assigning public IP addresses
#
#  tags = {
#    Terraform   = "true"
#    Environment = "dev"
#  }
#
#}
#
#module "eks" {
#  source  = "terraform-aws-modules/eks/aws"
#  version = "~> 19.0"
#
#  cluster_name    = "space"
#  cluster_version = "1.27"
#
#  cluster_endpoint_public_access  = true
#
#  cluster_addons = {
#    coredns = {
#      most_recent = true
#    }
#    kube-proxy = {
#      most_recent = true
#    }
#    vpc-cni = {
#      most_recent = true
#    }
#  }
#  #enable control plane logging
#  cluster_enabled_log_types = [
#    "audit",
#    "api",
#    "authenticator",
#    "controllerManager",
#    "scheduler"
#  ]
#
#  vpc_id                   = module.vpc.vpc_id
#  subnet_ids               = module.vpc.public_subnets
#  control_plane_subnet_ids = module.vpc.public_subnets
#
#  # EKS Managed Node Group(s)
#  eks_managed_node_group_defaults = {
#    instance_types = ["t2.micro"]
#  }
#
#  eks_managed_node_groups = {
#    one = {
#      name = "node-group-1"
#      min_size     = 2
#      max_size     = 2
#      desired_size = 2
#
#      instance_types = ["t2.micro"]
#    }
#  }
#
#  tags = {
#    Environment = "dev"
#    Terraform   = "true"
#  }
#}
#
#module "eks-kubeconfig" {
#  source  = "hyperbadger/eks-kubeconfig/aws"
#  version = "2.0.0"
#  ##wait until the cluster is created 
#  depends_on = [module.eks]
#  cluster_name = module.eks.cluster_name
#}
#
#output "kubeconfig" {
#  value = module.eks-kubeconfig.kubeconfig
#  sensitive = true
#}
#
#module "ecr" {
#  source = "terraform-aws-modules/ecr/aws"
#
#  repository_name = "private-force"
#
#  #repository_read_write_access_arns = ["arn:aws:iam::012345678901:role/terraform"]
#  repository_lifecycle_policy = jsonencode({
#    rules = [
#      {
#        rulePriority = 1,
#        description  = "Keep only 1 image",
#        selection = {
#          tagStatus     = "any",
#          countType     = "imageCountMoreThan",
#          countNumber   = 1
#        },
#        action = {
#          type = "expire"
#        }
#      }
#    ]
#  })
#
#  tags = {
#    Terraform   = "true"
#    Environment = "dev"
#  }
#}