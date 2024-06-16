terraform {
  backend "gcs" {
    bucket = "dev-01-us-central1-gitea-helm-state"
    prefix = "terraform/helm"
  }
  required_version = ">= 1.8.4"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
