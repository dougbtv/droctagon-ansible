# This template borrowed from http://people.redhat.com/roxenham/three-nics-vlans.tar.bz2
# And modified by me (@dougbtv)

---
This directory contains Heat templates to help configure
VLANs in an environment with multiple NICs for each overcloud role.

The templates also specify the external/public API access on a
dedicated flat network on the controller, using the standard br-ex
bridge name. The configurations assume the following-

**eth0/nic1** is PXE/management (ctlplane)

**eth1/nic2** is a trunked VLAN interface

**eth2/nic3** is the public API/external network on the native VLAN (flat)

The templates use "br-isolated" as the name of the bridge for the isolated
VLANs. If using Neutron VLAN mode networking, this bridge should be named
in the bridge_mappings parameter in ovs_neutron_plugin.ini:

    bridge_mappings = datacentre:br-ex,tenantvlan:br-isolated

Then the tenant VLAN ranges should be set in plugin.ini, e.g.:

    network_vlan_ranges: tenantvlan:200:1000


Configuration
-------------

To make use of these templates create a Heat environment that looks
something like this:

resource\_registry:
OS::TripleO::BlockStorage::Net::SoftwareConfig: network/config/three-nics-vlans/cinder-storage.yaml
OS::TripleO::Compute::Net::SoftwareConfig: network/config/three-nics-vlans/compute.yaml
OS::TripleO::Controller::Net::SoftwareConfig: network/config/three-nics-vlans/controller.yaml
OS::TripleO::ObjectStorage::Net::SoftwareConfig: network/config/three-nics-vlans/swift-storage.yaml
OS::TripleO::CephStorage::Net::SoftwareConfig: network/config/three-nics-vlans/ceph-storage.yaml

Or use this Heat environment file:

environments/net-three-nics-vlans.yaml
