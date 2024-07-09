output "cluster_id" {
  description = "The EKS cluster ID"
  value       = aws_eks_cluster.main.id
}

output "cluster_name" {
  description = "The EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster API"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "The security group ID of the EKS cluster"
  value       = aws_eks_cluster.main.vpc_config[0].security_group_ids
}

output "node_group_role_arn" {
  description = "The ARN of the IAM role used by the node group"
  value       = aws_iam_role.node_role.arn
}

output "node_group" {
  description = "The node group reference name"
  value       = aws_eks_node_group.main
}

output "cluster_admins_arn" {
  description = "The ARN of the role for EKS cluster admins"
  value       = aws_iam_role.eks_admins_role.arn
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster"
  value       = base64decode(aws_eks_cluster.main.certificate_authority[0].data)
}

output "cluster_auth_token" {
  description = "The token required to authenticate with the cluster"
  value       = data.aws_eks_cluster_auth.main.token
}

output "oidc_provider_arn" {
  description = "The OIDC ARN of the Cluster"
  value       = aws_iam_openid_connect_provider.eks.arn
}

output "oidc_provider_id" {
  description = "The OIDC ID of the Cluster"
  value       = aws_iam_openid_connect_provider.eks.id
}

output "openid_provider_url" {
  description = "OpenID connection provider"
  value       = aws_iam_openid_connect_provider.eks.url
}