FROM --platform=${TARGETPLATFORM} caddy:latest
LABEL maintainer "anonymous"

WORKDIR /root
ARG TARGETPLATFORM
ARG TAG
COPY * /root/

RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x /root/v2ray.sh \
	&& chmod +x /root/entrypoint.sh \
	&& /root/v2ray.sh "${TARGETPLATFORM}" "${TAG}"

ENTRYPOINT  ["/root/entrypoint.sh"]
