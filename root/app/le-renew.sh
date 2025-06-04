#!/usr/bin/with-contenv bash
# shellcheck shell=bash

mkdir -p /var/www/html

if [[ -f "/config/cabundle.pem" ]]; then
	export REQUESTS_CA_BUNDLE="/config/cabundle.pem"
fi

echo "<------------------------------------------------->"
echo
echo "<------------------------------------------------->"
echo "cronjob running on $(date)"
echo "Running certbot renew"
certbot renew --non-interactive --config-dir /config/etc/letsencrypt --logs-dir /config/log/letsencrypt --work-dir /tmp/letsencrypt --config /config/etc/letsencrypt/cli.ini
