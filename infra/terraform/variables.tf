variable "region"      { default = "us-east-1" }
variable "project"     { default = "skillsplus" }
variable "environment" { default = "dev" }
variable "vpc_cidr"    { default = "10.0.0.0/16" }
variable "db_password" { sensitive = true }
