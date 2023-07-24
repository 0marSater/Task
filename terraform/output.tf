#eks
output "cluster_name" {
  description = "The name of the cluster"
  value       = module.EKS.cluster_name
}

output "repository_url" {
  description = "The URL of the repository"
  value       = module.ecr.repository_url
}