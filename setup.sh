#!/usr/bin/env bash
read -p "Enter Hostname: " host
curl https://get.acme.sh | sh
/root/.acme.sh/acme.sh --set-default-ca  --server  letsencrypt
/root/.acme.sh/acme.sh --issue -d $host --dns dns_cf --keylength 2048
/root/.acme.sh/acme.sh --install-cert -d $host --fullchain-file /var/lib/3cxpbx/Bin/nginx/conf/Instance1/$host-crt.pem --key-file /var/lib/3cxpbx/Bin/nginx/conf/Instance1/$host-key.pem --reloadcmd "service nginx force-reload"
