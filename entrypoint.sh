#!/bin/sh
cd /root
nohup caddy run --config /root/Caddyfile --adapter caddyfile
/usr/bin/v2ray -config /root/config.json
