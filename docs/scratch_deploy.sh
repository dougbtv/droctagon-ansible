
[stack@undercloud ~]$ openstack overcloud deploy   --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage   --templates ~/my_templates   -e ~/my_templates/network-environment.yaml   -e ~/my_templates/environments/network-isolation.yaml   --compute-scale 0   --control-scale 1

# ---------------------------------

# my default one.

openstack overcloud deploy \
  --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
  --templates ~/my_templates \
  -e ~/my_templates/network-environment.yaml \
  -e ~/my_templates/environments/network-isolation.yaml \
  --compute-scale 0 \
  --control-scale 1


# -------------------------------

# controls

openstack overcloud deploy \
  --templates ~/my_templates \
  --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
  --compute-scale 0 \
  --control-scale 1



openstack overcloud deploy \
  --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
  --templates ~/my_templates \
  -e ~/my_templates/network-environment.yaml \
  --compute-scale 0 \
  --control-scale 1

# ---------------------------------

# just isolation, osp-d style.

openstack overcloud deploy \
  --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
  --templates ~/my_templates \
  -e ~/my_templates/environments/network-isolation.yaml \
  --compute-scale 0 \
  --control-scale 1