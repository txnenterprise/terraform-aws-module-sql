variable "db_username" {
  type = string
}

variable "db_name" {
  type = string
}

variable "encoding" {
  type    = string
  default = "UTF8"
}

variable "lc_collate" {
  type    = string
  default = "en_US.utf8"
}

variable "lc_ctype" {
  type    = string
  default = "en_US.utf8"
}

variable "template" {
  type    = string
  default = "template0"
}

variable "tablespace_name" {
  type    = string
  default = "DEFAULT"
}