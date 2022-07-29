#!/bin/bash

CNT=0
echo -n "Enter the archive directory to save the result: "; read DIR

#check directory exists
if [ -d "/tmp/$DIR" ]; then
  echo "Directory /tmp/$DIR already exists."
  cd /tmp/$DIR
  CNT=$(ls -al /tmp/$DIR | grep -i "run" | wc -l)
  CNT=$(($CNT+1))
  mkdir /tmp/$DIR/run$CNT
  FDIR="/tmp/$DIR/run$CNT"
else
  mkdir -p /tmp/$DIR/run1
  FDIR="/tmp/$DIR/run1"
fi

echo "CBT is now running, this will take some time ..."
./cbt.py --archive=$FDIR /home/cephuser/cbt/10x-clients/5x-osd/128_readwrite.yml

echo -e "\nCBT run is finished !!!"
echo -e "\nCheck result stored in this folder $FDIR"
