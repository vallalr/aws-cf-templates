listener "tcp" {
  address = "10.100.11.159:9202"
  # address = "10.100.3.116:9202"
	purpose = "proxy"

  tls_disable   = false
  tls_cert_file = "/etc/pki/tls/boundary/boundary.cert"
  tls_key_file  = "/etc/pki/tls/boundary/boundary.key"


	#proxy_protocol_behavior = "allow_authorized"
	#proxy_protocol_authorized_addrs = "127.0.0.1"
}

worker {
  # Name attr must be unique
	public_addr = "3.67.219.189"
	# public_addr = "3.67.103.49"
	name = "worker-0"
	description = "A default worker created for Adappt Limited!"
	controllers = [
    "10.100.12.179",
    "10.100.7.60",
    "10.100.11.59",
  ]
}


kms "awskms" {
	purpose    = "worker-auth"
	key_id     = "global_root"
  kms_key_id = "c824509c-6ee6-4766-9c83-ba729cef556f"
}