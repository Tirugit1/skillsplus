resource "aws_eks_cluster" "main" {
  name     = "${var.project}-${var.environment}"
  role_arn = aws_iam_role.eks.arn
  version  = var.cluster_version
  vpc_config { subnet_ids = var.subnet_ids }
}
resource "aws_iam_role" "eks" {
  name = "${var.project}-eks-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow",
      Principal = { Service = "eks.amazonaws.com" } }]
  })
}
resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
output "cluster_endpoint" { value = aws_eks_cluster.main.endpoint }
output "cluster_name"     { value = aws_eks_cluster.main.name }
variable "project"         {}
variable "environment"     {}
variable "vpc_id"          {}
variable "subnet_ids"      { type = list(string) }
variable "cluster_version" {}
