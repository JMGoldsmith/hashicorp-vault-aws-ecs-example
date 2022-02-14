api_addr = "http://vault-test.demo.net:8200"

cluster_name = "vault-test"

listener "tcp" {
  address = "0.0.0.0:8200"
  # just for demo
  tls_disable = true
}

storage "raft" {
  path = "/path/to/raft/data"
  retry_join {
    auto_join = "provider=aws region=eu-west-2 tag_key=vault tag_value=... access_key_id=... secret_access_key=..."
  }
}

# Auto-unseal
seal "awskms" {
  region     = "eu-west-2"
  # Set by environment variable VAULT_AWSKMS_SEAL_KEY_ID
  # kms_key_id = "example"
}
#storage "inmem" {}
