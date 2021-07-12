#!/bin/bash
set -ex
apt-get update
#apt-get install -y build-essential
apt-get build-dep -y nginx

mkdir nginx; cd nginx
tar -zxvf ../tip.tar.gz 
njs_dir=`ls -d njs-*`
apt-get source  nginx
cd nginx-*/
perl -pi -e 's/(.*--add-dynamic-module=)(.*?http-echo)\s*$/$1$2 \\\n$1\$(CURDIR)\/..\/njs-42fdcacfd131\/nginx/g' debian/rules
dpkg-buildpackage -b
