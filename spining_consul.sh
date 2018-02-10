#!/usr/bin/env bash
sudo yum install unzip -y
wget https://releases.hashicorp.com/consul/1.0.3/consul_1.0.3_linux_386.zip -O consul_1.0.3_linux_amd64.zip
unzip consul_1.0.3_linux_amd64.zip
cp consul /usr/bin
mkdir -p /etc/consul
cat > /etc/consul/consul-config.json << EOF
{
  "data_dir": "/opt/consul/data",
  "client_addr": "0.0.0.0",
  "retry_join": ["192.168.0.11"]
}
EOF

#Gte IP of the node
ip=$(ifconfig eth0 | grep 'inet ' | awk '{ print substr($2,1) }')
consul agent -advertise $ip -config-file /etc/consul &
