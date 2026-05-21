resource "aws_db_instance" "main" {
  identifier        = "${var.project}-${var.environment}-db"
  engine            = "postgres"
  engine_version    = "15.3"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  db_name           = "skillsplus"
  username          = "skillsplus"
  password          = var.db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  tags = { Name = "${var.project}-rds" }
}
resource "aws_db_subnet_group" "main" {
  name       = "${var.project}-db-subnet"
  subnet_ids = var.subnet_ids
}
resource "aws_security_group" "rds" {
  vpc_id = var.vpc_id
  ingress { from_port=5432 to_port=5432 protocol="tcp" cidr_blocks=["10.0.0.0/16"] }
}
output "endpoint" { value = aws_db_instance.main.endpoint }
variable "project"     {}
variable "environment" {}
variable "vpc_id"      {}
variable "subnet_ids"  { type = list(string) }
variable "db_password" { sensitive = true }
