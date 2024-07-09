variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "Target AWS region"
}

variable "cluster_name" {
  type        = string
  default     = "eks-cluster"
  description = "Name of the EKS cluster"
}

variable "aws_account_number" {
  type        = number
  description = "AWS account number used for deployment."
}

variable "access_key" {
  type        = string
  default     = ""
  description = "access-key aws account"
}

variable "secret_key" {
  type        = string
  default     = ""
  description = "secret access key aws account"
}

variable "global_tags" {
  type = map(string)
  default = {
    "ManagedBy"   = "Terraform"
    "Environment" = "staging"
  }
}
