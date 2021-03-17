#!/bin/bash
if [ ! -e "/.dockerenv" ] ;then
  exit 1
fi
export TZ="Asia/Shanghai"
set -o vi
set -e

if [ "-$ASROOT-" = '--' ];then
uid=`ls -nd /data|awk '{print $3}'`
gid=`ls -nd /data|awk '{print $4}'`
#echo $uid $gid
groupadd --gid $gid -f g0
useradd -o --uid $uid --gid $gid --no-create-home --home-dir /root u0
usermod -a -G root u0
chown -R u0:g0 /root
  sed -i 's/mesg/#mesg/g' /root/.profile
  runuser -u u0 -- $@
else
  exec $@
fi

