FROM teddysun/caddy:latest
LABEL maintainer "anonymous"

WORKDIR /vc
ARG TARGETPLATFORM="linux/amd64"
ARG TAG="v4.45.2"
COPY v2ray.sh /vc/
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates bash \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x /vc/v2ray.sh \
	&& /vc/v2ray.sh "${TARGETPLATFORM}" "${TAG}"

COPY * /vc/
RUN chmod +x /vc/entrypoint.sh

EXPOSE 8080
ENTRYPOINT  ["/vc/entrypoint.sh"]
