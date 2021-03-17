#!/bin/bash
if [ "$1" = "root" ];then
ASROOT="-e ASROOT=1"
else
ASROOT=""
fi
echo $ASROOT
docker run -it --rm -v `pwd`:/data \
  --entrypoint /data/entrypoint.sh \
  -p 8383:3000 \
  $ASROOT nanoc-markdown:4.12.0 bash -l

