terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    region   = "us-east-1"
    key      = "terraform.tfstate"
    bucket   = "mono-terraform-state"

    endpoints = {
      s3      = "https://nyc3.digitaloceanspaces.com"
    }

    skip_credentials_validation = true
  }
}

provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_kubernetes_cluster" "mono_cluster" {
  name    = var.cluster_name
  region  = var.region
  version = var.k8s_version

  node_pool {
    name       = "worker-pool"
    size       = var.node_pool_size
    node_count = var.node_count
  }
}
