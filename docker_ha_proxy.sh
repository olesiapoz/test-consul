#!/usr/bin/env bash

docker container ls | grep "ha-proxy-lb" | awk '{ print $1 }' | xargs docker rm -fv


#ha-proxy+docker+ mount volume(ip.htmp page)
docker run -d \
	--name ha-proxy-lb \
	-p 80:8443 \
	--restart unless-stopped \
	-v /home/centos/test-consul-config-master/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro \
	haproxy:1.6.5-alpine