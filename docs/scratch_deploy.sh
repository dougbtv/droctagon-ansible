# -------------- for some damn reason when I would do both compute and control at once, there'd be a shitty situation where controller wouldn't 
# have the right default route.
# so I'm busting it into two moves for the short time being

openstack overcloud deploy \
   --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
   --templates ~/my_templates \
   -e ~/my_templates/network-environment.yaml \
   -e ~/my_templates/environments/network-isolation.yaml \
   --compute-scale 0 \
   --control-scale 1 && \
openstack overcloud deploy \
   --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
   --templates ~/my_templates \
   -e ~/my_templates/network-environment.yaml \
   -e ~/my_templates/environments/network-isolation.yaml \
   --compute-scale 1 \
   --control-scale 1

# ----------------------------------- add in the compute node

openstack overcloud deploy \
   --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
   --templates ~/my_templates \
   -e ~/my_templates/network-environment.yaml \
   -e ~/my_templates/environments/network-isolation.yaml \
   --compute-scale 1 \
   --control-scale 1

# ---------------------------------- this is the one that worked.

openstack overcloud deploy \
   --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage \
   --templates ~/my_templates \
   -e ~/my_templates/network-environment.yaml \
   -e ~/my_templates/environments/network-isolation.yaml \
   --compute-scale 0 \
   --control-scale 1


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