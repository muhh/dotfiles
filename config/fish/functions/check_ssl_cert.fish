function check_ssl_cert
	curl --insecure -v $argv 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
end
