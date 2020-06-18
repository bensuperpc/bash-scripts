#!/bin/bash
# Tested on Ubuntu 18.04
# This script creates an nginx reverse proxy
while [[ -z "$domain" ]]
do
    read -p "domain >> " domain
done
while [[ -z "$appport" ]]
do
    read -p "port   >> " appport
done
cd /etc/nginx/sites-available/
touch $domain
echo "
server {
    listen 80;
    server_name ${domain};
    location / {
      proxy_pass http://127.0.0.1:${appport};
      proxy_set_header X-Forwarded-For "'$remote_addr'";
    }
}
" > $domain
ln -s /etc/nginx/sites-available/$domain /etc/nginx/sites-enabled/
nginx -t
certbot --nginx -d $domain
systemctl restart nginx
echo Finished!