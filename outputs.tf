output "password" {
  sensitive = true
  value     = resource.random_password.sql.result
}