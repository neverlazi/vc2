FROM caddy:latest
LABEL maintainer "anonymous"

WORKDIR /root
ARG TARGETPLATFORM="linux/amd64"
ARG TAG="v4.45.2"
COPY * /vc/

RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x /vc/v2ray.sh \
	&& chmod +x /vc/entrypoint.sh \
	&& /vc/v2ray.sh "${TARGETPLATFORM}" "${TAG}"

ENTRYPOINT  ["/vc/entrypoint.sh"]
