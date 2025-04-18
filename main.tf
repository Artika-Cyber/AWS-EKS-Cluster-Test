terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
  }
}
}

provider "aws" {
  region = var.region
}

provider "kubectl" {
  config_path = "~/.kube/config" # Path to your kubeconfig file
}