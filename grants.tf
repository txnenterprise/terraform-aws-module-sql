resource "postgresql_default_privileges" "tables" {
  role        = postgresql_role.user.name
  database    = postgresql_database.this.name
  schema      = "public"
  owner       = postgresql_role.user.name
  object_type = "table"
  privileges  = ["ALL"]
}

resource "postgresql_default_privileges" "sequences" {
  role        = postgresql_role.user.name
  database    = postgresql_database.this.name
  schema      = "public"
  owner       = postgresql_role.user.name
  object_type = "sequence"
  privileges  = ["ALL"]
}