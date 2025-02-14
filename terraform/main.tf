terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    endpoint = "nyc3.digitaloceanspaces.com"
    region   = "us-east-1"
    key      = "terraform.tfstate"
    bucket   = "mono-terraform-state"

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
