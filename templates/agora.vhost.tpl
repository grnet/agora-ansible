server_names_hash_bucket_size 64;
server {
	listen 80 default_server;
	listen [::]:80 default_server ipv6only=on;

	server_name {{ agora_server_name }};
	return 301 {{ agora_base_url }}$request_uri;
}


# HTTPS server
#
ssl_session_cache shared:ssl_session_cache:10m;
server {
	listen 443;
	listen [::]:443 default_server ipv6only=on;
	server_name {{ agora_server_name }};

	root html;
	index index.html index.htm;

	ssl on;
	ssl_certificate server.crt;
	ssl_certificate_key server.key;

	ssl_session_timeout 5m;

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	ssl_ciphers "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA:ECDHE:DHE:!RC4:HIGH:!MD5:!aNULL";
	ssl_prefer_server_ciphers on;

	location / {
		proxy_pass http://127.0.0.1:{{ agora_port }};
        proxy_set_header X-Real-IP $remote_addr;
	}
}