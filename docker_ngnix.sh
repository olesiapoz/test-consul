#!/usr/bin/env bash
mkdir -p ~/consul/

# Fetch IP of teh node
ip=$(ifconfig eth0 | grep 'inet ' | awk '{ print substr($2,1) }')
echo "<h1>$ip $(hostname) <h1>" > ~/consul/ip.html
docker rm web -f
docker rm web
docker volume prune

#ngnix+docker+ mount volume(ip.htmp page)
docker run -d \
	--name web \
	-p 8080:80 \
	--restart unless-stopped \
	-v ~/consul/ip.html:/usr/share/nginx/html/ip.html:ro \
	nginx