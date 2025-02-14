output "cluster_id" {
  description = "DOKS cluster ID"
  value       = digitalocean_kubernetes_cluster.mono_cluster.id
}

output "cluster_endpoint" {
  description = "DOKS API endpoint"
  value       = digitalocean_kubernetes_cluster.mono_cluster.endpoint
}

output "kubeconfig" {
  description = "Raw kubeconfig (sensitive)"
  value       = digitalocean_kubernetes_cluster.mono_cluster.kube_config[0].raw_config
  sensitive   = true
}
