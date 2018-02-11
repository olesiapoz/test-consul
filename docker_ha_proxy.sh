#!/usr/bin/env bash
mkdir -p ~/haproxy/

docker container ls | grep "ha-proxy-lb" | awk '{ print $1 }' | xargs docker rm -fv


#ha-proxy+docker+ mount volume(ip.htmp page)
docker run -d \
	--name ha-proxy-lb \
	-p 8443:80 \
	--restart unless-stopped \
	-v ~/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro \
	haproxy:1.6.5-alpine