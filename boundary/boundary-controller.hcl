disable_mlock = true

telemetry {
  prometheus_retention_time = "24h"
  disable_hostname          = true
}

controller {
  name        = "controller-0"
  description = "A controller for Adappt Limited!"

  database {
    url = "postgresql://boundarymaster:4JwrRabrcBEpMPhDgunYcyVA@boundary-rds.c7xcmspdafkg.eu-central-1.rds.amazonaws.com:5432/boundary?sslmode=enable"
  }
}

listener "tcp" {
  address                           = "10.100.12.179:9200"
  # address                           = "10.100.7.60:9200"
  # address                           = "10.100.11.59:9200"
	purpose                           = "api"

  tls_disable   = false
  tls_cert_file = "/etc/pki/tls/boundary/boundary.cert"
  tls_key_file  = "/etc/pki/tls/boundary/boundary.key"

	# proxy_protocol_behavior         = "allow_authorized"
	# proxy_protocol_authorized_addrs = "127.0.0.1"
	cors_enabled                      = true
	cors_allowed_origins              = ["*"]
}

listener "tcp" {
  address                           = "10.100.12.179:9201"
  # address                           = "10.100.7.60:9201"
  # address                           = "10.100.11.59:9201"
	purpose                           = "cluster"

  tls_disable   = false
  tls_cert_file = "/etc/pki/tls/boundary/boundary.cert"
  tls_key_file  = "/etc/pki/tls/boundary/boundary.key"

	# proxy_protocol_behavior         = "allow_authorized"
	# proxy_protocol_authorized_addrs = "127.0.0.1"
}


kms "awskms" {
	purpose    = "root"
	key_id     = "global_root"
  kms_key_id = "96879006-0276-45d5-9a0e-621682f644cf"
}

kms "awskms" {
	purpose    = "worker-auth"
	key_id     = "global_worker_auth"
  kms_key_id = "c824509c-6ee6-4766-9c83-ba729cef556f"
}

kms "awskms" {
	purpose    = "recovery"
	key_id     = "global_recovery"
  kms_key_id = "e990fa81-1485-4df0-9c43-666fceb301d1"
}