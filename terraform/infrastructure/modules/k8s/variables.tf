variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "cluster_id" {
  description = "EKS Cluster Identifier"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "node_group_name" {
  description = "EKS Node Group Identifier"
  type = string
}

variable "openid_provider_url" {
  description = "OpenID Connection Provider"
  type = string
}

variable "openid_provider_arn" {
  description = "OpenID Connection Provider"
  type = string
}