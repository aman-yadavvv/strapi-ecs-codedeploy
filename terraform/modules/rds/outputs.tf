output "db_address" { value = aws_db_instance.strapi_db.address }
output "db_port" { value = aws_db_instance.strapi_db.port }
output "db_name" { value = aws_db_instance.strapi_db.db_name }
output "db_username" { value = aws_db_instance.strapi_db.username }
output "db_identifier" { value = aws_db_instance.strapi_db.id }