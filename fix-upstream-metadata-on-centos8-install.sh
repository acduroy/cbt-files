#!/bin/bash
# Description: two methods to use in fixing metadata app stream error on centos 8

echo "There are 2 ways to fix the Upstream metadata error on Centos8:"
echo "1 - change URL repo to vault.centos.org"
echo "2 - migrate to centos stream"
echo -n "Please choose what method to implement: [1] or [2]: "; read WAYS

if [ $WAYS -eq 1 ]; then
  # Method1 - to change the repo URL pointing from official CentOS URL to vault.centos.org
  # Ref: https://www.cyberithub.com/solved-failed-to-download-metadata-for-repo-appstream/
  cd /etc/yum.repos.d/
  sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
  sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
  sudo dnf update -y
elif [ $WAYS -eq 2 ]; then
  # Method2 - to migrate to centos stream
  # Ref: https://haydenjames.io/fix-error-failed-to-download-metadata-for-repo-appstream-centos-8/
  sudo dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
  sudo dnf distro-sync
else
  echo "Please choose only either 1 or 2, thanks..."
fi
