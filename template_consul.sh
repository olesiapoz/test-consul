#!/usr/bin/env bash
CONSUL_TEMPLATE_VERSION=0.15.0
wget https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_386.zip -O consul-template_${CONSUL_TEMPLATE_VERSION}.zip

unzip consul-template_${CONSUL_TEMPLATE_VERSION}.zip
sudo chmod + consul-template_${CONSUL_TEMPLATE_VERSION}
sudo mv consul-template_${CONSUL_TEMPLATE_VERSION} /usr/bin/consul-template_${CONSUL_TEMPLATE_VERSION}