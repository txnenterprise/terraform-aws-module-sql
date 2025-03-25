resource "random_password" "sql" {
  length           = 14
  special          = true
  override_special = "&8h8a9QogDb3y"
}

resource "postgresql_role" "user" {
  name               = var.username
  login              = true
  password           = random_password.sql.result
  encrypted_password = true
  depends_on = [
    random_password.mq
  ]
}