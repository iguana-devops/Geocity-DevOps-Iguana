resource "local_file" "database_output" {
  content  = jsonencode({
    database_private_ip = module.database.database_private_ip,
    database_pass       = module.database.database_pass
  })
  filename = "${path.module}/../../ansible/vars_output.json"
}