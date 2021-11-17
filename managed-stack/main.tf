resource "random_password" "secret" {
  length  = 20
  special = true
}