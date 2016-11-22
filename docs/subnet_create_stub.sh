#!/bin/bash

# Definitions....
# EXTERNAL_SUBNET_NAME=ext-net
# INTERNAL_SUBNET_NAME=int
# ROUTER_NAME=router1
# POOL_START=100
# POOL_END=120
# INTERNAL_CIDR=30.0.0.0/24
# DNS_SERVERS=8.8.8.8

echo "Get undercloud subnet..."
source stackrc
subnet_cidr=$(neutron subnet-list | grep -P "\d" | perl -p -i -e 's|^.+\s([\d\.]+/\d+)\s.+$|$1|')
subnet_class_c=$(echo $subnet_cidr | perl -p -i -e 's|^(.+)\..+$|$1|')

echo "Create overcloud external subnet"
source ~/overcloudrc
neutron net-create ext-net --router:external --provider:physical_network datacentre  --provider:network_type flat
neutron subnet-create ext-net \
  --name ext-subnet \
  --allocation-pool \
  start=192.168.1.155,end=192.168.1.180 \
  --disable-dhcp \
  --gateway 192.168.1.1  \
  192.168.1.0/24
neutron router-create router1
neutron router-gateway-set router1 ext-net

echo "Create overcloud internal (openshift) subnet"
neutron net-create int
neutron subnet-create int 30.0.0.0/24 --dns_nameservers list=true 8.8.8.8

internal_subnet_id=$(neutron subnet-list | grep 30.0.0.0/24 | awk '{print $2}')
neutron router-interface-add router1 $internal_subnet_id