#!/bin/sh
cd /vc
caddy start --config /vc/Caddyfile --adapter caddyfile
/usr/bin/v2ray -config /vc/config2.json
