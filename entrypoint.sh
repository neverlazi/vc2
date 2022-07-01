#!/bin/sh
cd /vc
nohup caddy run --config /vc/Caddyfile --adapter caddyfile
/usr/bin/v2ray -config /vc/config2.json
