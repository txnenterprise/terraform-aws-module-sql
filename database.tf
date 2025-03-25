resource "postgresql_database" "this" {
  name            = var.db_name
  owner           = postgresql_role.user.name
  encoding        = var.encoding
  lc_collate      = var.lc_collate
  lc_ctype        = var.lc_ctype
  template        = var.template
  tablespace_name = var.tablespace_name
}