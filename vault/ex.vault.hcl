ui = true

listener "tcp" {
  tls_disable = 1
  address = "0.0.0.0:8200"
}

storage "mysql" {
  address = "host.docker.internal"
  username = "root"
  password = "1234"
  database = "devobs_vault"
  table = "vault_secrets"
  plaintext_connection_allowed = 1
}