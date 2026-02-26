resource "aws_db_subnet_group" "strapi_db_subnet_group" {
  name        = "aman-db-subnet-group"
  description = "Subnet group for the strapi database"
  subnet_ids  = [var.private_subnet_1, var.private_subnet_2]
}

resource "aws_db_instance" "strapi_db" {
  identifier        = "strapi-db"
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"

  db_name  = "strapi"
  port     = 5432
  username = "strapi"
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.strapi_db_subnet_group.name
  vpc_security_group_ids = [var.rds_sg_id]

  skip_final_snapshot = true
  publicly_accessible = false
  multi_az            = false
}