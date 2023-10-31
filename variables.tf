variable "eks_cluster_name" {
    type = string
    description = "Name of the EKS Cluster"
}

variable "subnet_ids" {
    description = "List of all the subnet ids"
}

variable "vpc_id" {
    type = string
    description = "ID of VPC"
}
variable "fargate_profile_name" {
    type = string
    description = "fargate profile name"
}

variable "kubernetes_namespace" {
    type = string
    description = "Kubernetes Namespace name"
}
variable "cluster_name" {
    type = string
    description = "cluster name"
}
variable "iam_role_arn" {
    type = string
    description = " iam role ARN"
}