#!/bin/bash
source /home/stack/stackrc 

echo "Clearing ports"
for ironic_port in $(ironic port-list | grep -P "\d" | awk '{print $2}')
do
  # echo Deleting port $ironic_port
  ironic port-delete $ironic_port
done

ironic node-list | grep -i "none" | awk '{print $2}' | xargs ironic node-delete