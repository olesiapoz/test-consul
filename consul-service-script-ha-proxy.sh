#!/usr/bin/bash
cat > /etc/consul/consul-config.json << EOF
{
  "data_dir": "/opt/consul/data",
  "client_addr": "0.0.0.0",
  "retry_join": ["192.168.0.11", "192.168.0.20", "192.168.0.18", "192.168.0.24"],
  "disable_remote_exec": false
}
EOF

cat /home/centos/test-consul-config-master/consul-ha-proxy-nginx.json > /etc/consul/consul-service.json

PID_FILE=/var/run/consul.pid

kill `cat $PID_FILE`
echo "Kill status: $?"

ip=$(ifconfig eth0 | grep 'inet ' | awk '{ print substr($2,1) }')
consul agent -pid-file $PID_FILE -advertise $ip -config-file /etc/consul &
