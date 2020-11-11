#!/bin/sh
set -e

if [ -z "$1" ]; then
  echo "Argument expected"
  exit 1
fi

echo \
"server {" \
"    listen 80 default_server;" \
"    location / {" \
"        proxy_pass http://$1;" \
"        proxy_set_header X-Real-Ip \$remote_addr;" \
"    }" \
"}" \
"" > /etc/nginx/conf.d/default.conf

nginx -g "daemon off; pid /tmp/nginx.pid; error_log /dev/stderr info;"