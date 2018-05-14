#!/usr/bin/env bash
sudo yum install unzip -y
CONSUL_VERSION=1.0.3
wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_386.zip -O consul_${CONSUL_VERSION}.zip
unzip consul_${CONSUL_VERSION}.zip
cp consul /usr/bin
mkdir -p /etc/consul
cat > /etc/consul/consul-config.json << EOF
{
  "data_dir": "/opt/consul/data",
  "client_addr": "0.0.0.0",
  "retry_join": ["192.168.0.11", "192.168.0.22", "192.168.0.18", "192.168.0.30""],
  "disable_remote_exec": false
}
EOF

#Gte IP of the node
ip=$(ifconfig eth0 | grep 'inet ' | awk '{ print substr($2,1) }')
consul agent -advertise $ip -config-file /etc/consul &
