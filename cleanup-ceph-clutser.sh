#!/bin/bash

    # formatting drives
for i in nvme1n1 nvme2n1 nvme3n1 nvme4n1 nvme5n1 nvme6n1 nvme7n1 nvme8n1 nvme9n1 nvme0n1
do
  ansible -i /home/cephuser/ceph-ansible/hosts osds -a "sudo sfdisk --delete  /dev/$i"
  ansible -i /home/cephuser/ceph-ansible/hosts osds -a "sudo sgdisk --zap-all  /dev/$i"
  ansible -i /home/cephuser/ceph-ansible/hosts osds -a "sudo wipefs /dev/$i -af"
done

    # deleting ceph files
ansible-playbook cleanup-ceph-cluster.yaml -i /home/cephuser/ceph-ansible/hosts
