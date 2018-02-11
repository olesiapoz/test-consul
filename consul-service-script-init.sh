#!/usr/bin/bash
cat > /etc/consul/consul-config.json << EOF
{
  "data_dir": "/opt/consul/data",
  "client_addr": "0.0.0.0",
  "retry_join": ["192.168.0.11", "192.168.0.20", "192.168.0.18", "192.168.0.24"],
  "disable_remote_exec": false
}
EOF

cat > /etc/consul/consul-service.json << EOF
{
"service": {
  "name": "web",
  "port": 8080,
  "check": {
        "http": "http://localhost:8080",
        "interval": "5s"
    }
  }
}
EOF

 

consul_pid=$(pgrep consul)

kill $consul_pid
echo "Kill status: $?"


PID_FILE=/var/run/consul.pid

ip=$(ifconfig eth0 | grep 'inet ' | awk '{ print substr($2,1) }')
consul agent -pid-file $PID_FILE -advertise $ip -config-file /etc/consul &
